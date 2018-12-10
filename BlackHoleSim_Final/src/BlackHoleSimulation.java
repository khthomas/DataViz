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

//check out PEasyCam for more interation 
public class BlackHoleSimulation extends PApplet{
	
	PImage eh;
	PImage earthTex;
	PImage moonTex;
	PImage planTex;
	PImage marsTex;
	PImage mercuryTex;
	PImage neptuneTex;
	PImage plutoTex;
	PImage saturnTex;
	PImage uranusTex;
	PImage venusTex;
	BlackHole superMassive;
	Planetoid inTheBeginning;
	Earth earthTest;
	FastBody[] fastArray = new FastBody[10];
	ArrayList planets;
	ArrayList fastObject;
	
	public static void main(String[] passedArgs) {
//		PApplet.main("BlackHoleSimulation");
		String[] appletArgs = new String[] { "BlackHoleSimulation" };
	    if (passedArgs != null) {
	      PApplet.main(concat(appletArgs, passedArgs));
	    } else {
	      PApplet.main(appletArgs);
	    }

	}
	
	public void settings() {
		size(926, 741, P3D);
	}
	
	public void setup() {

		 
		 //textures
		  //background
		 eh = loadImage("data/eventHorizon2.jpg");
		 earthTex = loadImage("earth.jpeg");
		 moonTex = loadImage("moon.jpeg");
		 planTex = loadImage("planet.png");
		 marsTex = loadImage("mars.jpg");
		 mercuryTex = loadImage("mercury.jpg");
		 neptuneTex = loadImage("neptune.jpeg");
		 plutoTex = loadImage("pluto.jpg");
		 saturnTex = loadImage("saturn.jpg");
		 uranusTex = loadImage("uranus.jpg");
		 venusTex = loadImage("venus.jpeg");
		 
//		 switch (allSkins.length) {
//			 case 0: allSkins[0] = earthTex;
//			 case 1: allSkins[1] = moonTex;
//			 case 2: allSkins[2] = planTex;
//			 case 3: allSkins[3] = marsTex;
//			 case 4: allSkins[4] = mercuryTex;
//			 case 5: allSkins[5] = neptuneTex;
//			 case 6: allSkins[6] = plutoTex;
//			 case 7: allSkins[7] = saturnTex;
//			 case 8: allSkins[8] = uranusTex;
//			 case 9: allSkins[9] = venusTex;		 
//		 }
		 
		 planets = new ArrayList();
		 fastObject = new ArrayList();
		 
		 //obejects
		 superMassive = new BlackHole(this, 100, 25);
		  //public Planetoid(float mass, float radius, float offset){
		 //inTheBeginning = new Planetoid(50, 50, 50);
		 earthTest = new Earth(this, superMassive, 60, 60, 60);
		 earthTest.spawnMoon();
		 
		 for (int i = 0; i < fastArray.length; i++){
		   fastArray[i] = new FastBody(this, superMassive, random(15), random(5), random(5));
		   
		 }
		 
		 inTheBeginning = new Planetoid(this, superMassive, 60, 30, 30);
		
	}
	
	public void draw() {
		 background(eh); //eh = event horizon
		 superMassive.collapse();

		    
		 for (int i = 0; i < fastArray.length; i++){
		   fastArray[i].genShape();
		   fastArray[i].pastEventHorizon();
		   fastArray[i].killFastBody();
		}

		 
		 // rotation for any Planetoid objects
		 translate(width/2, height/2, 0);
		 rotateZ(frameCount*0.02f);

		   //inTheBeginning.creation();
		   earthTest.creation(earthTex);
		   earthTest.show();
		   earthTest.moon.creation(moonTex);
		   earthTest.moon.show();
		   earthTest.fall();
		   earthTest.moon.fall();

		  for (int i = planets.size()-1; i >= 0; i--){
			  
		    Earth a = (Earth) planets.get(i);
//		    a.creation();
		    a.show();
		    a.fall();
//		    a.tearPlanet(200, 0.55);
		  }
		  
		  for(int i= fastObject.size()-1; i>=0; i--){
			    FastBody b = (FastBody) fastObject.get(i);
			    b.genShape();
		  }
		  
		  earthTest.tearPlanet(200, 0.55);
		  earthTest.moon.tearPlanet(200, 0.55);
		  
	}
	
	public void mouseClicked(){
		PImage randomSkin;
		int randomVar = (int) (random(9));
		
		switch (randomVar) {
		 case 0: randomSkin = earthTex; break;
		 case 1: randomSkin = moonTex; break;
		 case 2: randomSkin = planTex; break;
		 case 3: randomSkin = marsTex; break;
		 case 4: randomSkin = mercuryTex; break;
		 case 5: randomSkin = neptuneTex; break;
		 case 6: randomSkin = plutoTex; break;
		 case 7: randomSkin = saturnTex; break;
		 case 8: randomSkin = uranusTex; break;
		 case 9: randomSkin = venusTex; break;
		 default: randomSkin = plutoTex; break;
		}

		
		  planets.add(new Earth(this, superMassive, 60, 30, 30));
		  Earth created = (Earth) planets.get(planets.size() -1);
		  created.creation(randomSkin);
		  
		}
	
	public void mouseDragged(){
		  fastObject.add(new FastBody(this, superMassive, random(15), mouseX-mouseY, random(5)));
		}
	


}
