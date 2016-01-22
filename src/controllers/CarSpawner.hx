package controllers;

import com.haxepunk.Entity;
import com.haxepunk.HXP;

import entities.Car;

class CarSpawner extends Entity {
    public override function update() {
      super.update();
      timePassed += HXP.elapsed;

      if (timePassed > nextTime) {
        HXP.scene.add(new Car());
        timePassed = 0;
        nextTime = 1 + (Math.random() * 3);
      }
    }

    private var timePassed:Float = 0;
    private var nextTime:Float = 0;
}
