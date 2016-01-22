import com.haxepunk.Scene;

import environment.Clouds;
import environment.Background;
import environment.Tower;
import environment.TowerBackdrop;

import controllers.CarSpawner;

import entities.Player;
import entities.Ground;
import entities.Physics;

class MainScene extends Scene
{
	public override function begin()
	{
		/*add(new Physics());*/
		add(new Player());
		/*add(new CarSpawner());*/

		add(new Clouds());
		add(new TowerBackdrop());
		add(new Ground());
		add(new Tower());
		add(new Background());
	}
}
