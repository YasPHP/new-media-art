String[] othello;
String []illiad;
String[] hamlet;
String[] romeo;
String[] macbeth;
String[] odyssey;
String othello1;
String illiad1;
String hamlet1;
String romeo1;
String macbeth1;
String odyssey1;
String[] wordsOthello;
String []wordsHamlet;
String[] wordsRomeo;
String []wordsMacbeth;
String[] wordsOdyssey;
String[] wordsIlliad;

void exercise11(){
  while(j==0){
    othello = loadStrings("othello.txt");
  othello1 = join(othello, "\n");
  wordsOthello = othello1.split(" ");
  illiad = loadStrings("illiad.txt");
  illiad1 = join(illiad, "\n");
  wordsIlliad = illiad1.split(" ");
  hamlet = loadStrings("hamlet.txt");
  hamlet1 = join(hamlet, "\n");
  wordsHamlet = hamlet1.split(" ");
  romeo = loadStrings("romeoAndJuliet.txt");
  romeo1= join(romeo, "\n");
  wordsRomeo =romeo1.split(" ");
  macbeth= loadStrings("macbeth.txt");
  macbeth1 = join(macbeth, "\n");
  wordsMacbeth = macbeth1.split(" ");
  odyssey= loadStrings("theOdyssey.txt");
  odyssey1 = join(odyssey, "\n");
  wordsOdyssey =odyssey1.split(" ");
  
  capCheck(illiad1);
  punctCheck(hamlet1);
  vowCheck(romeo1);
  mostLetter(macbeth1);
  


  long endTime = System.nanoTime();
  long totalTime = endTime-startTime;
  println("Total Punctuation in Hamlet"+ ":"+pCount);
  println("Total Capitals in Illiad" +":"+ capCount);
  println("Total Words in The Odyssey" +":"+ wordsOdyssey.length);
  println("Total Vowels in Romeo And Juliet" + ":" + vCount);
  println("Total Characters(Including Spaces) in Othello"+ ":"+ othello1.length());
  println("Most Used Letter in Macbeth:"+ " " +mostChar+":" +maxFreq+" "+"times");
  println("Results Returned in"+" " + totalTime/1000000+"ms");
  j++;
  }
}
