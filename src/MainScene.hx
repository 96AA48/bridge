import com.haxepunk.Scene;
import entities.Clouds;
import entities.Background;
import entities.Tower;
import entities.Car;

class MainScene extends Scene
{
	public override function begin()
	{
		add(new Car());

		add(new Clouds());
		add(new Tower());
		add(new Background());
	}
}
