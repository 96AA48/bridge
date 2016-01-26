package entities;

import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

import entities.Physics;

class Bomb extends Physics {
  public override function new() {
    super(180, 100);

    sprite = Image.createCircle(3, 0xFF0000);
    explode_sprite = Image.createCircle(3, 0x00FF00);
    graphic = sprite;
    setHitboxTo(sprite);
    bouncy = true;
  }

  public override function update() {
    super.update();
    explodeTime -= HXP.elapsed;
    if (explodeTime > 1 && explodeTime % .5 < .2) graphic = explode_sprite;
    else if (explodeTime < 1 && explodeTime % .05 < .02) graphic = explode_sprite;
    else graphic = sprite;

    if (explodeTime <= 0) {
      /*HXP.scene.add(new Explosion(this.x, this.y));*/
      HXP.scene.remove(this);
    }
  }

  private var explodeTime:Float = 2.5;
  private var sprite:Image;
  private var explode_sprite:Image;
}
