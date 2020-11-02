public class Background extends RenderedObject {
  PImage fond; 
  float ground = 500;

  Background() {
    super();
    position = new PVector(0, 0);
    fond = loadImage("fond.png");
  }

  public void draw() {

    //image(fond, renderedPosition.x, renderedPosition.y);
    //print(renderedPosition);


    background(242, 238, 226);
    fill(0);
    stroke(0);
    strokeWeight(1);
    // Only render a portion of the ground. The ground is infinite
    float groundLevel = renderedPosition.y + ground;
    rect(0, groundLevel, width, height - groundLevel);   //sol

    //line(0,niv_sol,width,niv_sol);
  }
}
