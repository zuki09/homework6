import controlP5.*;

ControlP5 cp5;
 ColorPicker cp;

float s1=20, s2=255;

int colors[]={#bdb6e5, #debdd2, #bcd5ef, #dbdff8};

int xPos=0;
int yPos=0;
void setup() {
  size(800, 600);
  noStroke();
  cp5=new ControlP5(this);
  //
  cp = cp5.addColorPicker("picker")
          .setPosition(500, 150)
          .setColorValue(color(190, 218, 243, 128))
          ;
    //      
          
  cp5.begin(580, 50);
  cp5.addSlider("s1", 10, 200).linebreak();
  cp5.addSlider("s2", 0, 255);
  cp5.end();

  cp5.getTooltip().setDelay(500);
  cp5.getTooltip().register("s1", "Changes the size of the rect.");
  cp5.getTooltip().register("s2", "Changes the color of the rect");

  smooth();
  noStroke();
  
  
}

void draw() {
  fill(cp.getColorValue(), 50);
  noStroke();
  rect(0, 0, 800, 600);
  //background(cp.getColorValue());
  fill(0, 80);
  rect(490, 140, 275, 80);
  
  fill(s2);
  noStroke();
  rect(xPos, yPos, s1, s1);
  
  //strokeWeight(5);
  //line(pmouseX,pmouseY,mouseX,mouseY);
  //background(255);
  //if (key=='p') {
  //  fill(colors[(int)random(0, 4)]);
  //  noStroke();
  //  rect(random(0, width), random(0, height), random(0, 20), random(0, 20));
  //}
}

public void controlEvent(ControlEvent c) {
  // when a value change from a ColorPicker is received, extract the ARGB values
  // from the controller's array value
  if(c.isFrom(cp)) {
    int r = int(c.getArrayValue(0));
    int g = int(c.getArrayValue(1));
    int b = int(c.getArrayValue(2));
    int a = int(c.getArrayValue(3));
    color col = color(r,g,b,a);
    println("event \talpha:"+a+"\tred:"+r+"\tgreen:"+g+"\tblue:"+b+"\tcol"+col);
  }
}

// color information from ColorPicker 'picker' are forwarded to the picker(int) function
void picker(int col) {
  println("picker\talpha:"+int(alpha(col))+"\tred:"+int(red(col))+"\tgreen:"+int(green(col))+"\tblue:"+int(blue(col))+"\tcol"+col);
}

void keyPressed() {
  if (key=='a') {
    xPos-=5;
  }
  if (key=='d') {
    xPos+=5;
  }
  if (key=='w') {
    yPos-=5;
  }
  if (key=='s') {
    yPos+=5;
  }
  //if (key=='p') {
  //  fill(colors[(int)random(0, 4)]);
  //  noStroke();
  //  rect(random(0, width), random(0, height), random(0, 20), random(0, 20));
  //}

  println("unregistering the tooltip for s2");
  cp5.getTooltip().unregister("s2");
}
