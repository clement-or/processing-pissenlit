public class Icones extends RenderedObject {

  PImage icones;
  PImage[] images = new PImage [54];

  int numFrames = 54;
  int currentFrame = 0;
  
  float printRatio = 0.4;

  Icones (float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
    for (int i = 0; i < 54; i ++) {
      String icones = "souffle_micro_" + nf(i, 5) + ".png";
      images[i] = loadImage(icones);
    }
  }

  void draw() { 
    imageMode(CENTER);
    currentFrame = (currentFrame+1) % numFrames;  // Use % to cycle through frames
    for (int x = -100; x < width; x += images[0].width) { 
      image(images[currentFrame], renderedPosition.x, renderedPosition.y, images[currentFrame].width * printRatio, images[currentFrame].height * printRatio);
    }
  }
}
