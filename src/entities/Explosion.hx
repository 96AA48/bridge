package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Circle;

class Explosion extends Entity {
  public override function new(x:Float, y:Float) {
    super(x, y);

    sprite = Image.createCircle(300, 0xFF0000);
    sprite.scale = .01;
    graphic = sprite;

    hitbox = new Circle(3);
    mask = hitbox;

    centerOrigin();
    sprite.centerOrigin();

    type = "explosion";
  }

  public override function update() {
    super.update();

    var collide:Dynamic = collide("car", this.x, this.y);
    if (collide != null) collide.addForce(-4);

    sprite.scale += .1;
    hitbox.radius += 20;

    if (sprite.scale > .5) HXP.scene.remove(this);
  }

  private var sprite:Image;
  private var hitbox:Circle;
}
