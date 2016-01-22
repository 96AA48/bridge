package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Car extends Entity {
  public override function new() {
    super(0, HXP.height - 22);

    sprite = new Image("graphics/red_car.png");
    graphic = sprite;
    sprite.flipped = true;
  }

  public override function update() {
    if (sprite.flipped == true) {
      this.x += 1;
    }
    else {
      this.x -= 1;
    }

    if (this.x > HXP.width || this.x < 0) {
      if (sprite.flipped == true) { sprite.flipped = false; };
      else { sprite.flipped = true; };
    }
  }

  private var sprite:Image;
}
