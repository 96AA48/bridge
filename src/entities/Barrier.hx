package entities;

import com.haxepunk.Entity;
import com.haxepunk.masks.Polygon;
import com.haxepunk.masks.Masklist;

class Barrier extends Entity {
  public override function new() {
    super(0, 60);

    mask = new Masklist([
      Polygon.createFromArray([
        300, 172,
        300, 158,
        317, 127,
        322, 127,
        340, 158,
        340, 172
      ]),
      Polygon.createFromArray([
        319, 172,
        319, 300,
        321, 300,
        321, 172
      ])
    ]);

    type = "barrier";
  }
}
