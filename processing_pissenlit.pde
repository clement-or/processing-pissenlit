PImage plant3_petale;
PImage plant3_petale_mirror;

import processing.sound.*;
AudioIn mic;   // mic est déclaré comme canal audio
public Amplitude amp; // idem, "amplitude" en audio ~= volume du son

void setup(){
  size(1200,600);
  plant3_petale = loadImage("plant3_petale.png");
  plant3_petale_mirror = loadImage("plant3_petale_mirror.png");
  mic = new AudioIn(this,0); // on n'utilise que le micro de gauche s'il y en a 2 :/
  mic.start(); // on allume le micro
  amp = new Amplitude(this);
  amp.input(mic); // on va chercher l'amplitude de mic
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