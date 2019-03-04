int vCount=0, pCount = 0, capCount=0;
int count[];
String punctuation = "':;.,!?";
String vowels = "AEIOUaeiou";
String[] words;
int index=0;
char character;
String[] plainText;
String lower;
char ch;
int letterCount=0;
int maxFreq = 0;
char mostChar;
char[] upper;
long startTime=System.nanoTime();
void exercise9(){

while(j==0){
  surface.setSize(200,200);
  text("Refer To Console",50,50);
  plainText = loadStrings("bible.txt");
  String newSentence = join(plainText, "\n");
  words = newSentence.split(" ");
  char words[] = newSentence.toCharArray();
  for (int i = 0; i< newSentence.length(); i++) {
    for (char j = 65; j< 90; j++) {
      if (words[i] == j) {
        capCount++;
      }
    }
  }
  char punct[] = punctuation.toCharArray();
  for (int i = 0; i< newSentence.length(); i++) {
    for (int j = 0; j<punct.length; j++) {
      if (words[i] == punct[j]) {
        pCount++;
      }
    }
  }
  char vow[] = vowels.toCharArray();
  for (int i =0; i<newSentence.length(); i++) {
    for (int j = 0; j<vow.length; j++) {
      if (words[i] == vow[j]){
        vCount++;
      }
    }
  }
  lower = newSentence.toLowerCase();
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
  long endTime = System.nanoTime();
  long totalTime = endTime-startTime;
  println("\n\n\n\n\n\nData About the Bible");
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
