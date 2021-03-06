PImage eh;
PImage earthTex;
PImage moonTex;
PImage planTex;
BlackHole superMassive;
Planetoid inTheBeginning;
Earth earthTest;
FastBody[] fastArray = new FastBody[10];
ArrayList planets; 

void setup(){
 size(926,741, P3D);
 
 //textures
  //background
 eh = loadImage("eventHorizon2.jpg");
 earthTex = loadImage("earth.jpeg");
 moonTex = loadImage("moon.jpeg");
 planTex = loadImage("planet.png");
 
 planets = new ArrayList();
 
 //obejects
 superMassive = new BlackHole(100, 25);
  //public Planetoid(float mass, float radius, float offset){
 //inTheBeginning = new Planetoid(50, 50, 50);
 earthTest = new Earth(60, 60, 60);
 earthTest.spawnMoon();
 
 for (int i = 0; i < fastArray.length; i++){
   fastArray[i] = new FastBody(random(15), random(5), random(5));
   
 }
 
 inTheBeginning = new Planetoid(60, 30, 30);


}

void draw(){
 background(eh);
 superMassive.collapse();

    
 for (int i = 0; i < fastArray.length; i++){
   fastArray[i].genShape();
   fastArray[i].pastEventHorizon();   
}

 
 // testing
  // float[] blackHoleVals = superMassive.getBlackHoleLoc();
  
  //fill(0, 255, 0);
  //rect(blackHoleVals[0] - blackHoleVals[2], blackHoleVals[1] - blackHoleVals[2], 10, 10);
  //rect(blackHoleVals[0] + blackHoleVals[2], blackHoleVals[1] - blackHoleVals[2], 10, 10);
  //rect(blackHoleVals[0] - blackHoleVals[2], blackHoleVals[1] + blackHoleVals[2], 10, 10);
  //rect(blackHoleVals[0] + blackHoleVals[2], blackHoleVals[1] + blackHoleVals[2], 10, 10);
 
 // rotation for any Planetoid objects
 translate(width/2, height/2, 0);
 rotateZ(frameCount*0.02);

   //inTheBeginning.creation();
   earthTest.creation(earthTex);
   earthTest.moon.creation(moonTex);
   earthTest.fall();
   earthTest.moon.fall();

  for (int i = planets.size()-1; i >= 0; i--){
    Planetoid a = (Planetoid) planets.get(i);
    a.creation(planTex);
    a.fall();
  }
  
}
void mouseClicked(){
  planets.add(new Planetoid(60, 30, 30));
}
