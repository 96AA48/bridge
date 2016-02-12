package entities;

import com.haxepunk.Entity;
import com.haxepunk.HXP;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.utils.Input;
import com.haxepunk.utils.Key;

import scenes.BridgeScene;

class Restart extends Entity {
  public override function new() {
    super(HXP.halfWidth, HXP.halfHeight + 90);

    text = new Text('Restart', null, null, null, null, {size: 40, color: 0xFFFFFF});
    sprite = Image.createRect(200, 75, 0xAC1700);

    text.centerOrigin();
    sprite.centerOrigin();

    addGraphic(sprite);
    addGraphic(text);

    setHitboxTo(sprite);

    layer = -10;
  }

  public override function update() {
    super.update();
    var clicked = Input.mouseX > this.left && Input.mouseX < this.right && Input.mouseY > this.top && Input.mouseY < this.bottom;

    if ((Input.mouseReleased && clicked) || Input.released(Key.SPACE)) {
      HXP.scene = new BridgeScene();
    }

  }

  private var text:Text;
  private var sprite:Image;
}
