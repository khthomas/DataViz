import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Thomas_Dickens_Proj9_blackhole extends PApplet {

PImage eh;
PImage earthTex;
PImage moonTex;
PImage planTex;
BlackHole superMassive;
Planetoid inTheBeginning;
Earth earthTest;
FastBody[] fastArray = new FastBody[10];
ArrayList planets; 

public void setup(){
 
 
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

public void draw(){
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
 rotateZ(frameCount*0.02f);

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
public void mouseClicked(){
  planets.add(new Planetoid(60, 30, 30));
}
class BlackHole {
  /////////////////////////////////////////////////////////////
  //attributes
  /////////////////////////////////////////////////////////////
  float startingMass;
  float radius;
  float startX = width/2;
  float startY = height/2;
  
  
  // constructors
  public BlackHole(){
    
  }
  
  //overloaded start at center
  public BlackHole(float startingMass, float radius){
   this.startingMass = startingMass;
   this.radius = radius;
   
   //draw the black hole
   //this.collapse();
  }
  
  //overloaded custom starting location
  public BlackHole(float startingMass, float radius, float startX, float startY){
   this.startingMass = startingMass;
   this.radius = radius;
   this.startX = startX;
   this.startY = startY;
   
   //draw the black hole
   //this.collapse();
  }
  
  public void collapse(){
   //this method is basically a draw method, but I wanted it to be black hole themed
   fill(0);
   ellipse(startX, startY, radius + startingMass, radius + startingMass);

  }
  
  public void setMass(float incrament){
   this.startingMass+=incrament;
  }
  
  public float[] getBlackHoleLoc(){
    float x1 = this.startX;
    float halfWidth = (this.radius + this.startingMass) /2;
    float y1 = this.startY;
    float[] output = {x1, y1, halfWidth};
    
    return output;
  }
  
  
  
  
}
class Earth extends Planetoid {
  float mass;
  float radius;
  float offset;
  float angle = 0;
  PShape globe;
  boolean dead = false;
  float baseMass;
  Planetoid moon;
  
  // base constructor
  public Earth(){
  }
  
  //overloaded
  public Earth(float mass, float radius, float offset){
   super(mass, radius, offset);
   this.mass = mass;
   this.baseMass = mass;
   this.radius = radius;
   this.offset = offset;

  }
  
  public void spawnMoon(){
    float moonMass = this.mass / 5;
    float moonRadius = this.radius / 5;
    float moonOffset = this.offset  + this.radius + 10;
     
    //public Planetoid(float mass, float radius, float offset){
    moon = new Planetoid(moonMass, moonRadius, moonOffset);  
    
   
  }

  
  

  
}
class FastBody {
// this class is meant to represent smaller objects that are not nearly as massive as 
//a planet, also they will not orbit the black hole, rather, they will shoot right into it.
//Should have methods such as speed and mass. Might be 2D.
// Lastly, these are mean to come from off screan to simulate shooting starts, or comets
  boolean alive = true;
  float size;
  float speed;
  float mass;
  boolean hasTail = false;
  PShape bodyShape;
  int bodyColor = color(255/2, random(255), 255/2, 255);
  float yAdjust = 0;
  float xAdjust = 0;
  float randomX = random(width/4);
  float randomY = random(height);
  float[] blackHoleVars = superMassive.getBlackHoleLoc();

  float leftXBound = blackHoleVars[0] - blackHoleVars[2];
  float rightXBound = blackHoleVars[0] + blackHoleVars[2];
  float upperYBound = blackHoleVars[1] - blackHoleVars[2];
  float lowerYBound = blackHoleVars[1] + blackHoleVars[2];
  
  float holdingSpeed;
  PImage fastText;

  // Constructors
  
  public FastBody(){
  }
  
  public FastBody(float size, float speed, float mass){
    this.size = size;
    this.speed = speed;
    this.mass = mass;
    this.holdingSpeed = this.speed;
  }
  
  
  public FastBody(float size, float speed, float mass, PImage fastTest){
    this.size = size;
    this.speed = speed;
    this.mass = mass;
    this.fastText = fastText;
  }
  
  // methods
  public void genShape(){
    float xPos = randomX + this.speed;
    float yPos = randomY + this.speed;
    float influence = 2.0f;
    this.killFastBody();

    if (this.alive){
    //fill(this.bodyColor);
    //texture(moonTex);
    fill(0);
    bodyShape = createShape(RECT, randomX + this.speed - xAdjust, randomY + this.speed, this.size , this.size);
    shape(bodyShape);
    this.speed+= this.holdingSpeed;
    //this.speed+=1;
    
    if (true){
      xAdjust-=2;
      this.speed--;
    }
    
    //if (xPos >= width/2) {
    // this.speed = 0;
    // xAdjust = 0;
    //}
  }
  }
  
  public boolean pastEventHorizon(){
    float xPos = randomX + this.speed - xAdjust;
    float yPos = randomY + this.speed;
    
  //rect(blackHoleVals[0] - blackHoleVals[2], blackHoleVals[1] - blackHoleVals[2], 10, 10);
   //rect(blackHoleVals[0] + blackHoleVals[2], blackHoleVals[1] - blackHoleVals[2], 10, 10);
    
    if (xPos >= leftXBound && xPos <= rightXBound && yPos <= lowerYBound && yPos >= upperYBound){
      return true;
    } else {
      return false;
  }
  }
  
  public void killFastBody(){
    float xPos = randomX + this.speed - xAdjust;
    float yPos = randomY + this.speed;
    // ungracefully kill fast bodies. AKA move them far away and make transparent.
   boolean caught = this.pastEventHorizon();
   
   if(caught && this.alive){
     //this.bodyColor = color(255/2, random(255), 255/2, 0); // make transparent
     //this.xAdjust = 1000000000; //move very far away
     this.alive = false;
     superMassive.setMass(this.mass);
   }
   
   if(this.alive && xPos > width){
    this.alive = false; 
   }
  }
  
  
}
class Planetoid {
// this class is to be used as a base class for other planets that will be thrown into the blackhole
  float mass;
  float radius;
  float offset;
  float angle = 0;
  PShape globe;
  boolean dead = false;
  float baseMass;
  
  // base constructor
  public Planetoid(){
  }
  
  //overloaded
  public Planetoid(float mass, float radius, float offset){
   this.mass = mass;
   this.baseMass = mass;
   this.radius = radius;
   this.offset = offset;
   
   // make the planet
   //this.creation();
  }
  
  
  //methods
  
  public void creation(){
    if (!this.dead){
   fill(127, 255, 127);
   noStroke();
   lights();
   translate(-width/4 + this.offset + this.angle, -height/4 + this.offset +this.angle, 0);
   globe = createShape(SPHERE, this.radius);
   shape(globe);
   //this.fall();
    }
  }
  
  
  // overloaded creation which applies a texture to the planetoid
    public void creation(PImage globeTex){
      fill(127, 127, 127);
      noStroke();
      lights();
      globe = createShape(SPHERE, this.radius);
      globe.setTexture(globeTex);

     
     if (!this.dead){
     //fill(127, 127, 127);
     //noStroke();
     //lights();
     pushMatrix();
     translate(-width/4 + offset + this.angle, -height/4 + offset +this.angle, 0);
     //globe = createShape(SPHERE, this.radius);
     //globe.setTexture(globeTex);
     shape(globe);
     popMatrix();
     //this.fall();
      }
    }

  
  public void fall(){
    
    if (!this.dead){
    this.angle+=mass/1000;
    this.mass++;
    
    if (this.angle > 150){
     this.shrinkPlanet();
    }
    
    if (this.angle > 155) {
      this.killPlanet();
      increaseBlackHoleMass();
      }
    }
  }
  
  
  public void shrinkPlanet(){
    for (int i = 0; i < 1000; i++){
     float dec = this.radius / 1000;
     this.radius -= dec; 
    }
  }
  
  
  
  public void killPlanet(){
    this.dead=true;
  }
  
  
 
  public void increaseBlackHoleMass(){
    superMassive.setMass(this.baseMass);
    
  }
  
  
  
  
}
  public void settings() {  size(926,741, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Thomas_Dickens_Proj9_blackhole" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
