PImage plant3_petale;
PImage plant3_petale_mirror;

void setup(){
  size(1200,600);
  plant3_petale = loadImage("plant3_petale.png");
  plant3_petale_mirror = loadImage("plant3_petale_mirror.png");
}

void draw(){
  background(255);
  seed_1.fall();
  decor();
}

seed seed_1 = new seed();
plant plant_1 = new plant();
plant2 plant_2 = new plant2();
plant3 plant_3 = new plant3();


public int niv_sol=500;
public color rouge = color(255, 0, 0);
public color noir = color(0);
