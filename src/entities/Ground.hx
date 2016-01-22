package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Ground extends Entity {
  public override function new() {
      super(0, HXP.height - 24);
      setHitbox(HXP.width, 6);
      originY = -6;
      graphic = Image.createRect(HXP.width, 24, 0x5A5A5A);
  }
}
