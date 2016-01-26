package environment;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Polygon;

class Tower extends Entity {
  public override function new() {
    super(0, 60);
    graphic = new Image("graphics/towers_front.png");
    this.layer = -2;

    /*var poly:Polygon = Polygon.createFromArray([
      56, 56,
      290, 172,
      350, 172,
      582, 56,
      582, 62,
      355, 178,
      284, 178,
      56, 62
    ]);*/

    mask = Polygon.createFromArray([
        290, 172,
        350, 172,
        350, 178,
        290, 178
    ]);

    type = "ground";
  }

}
