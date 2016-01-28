package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Cable extends Entity {
  public override function new(x:Float, y:Float) {
    super(x, y + 120);

    graphic = Image.createRect(3, 220, 0xFFF000);
    setHitboxTo(graphic);
    
    type = "cable";
  }
}
