package environment;

import com.haxepunk.HXP;
import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.masks.Polygon;
import com.haxepunk.masks.Masklist;

import entities.Cable;

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

    HXP.scene.add(new Cable(70, 0));
    HXP.scene.add(new Cable(103, 17));
    HXP.scene.add(new Cable(137, 35));
    HXP.scene.add(new Cable(170, 50));
    HXP.scene.add(new Cable(203, 67));
    HXP.scene.add(new Cable(237, 83));
    HXP.scene.add(new Cable(270, 98));

    HXP.scene.add(new Cable(567, 0));
    HXP.scene.add(new Cable(533, 17));
    HXP.scene.add(new Cable(500, 35));
    HXP.scene.add(new Cable(467, 50));
    HXP.scene.add(new Cable(433, 67));
    HXP.scene.add(new Cable(400, 83));
    HXP.scene.add(new Cable(367, 98));

    type = "bridge";
  }

  public override function update() {
    super.update();
  }

}
