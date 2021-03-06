package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.graphics.Text;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.masks.Polygon;
import com.haxepunk.Sfx;

import entities.Physics;
import entities.Bullet;
import entities.Bomb;

import scenes.EndScene;

class Player extends Physics {
  public override function new(x:Float, y:Float) {
    super(x, y);

    healthMarker = new Text(health + '', 1, -18, null, null, {color: 0xFFFFFF, size: 14});
    hurtSound = new Sfx('audio/hurt.wav');
    bridgeable = true;
  }

  public override function update() {
    super.update();

    if (collide('car', this.x, this.y) != null && invulnarable <= 0) {
      if (this.y < 240 && bridgeDelta <= 0) fall();
      hurt();
    }

    if (bridgeDelta > 0) bridgeable = false;
    else bridgeable = true;

    if (invulnarable > 0 && invulnarable % .5 < .2) sprite.alpha = 0;
    else sprite.alpha = 1;

    if (health == 0) {
      die();
    }

    bridgeDelta -= HXP.elapsed;
    waitIdle -= HXP.elapsed;
    invulnarable -= HXP.elapsed;
  }

  private function die() {
    HXP.scene = new EndScene(this.type);
  }

  private function walkLeft() {
    if (sprite.currentAnim != 'walking') sprite.play('walking');

    if (this.x > 55 && collide("barrier", this.x - 1, this.y) == null) {
      this.x -= 1;
      if (collide("bridge", this.x - 1, this.y) != null) this.y -= .5;
      sprite.flipped = true;
    }
  }

  private function walkRight() {
    if (sprite.currentAnim != 'walking') sprite.play('walking');
    if (this.x < 580 && collide("barrier", this.x + 1, this.y) == null) {
      this.x += 1;
      if (collide("bridge", this.x + 1, this.y) != null) this.y -= .5;
      sprite.flipped = false;
    }
  }

  private function shoot() {
    HXP.scene.add(new Bullet(this.x, this.y + 4, sprite.flipped));

    /*if (sprite.currentAnim == 'idle') {*/
      sprite.play('shooting');
      waitIdle = .5;
    /*}*/
  }

  public function hurt() {
    this.health -= 1;
    invulnarable = 2;
    
    hurtSound.play(0.3);

    healthMarker.text = health + '';
  }

  private function fall() {
    addForce(-4);
    bridgeDelta = 1.5;
    bridged = false;
  }

  private function jump() {
    addForce(-2);
  }

  public var health:Int = 3;
  public var invulnarable:Float = 0;
  private var healthMarker:Text;
  private var bridgeDelta:Float = 0;
  private var sprite:Spritemap;
  private var waitIdle:Float = .5;
  private var hurtSound:Sfx;
}
