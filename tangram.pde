PImage startscreen;
PFont title;
int stage;
char nivel;
int has;
int px[];
int py[];
int r[];
int px1[]={256,189,219,243,307,231,231};
int py1[]={209,209,321,255,225,357,287};
int r1[]={3,7,4,0,5,2,4};
int px2[]={232,232,265,234,215,235,215};
int py2[]={284,351,201,119,234,160,201};
int r2[]={5,1,3,7,1,2,3};
int px3[]={337,385,208,104,283,243,156};
int py3[]={236,320,224,233,263,236,229};
int r3[]={0,4,0,4,7,2,7};
int px4[]={250,293,258,238,267,269,341};
int py4[]={205,262,384,161,133,319,333};
int r4[]={7,0,2,4,3,1,4};
int px5[]={228,323,193,123,182,135,275};
int py5[]={240,240,252,204,216,240,216};
int r5[]={4,4,2,4,4,6,4};
boolean pieza0, pieza1, pieza2, pieza3, pieza4, pieza5, pieza6; 
color c[]={#EE3E18, #EDF800, #9EEC16 , #3122ED, #0BF0AB , #A40BF0, #F00BC3};
int i;

void setup(){
  stage =1;
  size(500,500);
  startscreen = loadImage("comienzo.jpg");
  image(startscreen, 0, 0, 500, 500);
  title= createFont("letra",1000,true);
  
    px = new int[7];
  py = new int[7];
  r = new int[7];
  
  
  
  reset();
}

void reset(){
  for(i=0;i<7;i++){
    px[i]=int(random(100,400));
    py[i]=int(random(100,400)); 
    r[i]=int(random(0,8));
    
  }
  has = -1;
}

void draw(){
  
  
  if(stage==1){
  
  textAlign(CENTER);
  fill(39, 250, 25);
  text("TANGRAM",250,200);
  text("Presiona una tecla para empezar", 250, 300); 
  
  if(keyPressed == true){
  stage=2;
  }
  }
  
  if(stage==2){
  background(0);
  fill(255, 255, 255);
  textAlign(CENTER);
  text("TANGRAM",250,50);
  text("Ejercita tu mente",250,80);
  text("SELECCIONA UN NIVEL",250,200);
  text("Presiona en el teclado el numero de nivel que deseas jugar, ", 250, 300); 
  text("asi accederas directamente al nivel que quieras jugar ", 250, 330); 
  text("existe el nivel 1, 2, 3, 4, 5. ", 250, 360); 
  if(((key=='1')||(key=='2')||(key=='3')||(key=='4')||(key=='5'))){
  stage=3;
  nivel=key;
  }
  }

  
  if(stage==3){
   background(0); 
  fill(255, 255, 255);
  textAlign(CENTER);
  text("NIVEL",250,15); 
  text(nivel,280,15); 
  text("Q para volver a escoger nivel.",450,15);
  

  if(key=='q'){
  
  stage=2;
 pieza0=false;
 pieza1=false;
 pieza2=false;
 pieza3=false;
 pieza4=false;
 pieza5=false;
 pieza6=false;
 reset();
  }
  
    
if(nivel=='1'){
  fill(255);
text("MARTILLO",250,40); 

for(i=0;i<7;i++){
    pushMatrix();
    translate(px1[i],py1[i]);
    rotate(r1[i]*radians(45));
    fill(255,255,255);
    scale(1.5);
    switch(i){
    case 0:
    case 1: 
      beginShape(TRIANGLES);
      vertex(-48,-16);
      vertex(16,-16);
      vertex(16,48);
      endShape();
      break;
    case 2:
    case 3: 
      beginShape(TRIANGLES);
      vertex(-24,-8);
      vertex(8,-8);
      vertex(8,24);
      endShape();
      break;
    case 4: 
      beginShape(TRIANGLES);
      vertex(-16,0);
      vertex(16,32);
      vertex(16,-32);
      endShape();
      break;
    case 5: 
      rect(-16,-16,32,32);
      break;
    case 6: 
      beginShape(QUADS);
      vertex(-16,0);
      vertex(-16,-32);
      vertex(16,0);
      vertex(16,32);      
      endShape();
      break;
    }    
    popMatrix();
  }
  
  
  
  if((px[0]-px1[0]>-10 && px[0]-px1[0]<10)){  
  if(r[0]==r1[0]){
  pieza0=true; 
  }
  if(r[1]==r1[1]){
  pieza1=true;
  }
  }      else if        (px[0]-px1[1]>-10 && px[0]-px1[1]<10) {  
   if(r[0]==r1[1]){
  pieza0=true; 
  }
  if(r[1]==r1[0]){
  pieza1=true;
  }
  }  
  
  
  
  if((px[2]-px1[2]>-10 && px[2]-px1[2]<10)){  
    if(r[2]==r1[2]){
  pieza2=true; 
  }
  if(r[3]==r1[3]){
  pieza3=true;
  }
  } else if (px[2]-px1[3]>-10 && px[2]-px1[3]<10) {  
   if(r[2]==r1[3]){
  pieza2=true; 
  }
  if(r[3]==r1[2]){
  pieza3=true;
  }
  }
  
   if((px[5]-px1[5]>-10 && px[5]-px1[5]<10)){
   if(r[5]%r1[5]==0){
   pieza5=true;
   }   
   }
   
  if((px[4]-px1[4]>-10 && px[4]-px1[4]<10)){
   if(r[4]==r1[4]){
   pieza4=true;
   }   
   }
   
   if((px[6]-px1[6]>-10 && px[6]-px1[6]<10)){
   if(r[6]==r1[6]){
   pieza6=true;
   }   
   }
   
   if(pieza0==true && pieza1==true && pieza2==true && pieza3==true && pieza4==true && pieza5==true && pieza6==true){
   
  background(0); 
  fill(255, 255, 255);
  textAlign(CENTER);
  text("******FELICITACIONES******",250,15); 
  text("NIVEL CONSEGUIDO",250,25); 
  text("Q para volver al menu.",250,35);
  
 
 
      }
}



if(nivel=='2'){
  fill(255);
text("ESPADA",250,40); 

for(i=0;i<7;i++){
    pushMatrix();
    translate(px2[i],py2[i]);
    rotate(r2[i]*radians(45));
    fill(255,255,255);
    scale(1.5);
    switch(i){
    case 0:
    case 1: 
      beginShape(TRIANGLES);
      vertex(-48,-16);
      vertex(16,-16);
      vertex(16,48);
      endShape();
      break;
    case 2:
    case 3: 
      beginShape(TRIANGLES);
      vertex(-24,-8);
      vertex(8,-8);
      vertex(8,24);
      endShape();
      break;
    case 4: 
      beginShape(TRIANGLES);
      vertex(-16,0);
      vertex(16,32);
      vertex(16,-32);
      endShape();
      break;
    case 5: 
      rect(-16,-16,32,32);
      break;
    case 6: 
      beginShape(QUADS);
      vertex(-16,0);
      vertex(-16,-32);
      vertex(16,0);
      vertex(16,32);      
      endShape();
      break;
    }    
    popMatrix();
  }
  
  
  
  if((px[0]-px2[0]>-10 && px[0]-px2[0]<10)){  
  if(r[0]==r2[0]){
  pieza0=true; 
  }
  if(r[1]==r2[1]){
  pieza1=true;
  }
  }      else if        (px[0]-px2[1]>-10 && px[0]-px2[1]<10) {  
   if(r[0]==r2[1]){
  pieza0=true; 
  }
  if(r[1]==r2[0]){
  pieza1=true;
  }
  }  
  
  
  
  if((px[2]-px2[2]>-10 && px[2]-px2[2]<10)){  
    if(r[2]==r2[2]){
  pieza2=true; 
  }
  if(r[3]==r2[3]){
  pieza3=true;
  }
  } else if (px[2]-px2[3]>-10 && px[2]-px2[3]<10) {  
   if(r[2]==r2[3]){
  pieza2=true; 
  }
  if(r[3]==r2[2]){
  pieza3=true;
  }
  }
  
   if((px[5]-px2[5]>-10 && px[5]-px2[5]<10)){
   if(r[5]%2==0){
   pieza5=true;
   }   
   }
   
  if((px[4]-px2[4]>-10 && px[4]-px2[4]<10)){
   if(r[4]==r2[4]){
   pieza4=true;
   }   
   }
   
   if((px[6]-px2[6]>-10 && px[6]-px2[6]<10)){
   if(r[6]==r2[6]){
   pieza6=true;
   }   
   }
   
   if(pieza0==true && pieza1==true && pieza2==true && pieza3==true && pieza4==true && pieza5==true && pieza6==true){
   
  background(0); 
  fill(255, 255, 255);
  textAlign(CENTER);
  text("******FELICITACIONES******",250,15); 
  text("NIVEL CONSEGUIDO",250,25); 
  text("Q para volver al menu.",250,35);
  
 
 
      }
}

if(nivel=='3'){
  fill(255);
text("REVOLVER",250,40); 

for(i=0;i<7;i++){
    pushMatrix();
    translate(px3[i],py3[i]);
    rotate(r3[i]*radians(45));
    fill(255,255,255);
    scale(1.5);
    switch(i){
    case 0:
    case 1: 
      beginShape(TRIANGLES);
      vertex(-48,-16);
      vertex(16,-16);
      vertex(16,48);
      endShape();
      break;
    case 2:
    case 3: 
      beginShape(TRIANGLES);
      vertex(-24,-8);
      vertex(8,-8);
      vertex(8,24);
      endShape();
      break;
    case 4: 
      beginShape(TRIANGLES);
      vertex(-16,0);
      vertex(16,32);
      vertex(16,-32);
      endShape();
      break;
    case 5: 
      rect(-16,-16,32,32);
      break;
    case 6: 
      beginShape(QUADS);
      vertex(-16,0);
      vertex(-16,-32);
      vertex(16,0);
      vertex(16,32);      
      endShape();
      break;
    }    
    popMatrix();
  }
  
  
  
  if((px[0]-px3[0]>-10 && px[0]-px3[0]<10)){  
  if(r[0]==r3[0]){
  pieza0=true; 
  }
  if(r[1]==r3[1]){
  pieza1=true;
  }
  }      else if        (px[0]-px3[1]>-10 && px[0]-px3[1]<10) {  
   if(r[0]==r3[1]){
  pieza0=true; 
  }
  if(r[1]==r3[0]){
  pieza1=true;
  }
  }  
  
  
  
  if((px[2]-px3[2]>-10 && px[2]-px3[2]<10)){  
    if(r[2]==r3[2]){
  pieza2=true; 
  }
  if(r[3]==r3[3]){
  pieza3=true;
  }
  } else if (px[2]-px3[3]>-10 && px[2]-px3[3]<10) {  
   if(r[2]==r3[3]){
  pieza2=true; 
  }
  if(r[3]==r3[2]){
  pieza3=true;
  }
  }
  
   if((px[5]-px3[5]>-10 && px[5]-px3[5]<10)){
   if(r[5]%r3[5]==0){
   pieza5=true;
   }   
   }
   
  if((px[4]-px3[4]>-10 && px[4]-px3[4]<10)){
   if(r[4]==r3[4]){
   pieza4=true;
   }   
   }
   
   if((px[6]-px3[6]>-10 && px[6]-px3[6]<10)){
   if(r[6]==r3[6]){
   pieza6=true;
   }   
   }
   
   if(pieza0==true && pieza1==true && pieza2==true && pieza3==true && pieza4==true && pieza5==true && pieza6==true){
   
  background(0); 
  fill(255, 255, 255);
  textAlign(CENTER);
  text("******FELICITACIONES******",250,15); 
  text("NIVEL CONSEGUIDO",250,25); 
  text("Q para volver al menu.",250,35);
  
 
 
      }
}

if(nivel=='4'){
  fill(255);
text("PERSONA",250,40); 

for(i=0;i<7;i++){
    pushMatrix();
    translate(px4[i],py4[i]);
    rotate(r4[i]*radians(45));
    fill(255,255,255);
    scale(1.5);
    switch(i){
    case 0:
    case 1: 
      beginShape(TRIANGLES);
      vertex(-48,-16);
      vertex(16,-16);
      vertex(16,48);
      endShape();
      break;
    case 2:
    case 3: 
      beginShape(TRIANGLES);
      vertex(-24,-8);
      vertex(8,-8);
      vertex(8,24);
      endShape();
      break;
    case 4: 
      beginShape(TRIANGLES);
      vertex(-16,0);
      vertex(16,32);
      vertex(16,-32);
      endShape();
      break;
    case 5: 
      rect(-16,-16,32,32);
      break;
    case 6: 
      beginShape(QUADS);
      vertex(-16,0);
      vertex(-16,-32);
      vertex(16,0);
      vertex(16,32);      
      endShape();
      break;
    }    
    popMatrix();
  }
  
  
  
  if((px[0]-px4[0]>-10 && px[0]-px4[0]<10)){  
  if(r[0]==r4[0]){
  pieza0=true; 
  }
  if(r[1]==r4[1]){
  pieza1=true;
  }
  }      else if        (px[0]-px4[1]>-10 && px[0]-px4[1]<10) {  
   if(r[0]==r4[1]){
  pieza0=true; 
  }
  if(r[1]==r4[0]){
  pieza1=true;
  }
  }  
  
  
  
  if((px[2]-px4[2]>-10 && px[2]-px4[2]<10)){  
    if(r[2]==r4[2]){
  pieza2=true; 
  }
  if(r[3]==r4[3]){
  pieza3=true;
  }
  } else if (px[2]-px4[3]>-10 && px[2]-px4[3]<10) {  
   if(r[2]==r4[3]){
  pieza2=true; 
  }
  if(r[3]==r4[2]){
  pieza3=true;
  }
  }
  
   if((px[5]-px4[5]>-10 && px[5]-px4[5]<10)){
   if(r[5]%2==1){
   pieza5=true;
   }   
   }
   
  if((px[4]-px4[4]>-10 && px[4]-px4[4]<10)){
   if(r[4]==r4[4]){
   pieza4=true;
   }   
   }
   
   if((px[6]-px4[6]>-10 && px[6]-px4[6]<10)){
   if(r[6]==r4[6]){
   pieza6=true;
   }   
   }
   
   if(pieza0==true && pieza1==true && pieza2==true && pieza3==true && pieza4==true && pieza5==true && pieza6==true){
   
  background(0); 
  fill(255, 255, 255);
  textAlign(CENTER);
  text("******FELICITACIONES******",250,15); 
  text("NIVEL CONSEGUIDO",250,25); 
  text("Q para volver al menu.",250,35);
  
 
 
      }
}

if(nivel=='5'){
  fill(255);
text("MONTAÑAS",250,40); 

for(i=0;i<7;i++){
    pushMatrix();
    translate(px5[i],py5[i]);
    rotate(r5[i]*radians(45));
    fill(255,255,255);
    scale(1.5);
    switch(i){
    case 0:
    case 1: 
      beginShape(TRIANGLES);
      vertex(-48,-16);
      vertex(16,-16);
      vertex(16,48);
      endShape();
      break;
    case 2:
    case 3: 
      beginShape(TRIANGLES);
      vertex(-24,-8);
      vertex(8,-8);
      vertex(8,24);
      endShape();
      break;
    case 4: 
      beginShape(TRIANGLES);
      vertex(-16,0);
      vertex(16,32);
      vertex(16,-32);
      endShape();
      break;
    case 5: 
      rect(-16,-16,32,32);
      break;
    case 6: 
      beginShape(QUADS);
      vertex(-16,0);
      vertex(-16,-32);
      vertex(16,0);
      vertex(16,32);      
      endShape();
      break;
    }    
    popMatrix();
  }
  
  
  
  if((px[0]-px5[0]>-10 && px[0]-px5[0]<10)){  
  if(r[0]==r5[0]){
  pieza0=true; 
  }
  if(r[1]==r5[1]){
  pieza1=true;
  }
  }      else if        (px[0]-px5[1]>-10 && px[0]-px5[1]<10) {  
   if(r[0]==r5[1]){
  pieza0=true; 
  }
  if(r[1]==r5[0]){
  pieza1=true;
  }
  }  
  
  
  
  if((px[2]-px5[2]>-10 && px[2]-px5[2]<10)){  
    if(r[2]==r5[2]){
  pieza2=true; 
  }
  if(r[3]==r5[3]){
  pieza3=true;
  }
  } else if (px[2]-px5[3]>-10 && px[2]-px5[3]<10) {  
   if(r[2]==r5[3]){
  pieza2=true; 
  }
  if(r[3]==r5[2]){
  pieza3=true;
  }
  }
  
   if((px[5]-px5[5]>-10 && px[5]-px5[5]<10)){
   if(r[5]%2==0){
   pieza5=true;
   }   
   }
   
  if((px[4]-px5[4]>-10 && px[4]-px5[4]<10)){
   if(r[4]==r5[4]){
   pieza4=true;
   }   
   }
   
   if((px[6]-px5[6]>-10 && px[6]-px5[6]<10)){
   if(r[6]==r5[6]){
   pieza6=true;
   }   
   }
   
   if(pieza0==true && pieza1==true && pieza2==true && pieza3==true && pieza4==true && pieza5==true && pieza6==true){
   
  background(0); 
  fill(255, 255, 255);
  textAlign(CENTER);
  text("******FELICITACIONES******",250,15); 
  text("NIVEL CONSEGUIDO",250,25); 
  text("Q para volver al menu.",250,35);
  
 
 
      }
}
  
for(i=0;i<7;i++){
    pushMatrix();
    translate(px[i],py[i]);
    rotate(r[i]*radians(45));
    fill(c[i]);
    scale(1.5);
    switch(i){
    case 0:
    case 1: // Big ones.
      beginShape(TRIANGLES);
      vertex(-48,-16);
      vertex(16,-16);
      vertex(16,48);
      endShape();
      break;
    case 2:
    case 3: // Small ones.
      beginShape(TRIANGLES);
      vertex(-24,-8);
      vertex(8,-8);
      vertex(8,24);
      endShape();
      break;
    case 4: // Medium
      beginShape(TRIANGLES);
      vertex(-16,0);
      vertex(16,32);
      vertex(16,-32);
      endShape();
      break;
    case 5: // Square
      rect(-16,-16,32,32);
      break;
    case 6: // Diamond
      beginShape(QUADS);
      vertex(-16,0);
      vertex(-16,-32);
      vertex(16,0);
      vertex(16,32);      
      endShape();
      break;
    }    
    popMatrix();
  }
  if( mousePressed && (has != -1) ){
    px[has] += mouseX-pmouseX;
    py[has] += mouseY-pmouseY;
  }
  // Draw frame
  noStroke();
  fill(0);
  rect(0,0,width,4);
  rect(0,0,4,height);
  rect(width-4,0,4,height);
  rect(0,height-4,width,4);
}
}

void mousePressed(){
  if( mouseButton == LEFT ){
    color mouseC = get(mouseX,mouseY);
    for(int j=0;j<7;j++){
      if( c[j] == mouseC ){
        has = j;
      }
    }   
  }
}

void mouseReleased(){
  has = -1;
  for(i=0;i<7;i++){
    if( px[i] < 0 || px[i] > width || py[i] < 0 || py[i] > height ){
      px[i]=int(random(100,400));
      py[i]=int(random(100,400));
      r[i]=int(random(0,8));
    } 
    }
    
    
    
    
    }
  


void mouseClicked(){
  if( mouseButton == RIGHT ){
    color mouseC = get(mouseX,mouseY);
    for(int j=0;j<7;j++){
      if( c[j] == mouseC ){
        r[j]=(r[j]+1)%8;
      }
    }   
  }  
}