package environment;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Backdrop;

class Background extends Entity {
  public override function new() {
    super(0, 0);
    graphic = new Backdrop("graphics/background.png");
    layer = 1;
  }
}
