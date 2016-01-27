package environment;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Polygon;
import com.haxepunk.masks.Masklist;

class Tower extends Entity {
  public override function new() {
    super(0, 60);
    graphic = new Image("graphics/towers_front.png");
    this.layer = -2;

    mask = new Masklist([Polygon.createFromArray([
      56, 56,
      290, 172,
      290, 178,
      56, 62
    ]),
    Polygon.createFromArray([
      290, 172,
      350, 172,
      350, 178,
      290, 178
    ]),
    Polygon.createFromArray([
      350, 172,
      582, 56,
      582, 62,
      350, 178
    ])]);

    type = "ground";
  }

  public override function update() {
    super.update();
  }

}
