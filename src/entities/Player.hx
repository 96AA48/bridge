package entities;

import com.haxepunk.HXP;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

import entities.Physics;
import entities.Bullet;

class Player extends Physics {
  public override function new() {
    super(200, 200);
    sprite = new Spritemap("graphics/player_2.png", 10, 17);
    layer = -1;

    sprite.add('idle', [0]);
    sprite.add('walking', [1, 2], 5);
    sprite.add('shooting_walking', [3, 4], 5);
    sprite.add('shooting', [6]);

    graphic = sprite;

    sprite.play('idle');
  }

  public override function update() {
    super.update();
    input();
  }

  private function input() {
    if (Input.check(Key.LEFT)) {
      if (sprite.currentAnim != 'walking') sprite.play('walking');
      this.x -= 1;
      sprite.flipped = true;
    }
    else if (Input.check(Key.RIGHT)) {
      if (sprite.currentAnim != 'walking') sprite.play('walking');
      this.x += 1;
      sprite.flipped = false;
    }
    else {
      sprite.play('idle');
    }

    if (Input.pressed(Key.UP) && grounded) {
      this.speedY = -2;
    }

    if (Input.pressed(Key.SPACE)) {
      shoot();
    }
  }

  private function shoot() {
    HXP.scene.add(new Bullet(this.x, this.y + 4, sprite.flipped));
  }

  private var sprite:Spritemap;
}
