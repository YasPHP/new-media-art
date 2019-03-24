ball player; // the variable for ball
wall[] walls; // array for the maze walls
int startTime;
int screen;
boolean won;

void setup() {
 fullScreen ();
 startTime = frameCount;
won =false;
   player = new ball(15,10); // location of the ball when game starts
 
  walls = new wall[50];// creates the maze walls
  walls[0] = new wall (100,40, 30, 150);
  walls[1] = new wall (40, 160, 90, 30);
  walls[2] = new wall (40, 220, 90, 30);
  walls[3] = new wall (160, 40, 400, 30);
  walls[4] = new wall (100,230, 30, 350); 
  walls[5] = new wall (40, 340, 30, 520);
  walls[6] = new wall (160, 100, 260, 30);
  walls[7] = new wall (0, 40, 70, 30);
  walls[8] = new wall (40, 60, 30, 70);
  walls[9] = new wall (160, 110, 30,300);
  walls[10] = new wall (100,450,300, 30 );
  walls[11]= new wall (230, 200, 30, 270);
  walls [12]= new wall (230, 100, 30, 70);
  walls [13]= new wall(70, 620, 300, 30);
  walls [14]= new wall (160, 450, 30, 128);
  walls[15]= new wall (160, 554, 700, 30);
  walls [16] = new wall (210, 620, 30, 210);
  walls[17] = new wall (125, 620, 30, 300);
  walls [18] = new wall (150, 870, 520, 30);
  walls[19]= new wall (460, 70, 30, 408);
  walls [20] = new wall (590, 0, 30, 300);
  walls [21] = new wall (290, 300, 200, 30);
  walls [22] = new wall (296, 120, 30, 140);
  walls [23] = new wall (300, 230, 120, 30);
  walls [24] = new wall (390, 170, 30, 90);
  walls [25] = new wall (320, 170, 40, 30);
  walls [26] = new wall (250, 380, 180, 30);
  walls [27] = new wall (370, 470, 30, 50);
  walls [28] = new wall (530, 120, 30, 440);
  walls [29] = new wall (890, 0, 30, 900);
  walls [30] = new wall (700, 400, 200, 30);
  walls [31] = new wall (650, 330, 240, 30);
  walls [32] = new wall (650, 60, 30, 270);
  walls [33] = new wall (650, 60, 210, 30);
  walls [34] = new wall (710, 120, 180, 30);
  walls [35] = new wall (590, 620, 300, 30);
  walls [36] = new wall (530, 580, 30, 250);
  walls [37] = new wall (470, 580, 30, 70);
  walls [38] = new wall (300, 800, 250, 30);
  walls [39] = new wall (300, 680, 250, 30);
  walls [40] = new wall (230, 740, 250, 30);
  walls [41] = new wall (590, 700, 30, 200);
  walls [42] = new wall (610, 500, 300, 30);
  walls [43] = new wall (700, 400, 30, 70);
  walls [44] = new wall (595, 330, 65, 30);
  walls [45] = new wall (550, 400, 110, 30);
  walls [46] = new wall (590, 400, 30, 70);
  walls [47] = new wall (700, 650, 30, 150);
  walls [48] = new wall (655, 700, 210, 30);
  walls [49] = new wall (610, 760, 50,30);
}

void draw() {
 drawScreen1 ();
 drawScreen2 ();
 
 if (screen ==1) {
   drawScreen1 ();
 }
 else if (screen == 2) {
   drawScreen2 ();
 }
}
  
  void drawScreen2 () {
    background (255);
    textSize (100);
    text ("Maze Runner", 400, 200);
    textSize (50);
    textSize (40);
    text ("Instructions:", 100, 400);
    text ("Use UP, DOWN, RIGHT, and LEFT arrows on your keyboard", 100, 500);
    text ("to navigate through the maze and make it through the semester",100, 600);
    text ("Click your mouse to begin the game and have an a-MAZE-ing time", 100, 800); 
  }
  
  void drawScreen1 () {
    
  background(255, 255, 255); 
  int timer = (frameCount - startTime)/60; 
  textSize (80);
  fill (250, 172, 178);
  text ("Time:", 1000, 200);
  text (timer, 1250, 200);
  noStroke();
  
  player.draw(); // the ball 
  player.move(walls);// the balls movement
 
  for(int i = 0; i < walls.length; i++){ // controls where the ball will be allowed to move
    walls[i].draw();
  }}
 
class ball { // ball 
  float x;
  float y;

  ball(float _x, float _y){
    x = _x;
    y = _y;
     }
 void draw (){ 
 fill (255,236,90);
 ellipse (800,810, 100,100);
 stroke (255,90,101);
 

    fill (255, 175, 175);
    ellipse (x,y, 18,18);
  
 textSize (23);
 stroke (252,3,19);
 text ("finish", 772, 808);  
     
  textSize (35);
  text ("Can you make it through the", 950, 500);
  text ("semester maze ?", 950, 530);
  
      if (x > 800){
      if (y > 800){
      textSize(35);
      text ("Yes! You made it through!", 950, 620 );
      textSize (26);
      text ("Click your mouse twice to replay!", 950, 660);} }
  
  if (x ==700){
     if (y==230){
     
  textSize (20);
  text ("You have reached", 700, 220);
  text ("a dead end, turn", 700, 250);
  text ("back bud", 700, 280); }}  
}
   void move(wall[] walls){ // walls and naviagation through them using keys
 
    float possibleX = x;
    float possibleY = y;
 
      if (key == CODED);
    if (keyPressed==true) {
      if (keyCode== LEFT) { 
        possibleX= possibleX - 3;
      } 
      if (keyCode==RIGHT) { 
        possibleX = possibleX + 3;
      } 
       
      if (keyCode==UP) {
        possibleY = possibleY - 3;
      } 
       
      if (keyCode==DOWN) {
        possibleY = possibleY + 3;
      }}
 
    boolean didCollide = false; // bumping into walls and not being able to go through them
    for(int i = 0; i < walls.length; i++){
      if(possibleX > walls[i].x && possibleX < (walls[i].x + walls[i].w) && possibleY > walls[i].y && possibleY < walls[i].y + walls[i].h){
        didCollide = true;
      }}
    if(didCollide == false){
      x = possibleX;
      y = possibleY;
    }}}
 class wall { // wall and where its built
 
  float x;
  float y;
  float w;
  float h;
 
  wall(float _x, float _y, float _w, float _h){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
}
  void draw(){
    fill(0,0,0);
    rect(x,y,w,h);
  }
  
  void keyPressed (){
      startTime = frameCount; }   
 }
  
    void mousePressed () {
   screen += 1;
   if (screen >2) {
     screen = 1;
   }
 if (screen ==2){
 frameCount= 0;
 player= new ball(15,10);}}

