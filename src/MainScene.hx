import com.haxepunk.Scene;

import environment.Clouds;
import environment.Background;
import environment.Tower;
import environment.TowerBackdrop;

import controllers.CarSpawner;

import entities.PlayerRed;
import entities.PlayerGreen;
import entities.Ground;

class MainScene extends Scene
{
	public override function begin()
	{
		add(new PlayerGreen());
		add(new PlayerRed());

		add(new CarSpawner());

		add(new Clouds());
		add(new TowerBackdrop());
		add(new Ground());
		add(new Tower());
		add(new Background());
	}
}
