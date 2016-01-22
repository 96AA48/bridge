package environment;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Clouds extends Entity {
  public override function new() {
    super(200, 75);
    sprite = new Image("graphics/clouds.png");
    graphic = sprite;
  }

  public override function update() {
    this.x -= .125;

    if (this.x + sprite.width < 0) {
      this.x = HXP.width;
    }
  }

  private var sprite:Image;
}
