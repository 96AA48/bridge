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
  public override function new() {
    super(300, 100);
    sprite = new Spritemap("graphics/player_2.png", 10, 17);
    layer = -1;
    type = "player";

    setHitbox(10, 17);

    sprite.add('idle', [0]);
    sprite.add('walking', [1, 2], 5);
    sprite.add('shooting_walking', [3, 4], 5);
    sprite.add('shooting', [5]);

    graphic = sprite;

    sprite.play('idle');
  }

  public override function update() {
    super.update();
    input();

    waitIdle -= HXP.elapsed;
  }

  private function input() {
    if (Input.check(Key.LEFT)) {
      if (sprite.currentAnim != 'walking') sprite.play('walking');
      if (this.x > 0) this.x -= 1;
      sprite.flipped = true;
    }
    else if (Input.check(Key.RIGHT)) {
      if (sprite.currentAnim != 'walking') sprite.play('walking');
      if (this.x < HXP.width - 1) this.x += 1;
      sprite.flipped = false;
    }
    else {
      if (waitIdle < 0) sprite.play('idle');
    }

    if (Input.pressed(Key.UP) && grounded) {
      addForce(-2);
    }

    if (Input.pressed(Key.SPACE)) {
      shoot();
    }

    if (Input.pressed(Key.DOWN)) {
      HXP.scene.add(new Bomb(this.x + 10, this.y + 4));
    }
  }

  private function shoot() {
    HXP.scene.add(new Bullet(this.x, this.y + 4, sprite.flipped));

    /*if (sprite.currentAnim == 'idle') {*/
      sprite.play('shooting');
      waitIdle = .5;
    /*}*/
  }

  private var sprite:Spritemap;
  private var waitIdle:Float = .5;
}
