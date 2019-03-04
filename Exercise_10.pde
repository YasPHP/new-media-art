String newSentence;
void exercise10(){
while(j==0){
surface.setSize(200,200);
fill(0);
text("Refer to Console",100,100);
  plainText = loadStrings("bible.txt");
  newSentence = join(plainText, "\n");
  words = newSentence.split(" ");
  capCheck(newSentence);
  punctCheck(newSentence);
  vowCheck(newSentence);
  mostLetter(newSentence);
  


  long endTime = System.nanoTime();
  long totalTime = endTime-startTime;
  println("\n\n\n\n\n\nData About The Bible");
  println("Total Punctuation"+ ":"+pCount);
  println("Total Capitals" +":"+ capCount);
  println("Total Words" +":"+ newSentence.length());
  println("Total Vowels" + ":" + vCount);
  println("Total Characters(Including Spaces)"+ ":"+ newSentence.length());
  println("Most Used Letter:"+ " " +mostChar+":" +maxFreq+" "+"times");
  println("Results Returned in"+" " + totalTime/1000000+"ms");
  j++;
}
}
int capCheck(String x) {
  char words[] = x.toCharArray();
  for (int i = 0; i< x.length(); i++) {
    for (char j = 65; j< 90; j++) {
      if (words[i] == j) {
        capCount++;
      }
    }
  }
  return capCount;
}
int punctCheck(String x) {
  char punct[] = punctuation.toCharArray();
  char words[] = x.toCharArray();
  for (int i = 0; i<x.length(); i++) {
    for (int j = 0; j<punct.length; j++) {
      if (words[i] == punct[j]) {
        pCount++;
      }
    }
  }
  return pCount;
}
int vowCheck(String x) {
  char vow[] = vowels.toCharArray();
  char words[] = x.toCharArray();
  for (int i =0; i<x.length(); i++) {
    for (int j = 0; j<vow.length; j++) {
      if (words[i] == vow[j]) {
        vCount++;
      }
    }
  }
  return vCount++;
}
int mostLetter(String x){
  lower = x.toLowerCase();
  for (char i=97; i<=122; i++) {
    for (int j=0; j<lower.length(); j++) {
      ch=lower.charAt(j);
      if (ch==i) {
        letterCount++;
      }
    }
    if (letterCount>maxFreq) {
      maxFreq=letterCount;
      mostChar=i;
      letterCount=0;
    } else {
      letterCount=0;
    }
  }
  return letterCount;
}
