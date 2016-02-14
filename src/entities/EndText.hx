package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class EndText extends Entity {
  public override function new(playerWon:String) {
    super(0, 0);

    var text:Text = new Text('Player ' + playerWon + '\n has won the game!', null, null, null, null, {size: 50, color: 0xFFFFFF, align: 'center'});
    layer = -10;

    text.centerOrigin();

    graphic = text;

    this.x = HXP.halfWidth;
    this.y = HXP.halfHeight - 50;
  }

  private var wonColor:Dynamic;
}
