package environment;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class TowerBackdrop extends Entity {
  public override function new() {
    super(0, 36);
    graphic = new Image("graphics/towers_back.png");
  }
}
