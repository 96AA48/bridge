package scenes;

import com.haxepunk.Scene;

import environment.Clouds;
import environment.Background;
import environment.Tower;
import environment.TowerBackdrop;

import controllers.CarSpawner;

import entities.Ground;
import entities.EndText;
import entities.Restart;

class EndScene extends Scene
{
  public override function new(playerLost:String) {
    super();

    if (playerLost == 'red') playerWon = 'Green';
    else playerWon = 'Red';
  }

	public override function begin()
	{
    add(new EndText(playerWon));
    add(new Restart());
		add(new CarSpawner());

		add(new Clouds());
		add(new TowerBackdrop());
		add(new Ground());
		add(new Tower());
		add(new Background());
	}

  private var playerWon:String;
}
