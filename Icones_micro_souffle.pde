/*PImage icones;
PImage[] images = new PImage [54];

public class Icones extends RenderedObject {

  Icones (float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
  }

  int numFrames = 54;
  int currentFrame = 0;

  void setup() {
    for (int i = 0; i < 54; i ++) 
    {
      String icones = "souffle_micro_" + nf(i, 5) + ".png";
      images[i] = loadImage(icones);
    }
  }
  void draw() { 
    currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
    int offset = 0;
    for (int x = -100; x < width; x += images[0].width) { 
      image(images[1], position.x, position.y);
      offset+=2;
    }
  }
}
*/
