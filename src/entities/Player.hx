package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Image;
import com.haxepunk.graphics.Spritemap;

class Player extends Entity {
  public override function new() {
    super(HXP.width, 200);
    sprite = new Spritemap("graphics/player.png", 10, 17);
    graphic = sprite;
  }

  public override function update() {
    this.x -= 1;
  }

  private var sprite:Image;
}
