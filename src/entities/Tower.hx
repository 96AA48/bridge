package entities;

import com.haxepunk.Entity;
import com.haxepunk.graphics.Image;

class Tower extends Entity {
  public override function new() {
    super(0, 65);

    /*back = new Image("graphics/towers_back.png");*/
    front = new Image("graphics/towers_front.png");

    /*addGraphic(back);*/
    addGraphic(front);
  }

  private var back:Image;
  private var front:Image;
}
