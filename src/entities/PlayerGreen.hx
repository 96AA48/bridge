package entities;

import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;

import entities.Player;

class PlayerGreen extends Player {
  public override function new() {
    super(500, 0);
    sprite = new Spritemap("graphics/player_1.png", 10, 17);
    layer = -1;

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
  }


  private function bomb() {
    HXP.scene.add(new Bomb(this.x + 10, this.y + 4, 1));
  }

  private function input() {
    if (Input.check(Key.LEFT)) {
      walkLeft();
    }
    else if (Input.check(Key.RIGHT)) {
      walkRight();
    }
    else {
      if (waitIdle < 0) sprite.play('idle');
    }

    if (collide('cable', this.x, this.y) != null && Input.check(Key.UP)) {
      this.y -= 2;
      speedY = 0;
    }

    if (Input.pressed(Key.UP) && (grounded || bridged)) {
      jump();
    }

    /*if (Input.pressed(Key.SPACE)) {
      shoot();
    }*/

    if (Input.pressed(Key.DOWN)) {
      bomb();
    }
  }
}
