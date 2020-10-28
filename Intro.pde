public class Intro extends RenderedObject {

  float gravity = 3;    // vitesse de chute
  float size = 10;      // rayon de la graine
  boolean is_planted = false; // Est-ce que la graine a été plantée ?

  Intro (float pos_x, float pos_y) {
    super();
    position.x = pos_x;
    position.y = pos_y;
  }

  public void draw() {
    // Si la graine a déjà été plantée, on ne fait rien
    if (is_planted) return;

    // Si graine au-dessus du sol, elle descend
    if (position.y < height-niv_sol+size) {    
      position.y += gravity;
    } 

    if (position.y >= height-niv_sol+size && !is_planted) {   // si touche sol, la plante pousse
      is_planted = true;
      new Plant_start (position.x, position.y);
    }

    fill(rouge);

    if (is_planted == true )
    {
      noStroke();
      fill (noir);
      circle(renderedPosition.x, renderedPosition.y, size);   // dessin graine
    }

    if (is_planted == false )
    {
      noStroke();
      fill (rouge);
      circle(renderedPosition.x, renderedPosition.y, size);   // dessin graine
    }
    println("lol: ", is_planted);
  }
}
