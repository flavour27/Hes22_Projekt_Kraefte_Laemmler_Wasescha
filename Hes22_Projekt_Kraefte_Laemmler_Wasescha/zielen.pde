//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------
//                                          Header Infos
//------------------------------------------------------------------------------------------------
// Header-Name: zielen
// Hauptprogramm:: Kräfte und Erdanziehung
// Version: V1.0
// Name: Cyrill Lämmler und Flavio Wasescha
// Firma: PHSG
//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------
//                                        interne Variablen
//------------------------------------------------------------------------------------------------
int mx,my;                                                        
PVector mouse, center;
//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------
//                                          Header Code
//------------------------------------------------------------------------------------------------
void zielen(){                
  background(0);
  mouseErfassung();
  kanonenAusrichtung();
  kanonenAusgabe();
}
//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------
//                                            Functions
//------------------------------------------------------------------------------------------------
//Funktion mouseErfassung
//Die Position der Maus wird eingelesen und der bewegliche Bereich der Kanone eingeschränkt
void mouseErfassung() { 
  if (mouseY > he - k * 120 || mouseX < k * 120||mouseX < k * 120 && mouseY > he - k * 120){
   mouse = new PVector(mx,my);
  }
  else{
    mouse = new PVector(mouseX,mouseY);
    mx = mouseX;
    my = mouseY;
  }
}
//------------------------------------------------------------------------------------------------    
//Funktion kanonenAusrichtung
//Berechungen der Vektoren von der Kanone zur Maus
void kanonenAusrichtung () {
  center = new PVector(k * 120, he - k * 120);
  mouse.sub(center);
  mouse.normalize();
  //translate(k * 120, he - k * 120);
}
//------------------------------------------------------------------------------------------------
//Funktion kanonenAusgabe
/*Die Kanone (dicker Strich), Kanonenhalterung (Dreieck) und Zielerfassung (dünner Strich) wird
ausgegeben*/
void kanonenAusgabe () {
  mouse.mult(1000);
  translate(k * 120, he - k * 120);
  strokeWeight(3);
  stroke(250,0,0);
  line(0,0,mouse.x,mouse.y);
  mouse.mult(0.06);
  stroke(255);
  strokeWeight(50);
  strokeCap(PROJECT);
  line(0,0,mouse.x,mouse.y);
  strokeWeight(0);
  fill(60);
  triangle(0, 0, k * 120, k * 60, -k * 120 ,k * 60);
}       
//------------------------------------------------------------------------------------------------
//------------------------------------------------------------------------------------------------
