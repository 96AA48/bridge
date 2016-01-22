package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Clouds extends Entity {
  public override function new() {
    super(200, 75);
    var sprite:Image = new Image("graphics/clouds.png");
    graphic = sprite;
  }

  public override function update() {
    this.x -= .125;
  }
}
