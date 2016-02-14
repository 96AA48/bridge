package scenes;

import com.haxepunk.Scene;
import com.haxepunk.Sfx;

import environment.Clouds;
import environment.Background;
import environment.Tower;
import environment.TowerBackdrop;

import controllers.CarSpawner;

import entities.Ground;
import entities.EndText;
import entities.Button;

class EndScene extends Scene
{
  public override function new(playerLost:String) {
    super();

    if (playerLost == 'red') playerWon = 'Green';
    else playerWon = 'Red';

    deathSound = new Sfx('audio/death.wav');
  }

	public override function begin()
	{
    deathSound.play();
    add(new EndText(playerWon));
    add(new Button('Restart'));
		add(new CarSpawner());

		add(new Clouds());
		add(new TowerBackdrop());
		add(new Ground());
		add(new Tower());
		add(new Background());
	}

  private var deathSound:Sfx;
  private var playerWon:String;
}
