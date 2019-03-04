//Eeman Salman
//Mr. Seidel
//ICS 3U0
//May 28th, 2018

float input; 
int screen;

String pass = "";
String Master;
String UserA;
String UserB;

String [] MasterPassword;
String [] UserAPassword;
String [] UserBPassword;

boolean password;
boolean user;

float top = 0; //top ball
float side = 0; //side ball
float ySize = 10; //size of top ball
float xSize = 10; //size of side ball
float colourOfObject = 0; //changes colour of object

float x = 0;               
float y = 0;               
float colour = 0;          
float a = 0;

float [] xCircle;
float [] yCircle;
float [] lines;

int amountOfCircles = 50;

String sentence;
String lowercasesentence;
int characters;
int capitals;
int vowels;
int wordCount;
int punctuation;

char current;
int currentCount = 0;
char maximum;
int maximumCount = 0;

void settings() {
  size(600, 600);
}

void setup() {
  background (0);
  Master = "Master";
  UserA = "User A";
  UserB = "User B";

  fill(255);
  xCircle = new float [amountOfCircles]; 
  yCircle = new float [amountOfCircles];
  lines = new float [amountOfCircles];
  for (int i = 0; i < xCircle.length; i++) {
    xCircle[i] = random(width);
  }
  for (int i = 0; i < yCircle.length; i++) {
    yCircle[i] = random(height);
  }
  for (int i = 0; i < lines.length; i++) {
    lines[i] = xCircle[i];
  }
  colorMode(RGB);
  sentence = "Whatever you put here, it must always be school appropriate.";
  lowercasesentence = "whateveryouputhereitmustalwaysbeschoolappropriate";
  char [] original = sentence.toCharArray();
  char [] lower = lowercasesentence.toCharArray();
  for (int i = 0; i < sentence.length(); i++) {
    if (original[i]>64 && original[i]<91) {
      capitals++;
    }
    if (original[i]=='A'||original[i]=='E'||original[i]=='I'||original[i]=='O'||original[i]=='U'||original[i]=='a'||original[i]=='e'||original[i]=='i'||original[i]=='o'||original[i]=='u') {
      vowels++;
    }
    if (original[i]=='.'||original[i]==':'||original[i]==';'||original[i]==39||original[i]==','||original[i]=='?'||original[i]=='!') {
      punctuation++;
    }
    if (original[i] == ' ') {
      wordCount++;
    }
  }
  for (int i = 0; i < lower.length; i++) {
    current = lower [i]; 
    currentCount = 0;
    for (int x = 0; x<lower.length; x++) {
      if (lower[x] == current) {
        currentCount++;
        if (currentCount>maximumCount) {
          maximumCount = currentCount;
          maximum = current;
        }
      }
    }
  }
}

void keyTyped() {
  if (screen == 1) {
    MasterPassword = loadStrings("master.txt"); 
    key+=5;
    pass = pass + key;
    println(pass);
    if (pass.equals(MasterPassword[0])) {
      password = true;
    }
  }
  if (screen == 2) {
    UserAPassword = loadStrings("usera.txt"); 
    key+=5;
    pass = pass + key;
    println(pass);
    if (pass.equals(UserAPassword[0])) {
      password = true;
    }
  }
  if (screen == 3) {
    UserBPassword = loadStrings("userb.txt"); 
    key+=5;
    pass = pass + key;
    println(pass);
    if (pass.equals(UserBPassword[0])) {
      password = true;
    }
  }
}

void mouseClicked() {
  if (screen == 0) {
    if (mouseY>150&&mouseY<250) {
      screen = 1;
    }
    if (mouseY>300&&mouseY<400) {
      screen = 2;
    }
    if (mouseY>450&&mouseY<600) {
      screen = 3;
    }
  }

  if (screen>0&&screen<4) {
    if (mouseX>25&&mouseX<50&&mouseY>50&&mouseY<100) {
      background(0);
      screen = 0;
    }
    if (mouseX>475&&mouseX<525&&mouseY>375&&mouseY<425) {
      if (password == false) {
        textAlign(CENTER);
        text("Incorrect Password, Try Again", 300, 450);
        pass = "";
      }
    }
  }

  if (password == true) {
    if (screen == 1) {
      if (mouseX>475&&mouseX<525&&mouseY>375&&mouseY<425) {
        background (0);
        screen = 4;
        masterAccess();
      }
    }
    if (screen == 2) {
      if (mouseX>475&&mouseX<525&&mouseY>375&&mouseY<425) {
        user = true;
        userAAccess();
        background (0);
        screen = 4;
      }
    }
    if (screen == 3) {   
      if (mouseX>475&&mouseX<525&&mouseY>375&&mouseY<425) {
        user = false;
        userBAccess();
        background(0);
        screen = 12;
      }
    }
    if (screen>=4) {
      if (mouseX>(width-100)&&mouseX<(width)&&mouseY>(height-75)&&mouseY<(height)) {
        resetBackground();
        screen++;
      }
    }
    if (screen > 4) {
      if (mouseX>(40)&&mouseX<(55)&&mouseY>(height-75)&&mouseY<(height)) {
        colorMode(RGB);
        resetBackground();
        screen--;
      }
    }
  }
  if (screen == 11) {
    if (mouseY>140&&mouseY<160) {
      screen = 0;
    }
  }
}


void draw() {
  if (screen == 0) {
    homeScreen();
  }
  if (screen == 1) {
    masterPass();
  }
  if (screen == 2) {
    userAPass();
  }
  if (screen == 3) {
    userBPass();
  }
  if (user == true) {
    userAAccess();
  } else {
    userBAccess();
  }
  masterAccess();


  if (screen >3 && screen<16) {
    fill(255, 100, 50);
    textSize(15);
    text("Next", width-50, height-50);
  }
  if (screen >4 && screen!=12) {
    fill(255, 100, 50);
    textSize(15);
    text("Back", 50, height-50);
  }
}

void resetBackground() {
  background(0);
}

void homeScreen() {
  if (screen == 0) {
    surface.setSize(600, 600);
    for (int i = 0; i<500; i=i+150) {
      if (i>100) {
        rect(0, i, 600, 100);
      }
    }
  }
  textAlign(CENTER);
  fill(0);
  textSize(30);
  text(Master, 300, 210);
  text(UserA, 300, 360);
  text(UserB, 300, 510);
  fill(255);
  textSize(40);
  text("WELCOME", 300, 100);
}

void masterPass() {
  if (screen==1) {
    surface.setSize(600, 600);
    background(0);
    fill(255);
    textSize(30);
    text("Password:", 100, 300);
    textSize(20);
    text("Login", 500, 400);
    triangle(50, 50, 25, 75, 50, 100);
    rect(185, 265, 400, 50);
    if (keyPressed) {
      for (int i = 210; i<500; i=i+40) {
        fill(0);
        ellipse(i, 290, 30, 30);
      }
    }
  }
}

void userAPass() {
  if (screen==2) {
    surface.setSize(600, 600);
    background(0);
    fill(255);
    textSize(30);
    text("Password:", 100, 300);
    textSize(20);
    text("Login", 500, 400);
    triangle(50, 50, 25, 75, 50, 100);
    rect(185, 265, 400, 50);
    if (keyPressed) {
      for (int i = 210; i<500; i=i+40) {
        fill(0);
        ellipse(i, 290, 30, 30);
      }
    }
  }
}

void userBPass() {
  if (screen==3) {
    surface.setSize(600, 600);
    background(0);
    fill(255);
    textSize(30);
    text("Password:", 100, 300);
    textSize(20);
    text("Login", 500, 400);
    triangle(50, 50, 25, 75, 50, 100);
    rect(185, 265, 400, 50);
    if (keyPressed) {
      for (int i = 210; i<500; i=i+40) {
        fill(0);
        ellipse(i, 290, 30, 30);
      }
    }
  }
}

void masterAccess() {
  exercise1();
  exercise2();
  exercise3();
  exercise4();
  exercise5();
  exercise6();
  exercise7();
  exercise9();
  if (screen == 10) {
    if (mousePressed) {
      if (mouseX>(width-100)&&mouseX<(width)&&mouseY>(height-75)&&mouseY<(height)) {
        screen = 12;
      }
    }
  }
  exercise10();
  exercise11();
  exercise12();
}

void userAAccess() {
  if (user == true) {
    exercise1();
    exercise2();
    exercise3();
    exercise4();
    exercise5();
    exercise6();
    exercise7();
    endScreen();
  }
}
void userBAccess() {
  if (user == false) {
    if (screen == 11) {
      exercise9();
      exercise10();
      exercise11();
      exercise12();
    }
  }
}

void exercise1 () {
  if (screen == 4) {
    surface.setSize(800, 600);
    background(119, 176, 245);

    //sun
    fill(252, 245, 0);
    stroke(252, 245, 0);
    strokeWeight(0);
    ellipse(198, 300, 100, 100);

    //sun rays
    stroke(252, 245, 0);
    strokeWeight(3);
    line(248, 295, 281, 295);
    line(245, 280, 275, 270);
    line(237, 267, 264, 246);  
    line(226, 258, 246, 229);  
    line(213, 251, 224, 217);  
    line(199, 250, 199, 214);  
    line(184, 252, 173, 218);  
    line(171, 257, 151, 230);  
    line(160, 267, 133, 248);  
    line(152, 281, 121, 269);  
    line(149, 295, 118, 295);

    //grass
    stroke(0);
    strokeWeight(1);
    fill(28, 234, 92);
    rect(0, 300, 800, 300);

    //house
    stroke(0);
    strokeWeight(1);
    fill(240, 97, 123);
    rect(540, 250, 160, 98);

    //door
    stroke(0);
    strokeWeight(1);
    fill(255);
    rect(604, 271, 32, 70);

    //roof
    strokeWeight(0);
    fill(0);
    triangle(619, 201, 531, 250, 707, 250);

    //doorknob
    strokeWeight(0);
    fill(0);
    ellipse(611, 305, 9, 10);
  }
}

void exercise2 () {
  if (screen == 5) {
    surface.setSize(800, 800);
    background(255);

    //red
    noFill();
    strokeWeight(27);
    stroke(250, 128, 128);
    arc(340, 310, 500, 500, HALF_PI, radians(280));
    arc(490, 550, 500, 500, radians(290), TWO_PI+radians(75));

    //yellow
    noFill();
    strokeWeight(24);
    stroke(215, 250, 128);
    arc(308, 310, 500, 500, radians(90), radians(280));
    arc(490, 530, 500, 500, radians(270), TWO_PI+radians(80));

    //green 
    noFill();
    strokeWeight(15);
    stroke(128, 250, 128);
    arc(340, 300, 500, 500, radians(83), radians(270));
    arc(460, 565, 500, 510, radians(260), TWO_PI+radians(80));

    //blue
    noFill();
    strokeWeight(12);
    stroke(128, 146, 250);
    arc(350, 295, 500, 500, HALF_PI+radians(10), PI+radians(88));
    strokeWeight(10);
    arc(470, 525, 525, 510, PI+HALF_PI+radians(10), TWO_PI+radians(72));

    //purple
    noFill();
    strokeWeight(6);
    stroke(192, 128, 250);
    arc(340, 245, 500, 500, HALF_PI-radians(10), PI+radians(80));
    arc(485, 510, 500, 505, PI+radians(65), TWO_PI+radians(78));
  }
}

void exercise3 () {
  if (screen == 6) {
    surface.setSize(320, 600);
    strokeWeight(1);
    stroke(170);
    fill(mouseX, mouseY, 255);
    ellipse(mouseX, mouseY, 50, 50);
  }
}

void exercise4() {
  if (screen == 7) {
    colorMode(HSB);
    noStroke();
    fill(colourOfObject%255, 255, 255);

    colourOfObject = colourOfObject + 2.5; 
    if (colourOfObject>255) {
      colourOfObject=0;
    }

    ellipse(160, side, ySize, ySize);
    side = side + 2;
    ySize = ySize + 0.5;  

    ellipse(top, 300, xSize, xSize);
    top = top + 0.5;
    xSize = xSize + 0.1;
  }
}

void exercise5() {
  if (screen == 8) {

    colorMode(HSB);
    stroke(134);
    fill(colour, 250, 250);
    colour = colour + 6;    
    y = y + 11;                
    x = x + 0.6;              
    a = a + 0.66;

    ellipse(x, y, 52, 52); 

    if (y>=600) {
      y = 0;
      y = y - a; 
      ellipse(x+30, y-40, 50, 50);

      if (colour>255) {
        colour=0;
      }
    }
  }
}

void exercise6() {
  if (screen == 9) {
    float y;
    background(255); 
    noStroke();
    translate(10, 10);
    y = 0;
    while (y<mouseY/10) {
      for (float x = 0; x<mouseX; x = x+10) {
        colorMode(HSB);
        fill((x*y*10)%255, 255, 255); 
        ellipse(x, y*10, 10, 10);
      }
      y += 1;
    }
  }
}

void exercise7() {
  if (screen == 10) {
    colorMode(HSB, 100);
    stroke(0);
    strokeWeight(1);  
    for (float x=10; x<width; x = x + 20) {
      for (float y=10; y<width; y = y + 20) {
        ellipse(x, y, 20, 20);
        fill(y/3+x/30, 100, 100);
      }
    }
    noStroke(); 
    for (float r=210; r>=0; r--) {
      noStroke();
      ellipse(160, 455, r, r);
      fill(r/2.57, 100, 100);
    }
  }
}

void exercise9() {
  if (screen == 12) {
    colorMode(RGB);
    resetBackground();
    surface.setSize(600, 600);
    fill(255);
    for (int i = 0; i < xCircle.length; i++) {
      ellipse(xCircle[i], yCircle [i], 20, 20);
    }
    for (int i = 0; i < lines.length; i++) {
      if (yCircle[i]>height/2) {
        line(xCircle[i], yCircle[i], lines[i], height);
      }
      if (yCircle[i]<height/2) {
        line(xCircle[i], yCircle[i], lines[i], 0);
      }
    }
  }
}

void exercise10() {
  if (screen == 13) {
    surface.setSize(600, 300);
    resetBackground();
    fill(255);
    textAlign(LEFT);
    text(sentence, 0, 25);
    text("Number of Characters: " + sentence.length(), 0, 50);
    text("Number of Capital Letters: " + capitals, 0, 75);
    text("Number of Vowels: " + vowels, 0, 100);
    text("Number of words: " + wordCount, 0, 125);
    text("Number of Punctuation Marks: " + punctuation, 0, 150);
    text("Most Used Letter: " + maximum, 0, 175);
  }
}
//exercise 11 funtions
char mostCommonLetter(String lowercasesentence) {
  char current;
  int currentCount = 0;
  char maximum = 0;
  int maximumCount = 0;

  char[] lower = lowercasesentence.toCharArray();
  for (int i=0; i<lower.length; i++) {
    current=lower[i];
    currentCount=0;

    for (int j=0; j<lower.length; j++) {

      if (lower[j]==current) {
        currentCount++;

        if (currentCount>maximumCount) {
          maximumCount = currentCount;

          maximum=current;
        }
      }
    }
  }  
  return maximum;
}
int capitalCount() {
  int capitals=0;
  char[] original = sentence.toCharArray();  

  for (int i=0; i<sentence.length(); i++) {
    if (original[i]<91 && original[i]>64) {
      capitals++;
    }
  }
  return capitals;
}

int vowelCount() {
  char[] original = sentence.toCharArray();  
  int vowels = 0;
  for (int i=0; i<sentence.length(); i++) {
    if (original[i]==97 || original[i]==101 || original[i]==105 || original[i]== 111 || original[i]==117||
      original[i]==65||original[i]==69||original[i]==73||original[i]==79||original[i]==85) {
      vowels++;
    }
  }
  return vowels;
}
int wordCount() {
  char[] original = sentence.toCharArray();  
  int wordCount=0;

  for (int i=0; i<sentence.length(); i++) {
    if (original[i]==' ') {
      wordCount++;
    }
  }
  return wordCount;
}
int punctuation() {
  char[] original = sentence.toCharArray();  
  int punctuation=0;
  for (int i=0; i<sentence.length(); i++) {
    if (original[i]==39||original[i]==58||original[i]==59||original[i]==46||original[i]==44||original[i]==33||original[i]==63) {
      punctuation++;
    }
  }
  return punctuation;
}

void exercise11() {
  if (screen == 14) {
    resetBackground();
    fill(255);
    textAlign(LEFT);
    text(sentence, 0, 25);
    text("Number of Characters: " + sentence.length(), 0, 50);
    text("Number of Capital Letters: " + capitals, 0, 75);
    text("Number of Vowels: " + vowels, 0, 100);
    text("Number of words: " + wordCount, 0, 125);
    text("Number of Punctuation Marks: " + punctuation, 0, 150);
    text("Most Used Letter: " + maximum, 0, 175);
  }
}
//functions for exercise 12
//othello
int characterCount(String [] file) {
  int characterCount = 0;
  for (int i = 0; i < file.length; i++) {
    String words = file[i];
    for (int j = 0; j < words.length(); j++) {//goes through the characters of the line
      characterCount++;
    }
  }
  return characterCount;
}

//capital count in illiad
int capitalLetterCount(String [] file) {
  int capsCount = 0;
  for (int i = 0; i < file.length; i++) {
    String words = file[i];
    for (int j = 0; j < words.length(); j++) {
      char letters[] = words.toCharArray();
      if (letters[j] < 91 && letters[j] >= 65) {
        capsCount++;
      }
    }
  }
  return capsCount;
}

//vowel count in romeo and juliet
int vowelCount2(String [] file) {
  int vowelCount = 0;
  for (int i = 0; i < file.length; i++) {
    String words = file[i];
    for (int j = 0; j < words.length(); j++) {
      char vowels[] = words.toUpperCase().toCharArray();
      if (vowels[j] == 'A' || vowels[j] == 'E' || vowels[j] == 'I' || vowels[j] == 'O' || vowels[j] == 'U' || vowels[j] == 'Y') {
        vowelCount++;
      }
    }
  }
  return vowelCount;
}

//word count in the odyssey
int wordCount2(String [] file) {
  int wordCount = 0;
  for (int i = 0; i < file.length; i++) {
    String trimLine = trim(file[i]);
    String [] words = trimLine.split(" ");
    if (!file[i].equals("")) {
      for (int j = 0; j < words.length; j++) {
        wordCount++;
      }
    }
  }
  return wordCount;
}

//punctuation count in hamlet
int puncCount2(String [] file) {
  int punctuationCount = 0;
  for (int i = 0; i < file.length; i++) {
    String words = file[i];
    for (int j = 0; j < words.length(); j++) {
      char letters[] = words.toCharArray();
      if (letters[j] == 39 || letters[j] == 58 || letters[j] == 59 || letters[j] == 44 || letters[j] == 46 || letters[j] == 33 || letters[j] == 63) {
        punctuationCount++;
      }
    }
  }
  return punctuationCount;
}

//most common letter in macbeth
String mostCommonLetter2(String [] file) {
  String mostCommonLetter = "";
  int charCount;
  int maxCharValue = 0;
  char maxChar;

  for (int i = 0; i < file.length; i++) { //trims file array
    file[i] = file[i].trim();
  }
  String joinedFile = join(file, ""); //Puts trimmed array into one string
  String splitFile[] = joinedFile.split(" "); //Separates the array at spaces
  String stringedFile = join(splitFile, ""); //Joins the array back
  char allLetters[] = stringedFile.toLowerCase().toCharArray();

  for (int i = 0; i < allLetters.length; i++) {
    char currentChar = allLetters[i];
    charCount = 0;

    for (int j = 0; j < allLetters.length; j++) {
      if (currentChar == allLetters[j]) {
        charCount++;
        if (charCount > maxCharValue) {
          maxCharValue = charCount;
          maxChar = allLetters[i];
          mostCommonLetter = (str(maxChar) + " : " + maxCharValue);
        }
      }
    }
  }
  return mostCommonLetter;
}
void exercise12() {
  if (screen==15) {
    String [] othello = loadStrings("othello.txt");
    String [] illiad = loadStrings("illiad.txt");
    String [] romeoAndJuliet = loadStrings("romeoAndJuliet.txt");
    String [] theOdyssey = loadStrings("theOdyssey.txt");
    String [] hamlet = loadStrings("hamlet.txt");
    String [] macbeth = loadStrings("macbeth.txt");
    fill(255);
    text("Number of characters in Othello: " + characterCount(othello), 0, 25);
    text("Number of capitals in Illiad: " + capitalLetterCount(illiad), 0, 50);
    text("Number of vowels in Romeo and Juliet: " + vowelCount2(romeoAndJuliet), 0, 75);
    text("Number of words in The Odyssey: " + wordCount2(theOdyssey), 0, 100);
    text("Number of punctuations in Hamlet: " + puncCount2(hamlet), 0, 125);
    text("Most common letter in Macbeth: " + mostCommonLetter2(macbeth), 0, 150);
  }
}

void endScreen() {
  if (screen == 11) {
    surface.setSize(600, 600);
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text("END.. Click here to return to login", 300, 1300);
  }
}