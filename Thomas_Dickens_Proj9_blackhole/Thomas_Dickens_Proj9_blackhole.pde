PImage eh;
BlackHole superMassive;
Planetoid inTheBeginning;

void setup(){
 size(926,741, P3D);
 superMassive = new BlackHole(100, 25);
  //public Planetoid(float mass, float radius, float offset){
 inTheBeginning = new Planetoid(500, 50, 50);
 
 eh = loadImage("eventHorizon2.jpg");
}

void draw(){
 background(eh);
 superMassive.collapse();
 
 translate(width/2, height/2, 0);
 rotateZ(frameCount*0.02);
 inTheBeginning.creation();
 
}
