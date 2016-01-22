package environment;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Tower extends Entity {
  public override function new() {
    super(0, 60);
    graphic = new Image("graphics/towers_front.png");
    this.layer = -2;
  }
}
