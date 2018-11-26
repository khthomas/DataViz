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
  color bodyColor = color(255/2, random(255), 255/2, 255);
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
  void genShape(){
    float xPos = randomX + this.speed;
    float yPos = randomY + this.speed;
    float influence = 2.0;
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
  
  void killFastBody(){
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
