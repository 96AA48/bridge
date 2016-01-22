package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;
import com.haxepunk.HXP;

class Car extends Entity {
  public override function new() {
    super(0, 0);
    var side:Int = Math.floor(Math.random() * 1000);
    car = cars[Math.floor(Math.random() * cars.length)];

    this.y = HXP.height - 30;
    speed = Math.random() + 1;

    sprite = new Image("graphics/" + car + ".png");
    if (car == "green_truck") this.y -= 13;
    graphic = sprite;
    this.layer = -1;


    if (side < 500) {
      this.x = sprite.width * -1;
      sprite.flipped = true;
    }
    else {
      this.x = HXP.width + sprite.width;
      this.y -= 10;
      this.layer = 0;
    }
  }

  public override function update() {
    if (sprite.flipped == true) {
      this.x += speed;
    }
    else {
      this.x -= speed;
    }

    if (this.x > HXP.width + sprite.width + 1 || this.x + sprite.width < 0) {
      HXP.scene.remove(this);
    }
  }

  private var sprite:Image;
  private var car:String;
  private var cars:Array<String> = [
    "red_car",
    "blue_car",
    "green_truck",
    "yellow_cab"
  ];
  private var speed:Float;
}
