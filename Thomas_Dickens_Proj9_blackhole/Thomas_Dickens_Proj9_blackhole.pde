PImage eh;
PImage earthTex;
PImage moonTex;
BlackHole superMassive;
Planetoid inTheBeginning;
Earth earthTest;
FastBody fastTest;

void setup(){
 size(926,741, P3D);
 
 //textures
  //background
 eh = loadImage("eventHorizon2.jpg");
 earthTex = loadImage("earth.jpeg");
 moonTex = loadImage("moon.jpeg");
 
 //obejects
 superMassive = new BlackHole(100, 25);
  //public Planetoid(float mass, float radius, float offset){
 //inTheBeginning = new Planetoid(50, 50, 50);
 earthTest = new Earth(60, 60, 60);
 earthTest.spawnMoon();
 fastTest = new FastBody(15, 10,0.5);
 


}

void draw(){
 background(eh);
 superMassive.collapse();
 
  fastTest.genShape();
 
 // rotation for any Planetoid objects
 translate(width/2, height/2, 0);
 rotateZ(frameCount*0.02);

   //inTheBeginning.creation();
   earthTest.creation(earthTex);
   earthTest.moon.creation(moonTex);
   earthTest.fall();
   earthTest.moon.fall();
   

   
// control the drawing
//  if (mousePressed){
//  ctrl.tempKillPlanetoid(true);
//  } else {ctrl.tempKillPlanetoid(false);}
  
}
