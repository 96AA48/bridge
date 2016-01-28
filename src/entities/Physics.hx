package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.Sfx;

class Physics extends Entity {
  public override function new(x:Float, y:Float) {
    super(x, y);
    layer = -1 ;
  }

  public override function update() {
    super.update();

    if (!grounded && !bridged) speedY += (9.81 * HXP.elapsed);
    if (!grounded && collide("ground", this.x, this.y) != null) {
      grounded = true;

      if (bouncy && speedY > 1)  {
        speedY /= -3;
        bounce.play(1);
      }
      else speedY = 0;
    }

    if (grounded && collide("ground", this.x, this.y) == null) {
      grounded = false;
    }

    if (bridgeable) {
      if (!bridged && collide("bridge", this.x, this.y) != null) {
        bridged = true;

        if (bouncy && speedY > 1)  {
          speedY /= -3;
          bounce.play(1);
        }
        else speedY = 0;
      }

      if (collide("bridge", this.x, this.y) == null) {
        bridged = false;
      }
    }

    this.y += speedY;
  }

  public function addForce(force:Float) {
    this.speedY += force;
  }

  public var grounded:Bool = false;
  public var bridged:Bool = false;
  public var bridgeable:Bool = false;

  private var bounce:Sfx = new Sfx("audio/bounce.wav");

  private var bouncy:Bool = false;
  private var speedY:Float = -2;
}
