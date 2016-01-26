package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

class Explosion extends Entity {
  public override function new(x:Float, y:Float) {
    super(x, y);

    sprite = Image.createCircle(3, 0xFF0000);
    graphic = sprite;
    centerOrigin();
    sprite.centerOrigin();
  }

  public override function update() {
    super.update();

    sprite.scale += 10;

    if (sprite.scale > 60) HXP.scene.remove(this);
  }

  private var sprite:Image;
}
