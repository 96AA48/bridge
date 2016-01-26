import com.haxepunk.Scene;

import environment.Clouds;
import environment.Background;
import environment.Tower;
import environment.TowerBackdrop;

import controllers.CarSpawner;

import entities.Player;
import entities.Ground;
import entities.Physics;
import entities.Bomb;

class MainScene extends Scene
{
	public override function begin()
	{
		/*add(new Physics(100, 100));*/
		add(new Player());
		/*add(new CarSpawner());*/
		add(new Bomb());

		add(new Clouds());
		add(new TowerBackdrop());
		add(new Ground());
		add(new Tower());
		add(new Background());
	}
}
