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
  
  void collapse(){
   //this method is basically a draw method, but I wanted it to be black hole themed
   fill(0);
   ellipse(startX, startY, radius + startingMass, radius + startingMass);

  }
  
  void setMass(float incrament){
   this.startingMass+=incrament;
  }  
  
  
  
  
}
