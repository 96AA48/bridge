package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Bullet extends Entity {
  public override function new(x:Float, y:Float, flipped) {
    super(x, y);

    sprite = new Image("graphics/" + bullets[3] + "_bullet.png");
    sprite.flipped = flipped;

    graphic = sprite;
  }

  public override function update() {
    super.update();

    if (sprite.flipped) this.x -= 10;
    else this.x += 10;
  }

  private var sprite:Image;
  private var bullets:Array<String> = [
    "blue",
    "green",
    "pink",
    "red"
  ];
}
