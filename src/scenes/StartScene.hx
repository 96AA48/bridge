package scenes;

import com.haxepunk.Scene;

import environment.Clouds;
import environment.Background;
import environment.Tower;
import environment.TowerBackdrop;

import controllers.CarSpawner;

import entities.Ground;
import entities.EndText;
import entities.Button;

class StartScene extends Scene
{
  public override function new() {
    super();
  }

	public override function begin()
	{
    add(new Button('Start'));
		add(new CarSpawner());

		add(new Clouds());
		add(new TowerBackdrop());
		add(new Ground());
		add(new Tower());
		add(new Background());
	}
}
