void home() {

  background(198, 212);
  surface.setSize(600, 600);
  fill(255);
  if (permissions.equals("User")) {
    for (int i=0; i<=height; i+=100) {
      rect(10, 10+i, 300, 50);
    }
    int j=1;
    for (int i=50; i<height; i+=100) {
      fill(0 );
      text("Exercise"+(j), 110, i);
      j++;
    }
    if (mouseArea(10, 310, 10, 60)) {
      exerciseState=1;
    }
    if (mouseArea(10, 310, 110, 160)) {
      exerciseState=2;
    }
    if (mouseArea(10, 310, 210, 260)) {
      exerciseState=3;
    }
    if (mouseArea(10, 310, 310, 360)) {
      exerciseState=4;
    }

    if (mouseArea(10, 310, 410, 460)) {
      exerciseState=5;
    }
    if (mouseArea(10, 310, 510, 560)) {
      exerciseState=6;
    }
  }
  if (permissions.equals("Expanded User")) {
    for (int i=0; i<=height; i+=120) {
      rect(10, 10+i, 300, 50);
    }
    int j=7;
    for (int i=50; i<height; i+=120) {
      fill(0);
      text("Exercise"+(j), 110, i);
      j++;
    }
    if (mouseArea(10, 310, 10, 60)) {
      exerciseState=7;
    }
    if (mouseArea(10, 310, 130, 180)) {
      exerciseState=8;
    }
    if (mouseArea(10, 310, 250, 300)) {
      exerciseState=9;
    }
    if (mouseArea(10, 310, 370, 420)) {
      exerciseState=10;
    }

    if (mouseArea(10, 310, 490, 540)) {
      exerciseState=11;
    }
  }
}
