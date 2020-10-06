PImage plant3_petale;
PImage plant3_petale_mirror;
PImage fond;

import processing.sound.*;
AudioIn mic;   // mic est déclaré comme canal audio
public Amplitude amp; // idem, "amplitude" en audio ~= volume du son

void setup(){
  size(1200,600);
  plant3_petale = loadImage("plant3_petale.png");
  plant3_petale_mirror = loadImage("plant3_petale_mirror.png");
  fond = loadImage("fond.png");
  mic = new AudioIn(this,0); // on n'utilise que le micro de gauche s'il y en a 2 :/
  mic.start(); // on allume le micro
  amp = new Amplitude(this);
  amp.input(mic); // on va chercher l'amplitude du mic
}

void draw(){
  decor();
  seed_1.fall();
}

Seed seed_1 = new Seed();
Plant4 plant_1 = new Plant4();
Plant2 plant_2 = new Plant2();
Plant3 plant_3 = new Plant3();


public int niv_sol=100;
public color rouge = color(255, 0, 0);
public color noir = color(0);
