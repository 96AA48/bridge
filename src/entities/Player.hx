package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.masks.Polygon;

import entities.Physics;
import entities.Bullet;
import entities.Bomb;

class Player extends Physics {
  public override function new(x:Float, y:Float) {
    super(x, y);

    bridgeable = true;

    type = "player";
  }

  public override function update() {
    super.update();

    if (collide('car', this.x, this.y) != null && this.y < 240 && bridgeDelta <= 0) fall();

    if (bridgeDelta > 0) bridgeable = false;
    else bridgeable = true;

    bridgeDelta -= HXP.elapsed;
    waitIdle -= HXP.elapsed;
  }

  private function bomb() {
    HXP.scene.add(new Bomb(this.x + 10, this.y + 4));
  }

  private function walkLeft() {
    if (sprite.currentAnim != 'walking') sprite.play('walking');
    if (this.x > 55) this.x -= 1;
    if (collide("bridge", this.x - 1, this.y) != null) this.y -= .5;
    sprite.flipped = true;
  }

  private function walkRight() {
    if (sprite.currentAnim != 'walking') sprite.play('walking');
    if (this.x < 580) this.x += 1;
    if (collide("bridge", this.x + 1, this.y) != null) this.y -= .5;
    sprite.flipped = false;
  }

  private function shoot() {
    HXP.scene.add(new Bullet(this.x, this.y + 4, sprite.flipped));

    /*if (sprite.currentAnim == 'idle') {*/
      sprite.play('shooting');
      waitIdle = .5;
    /*}*/
  }

  private function fall() {
    addForce(-4);
    bridgeDelta = 1.5;
    bridged = false;
  }

  private function jump() {
    addForce(-2);
  }

  private var bridgeDelta:Float = 0;
  private var sprite:Spritemap;
  private var waitIdle:Float = .5;
}
