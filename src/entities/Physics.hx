package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;

import entities.Ground;

class Physics extends Entity {
  public override function new(x:Float, y:Float) {
    super(x, y);
    setHitbox(25, 25);
    graphic = Image.createRect(25, 25, 0xFF0000);
    layer = -1 ;
  }

  public override function update() {
    super.update();

    if (!grounded) speedY += (9.81 * HXP.elapsed);
    if (!grounded && collide("ground", this.x, this.y) != null) {
      grounded = true;
      
      if (bouncy && speedY > 1) speedY /= -3
      else speedY = 0;
    }

    if (grounded && collide("ground", this.x, this.y) == null) {
      grounded = false;
    }

    this.y += speedY;
  }

  public var grounded:Bool = false;
  private var bouncy:Bool = false;
  private var speedY:Float = -2;
}
