import processing.core.*;

public class BlackHole {
	  /////////////////////////////////////////////////////////////
	  //attributes
	  /////////////////////////////////////////////////////////////
	  float startingMass;
	  float radius;
	  float startX;
	  float startY;
	  PApplet p;	  
	  
	  // constructors
	  public BlackHole(){
	    
	  }
	  
	  //overloaded start at center
	  public BlackHole(PApplet p, float startingMass, float radius){
	   this.p = p;
	   this.startingMass = startingMass;
	   this.radius = radius;
	   startX = p.width/2;
	   startY = p.height/2;
	   
	   //draw the black hole
	   //this.collapse();
	  }
	  
	  //overloaded custom starting location
	  public BlackHole(float startingMass, float radius, float startX, float startY){
	   this.startingMass = startingMass;
	   this.radius = radius;
	   this.startX = startX;
	   this.startY = startY;
	   startX = p.width/2;
	   startY = p.height/2;
	   
	   //draw the black hole
	   //this.collapse();
	  }
	  
	  public void collapse(){
	   //this method is basically a draw method, but I wanted it to be black hole themed
	   p.fill(0);
	   p.ellipse(startX, startY, radius + startingMass, radius + startingMass);

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
