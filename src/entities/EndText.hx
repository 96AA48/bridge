package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Text;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class EndText extends Entity {
  public override function new(playerWon:String) {
    super(0, 0);

    //FIXME: Fix the colors
    /*if (playerWon == 'red') wonColor = 0xAC1700;
    else wonColor = 0x00AC38;*/

    var text:Text = new Text('Player ' + playerWon + '\n has won the game!', null, null, null, null, {size: 50, color: 0xFFFFFF, align: 'center'});
    layer = -10;

    text.centerOrigin();

    graphic = text;

    this.x = HXP.halfWidth;
    this.y = HXP.halfHeight;
  }

  private var wonColor:Dynamic;
}
