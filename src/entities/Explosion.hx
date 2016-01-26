package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Circle;
import com.haxepunk.Sfx;

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

    explosion.play(1);
  }

  public override function update() {
    super.update();

    var car:Dynamic = collide("car", this.x, this.y);
    if (car != null) {
      var angle:Float = Math.atan2(this.x - car.x, this.y - car.y) * 180 / Math.PI;
      car.toAngle(angle);
      car.addForce(-2);

    }

    sprite.scale += .1;
    hitbox.radius += 20;

    if (sprite.scale > .5) HXP.scene.remove(this);
  }

  private var explosion:Sfx = new Sfx("audio/explosion.wav");

  private var sprite:Image;
  private var hitbox:Circle;
}
