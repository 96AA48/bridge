package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;
import com.haxepunk.masks.Circle;
import com.haxepunk.Sfx;

class Explosion extends Entity {
  public override function new(x:Float, y:Float) {
    super(x, y);

    /*sprite = Image.createCircle(300, 0xFF0000);*/
    sprite = new Spritemap("graphics/explosion_x3.png", 150, 150, function () {
        HXP.scene.remove(this);
    });
    sprite.add('boom', [0, 1, 2, 3], 50);
    sprite.scale = 1;
    graphic = sprite;

    hitbox = new Circle(3);
    mask = hitbox;

    centerOrigin();
    sprite.centerOrigin();

    type = "explosion";

    sprite.play('boom');
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

    var bomb:Dynamic = collide("bomb", this.x, this.y);
    if (bomb != null) {
      bomb.addForce(-2);
    }

    hitbox.radius += 20;

    if (hitbox.radius >= 100) HXP.scene.remove(this);
  }

  private var explosion:Sfx = new Sfx("audio/explosion.wav");

  private var sprite:Spritemap;
  private var hitbox:Circle;
}
