package entities;

import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.HXP;

import entities.Player;

class PlayerRed extends Player {
  public override function new() {
    super(60, 0);
    sprite = new Spritemap("graphics/player_2.png", 10, 17);
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
    HXP.scene.add(new Bomb(this.x + 10, this.y + 4, 2));
  }

  private function input() {
    if (Input.check(Key.A)) {
      walkLeft();
    }
    else if (Input.check(Key.D)) {
      walkRight();
    }
    else {
      if (waitIdle < 0) sprite.play('idle');
    }

    if (collide('cable', this.x, this.y) != null && Input.check(Key.W)) {
      this.y -= 2;
      speedY = 0;
    }

    if (Input.pressed(Key.W) && (grounded || bridged)) {
      jump();
    }

    /*if (Input.pressed(Key.SPACE)) {
      shoot();
    }*/

    if (Input.pressed(Key.S)) {
      bomb();
    }
  }
}
