class FastBody {
// this class is meant to represent smaller objects that are not nearly as massive as 
//a planet, also they will not orbit the black hole, rather, they will shoot right into it.
//Should have methods such as speed and mass. Might be 2D.
// Lastly, these are mean to come from off screan to simulate shooting starts, or comets
  float size;
  float speed;
  float mass;
  boolean hasTail = false;
  PShape bodyShape;
  color bodyColor = color(255/2, random(255), 255/2);
  float yAdjust = 0;
  float xAdjust = 0;
  
  
  // Constructors
  
  public FastBody(){
  }
  
  public FastBody(float size, float speed, float mass){
    this.size = size;
    this.speed = speed;
    this.mass = mass;
  }
  
  
  public FastBody(float size, float speed, float mass, boolean hasTail){
    this.size = size;
    this.speed = speed;
    this.mass = mass;
    this.hasTail = hasTail;
  }
  
  void genShape(){
    float xPos = 20 + this.speed;
    float yPos = 20 + this.speed;

    
    fill(this.bodyColor);
    bodyShape = createShape(RECT, 20 + this.speed - xAdjust, 20 + this.speed, this.size , this.size);
    shape(bodyShape);
    this.speed+=1;
    this.speed+=1;
    
    if (xPos > 300 && xPos <  width/2){
      xAdjust-=2;
      this.speed--;
    }
    
    if (xPos >= width/2) {
     this.speed = 0;
     xAdjust = 0;
    }
  }
  
  //void shootBody(){
  //  bodyShape.translate(5,5);
  //}
  
  
}
