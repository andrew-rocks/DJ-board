import processing.sound.*;

LowPass lowPass1, lowPass2;
HighPass highPass1, highPass2;

SoundFile stupid, jackieChan, moreThanYouKnow, toughLove, flyKicks;
SoundFile scratch1, scratch2, scratch3, scratch4;

ArrayList<SoundFile> songs = new ArrayList<SoundFile>();
ArrayList<String> songNames = new ArrayList<String>();

int songIndex1 = 0;
int songIndex2 = 1;

int increment = 0;

int colorNum = 0;

float vol1,vol2;
float lowamp1, lowamp2;
float highamp1, highamp2;

// song variables
boolean play1 = false;
boolean play2 = false;

// line spin variables
boolean spin1 = false;
boolean spin2 = false;
float line1x, line1y, line2x, line2y;
float theta1 = 0;
float theta2 = 0;

// button variables
boolean deck1Select = false;
boolean deck2Select = false;
boolean vol1On = false;
boolean vol2On = false;
boolean low1On = false;
boolean low2On = false;
boolean high1On = false;
boolean high2On = false;

void setup() {
  size(1680, 1000); // try displayWidth and displayHeight later
  background(77, 80, 96);

  // outer turntable circles
  stroke(130);
  strokeWeight(3);
  fill(0);
  circle(440, 500, 550);
  circle(1240, 500, 550);
  stroke(0);


  // inner turntable circles
  fill(98, 135, 193);
  circle(440, 500, 250);
  circle(1240, 500, 250);

  // initial color squares
  for(int i = 760; i < 920; i += 40) {
    for(int j = 300; j < 640; j += 40) {
    strokeWeight(0);
    fill(int(random(256)),int(random(256)),int(random(256)));
    square(i,j,40);
    }
  }

  // song selection window
  stroke(130);
  fill(16, 89, 206);
  strokeWeight(4);
  rect(690, 40, 300, 200);

  textSize(14);
  fill(0);
  stroke(0);
  text("1: Stupid - Mr. Belt & Wezol",700,60);
  text("2: Jackie Chan - Tiesto, Post Malone",700,100);
  text("3: More Than You Know - Axwell Ingrosso",700,140);
  text("4: Tough Love - Tiesto Remix - Avicii",700,180);
  text("5: Fly Kicks - Wax Motif mix - AC Slater",700,220);
  
  



  // song display windows
  // deck 1
  fill(16, 89, 206);
  strokeWeight(4);
  stroke(130);
  rect(295, 140, 300, 60);
  // deck 2
  fill(16, 89, 206);
  strokeWeight(4);
  rect(1095, 140, 300, 60);
  stroke(0);


  // buttons
  // deck 1
  fill(0);
  square(180, 810, 65); // que
  square(180, 890, 65); // play/pause
  fill(255);
  textSize(12);
  text("Play/Pause", 182, 926);
  text("Cue", 201, 849);
  // deck 2
  fill(0);
  square(980, 810, 65); // que
  square(980, 890, 65); // play/pause
  fill(255);
  text("Play/Pause", 982, 926);
  text("Cue", 1001, 849);

  
  // volume panels
  strokeWeight(3);
  stroke(130);
  fill(142,48,165);
  rect(280,810,60,145); // deck 1
  rect(1080,810,60,145); // deck 2
  stroke(0);
  
  // volume edit on/off indicators
  strokeWeight(0);
  fill(255,0,0);
  rect(355,810,20,20); // deck 1
  rect(1155,810,20,20); // deck 2
  
  // lowpass panels
  strokeWeight(3);
  stroke(130);
  fill(142,48,165);
  rect(410,810,60,145); // deck 1
  rect(1210,810,60,145); // deck 2
  stroke(0);

  // lowpass edit on/off indicators
  strokeWeight(0);
  fill(255,0,0);
  rect(485,810,20,20); // deck 1
  rect(1285,810,20,20); // deck 2
  
  // highpass panels
  strokeWeight(3);
  stroke(130);
  fill(142,48,165);
  rect(540,810,60,145); // deck 1
  rect(1340,810,60,145); // deck 2
  stroke(0);
  
  // highpass edit on/off indicators
  strokeWeight(0);
  fill(255,0,0);
  rect(615,810,20,20); // deck 1
  rect(1415,810,20,20); // deck 2
  
  
  // load on/off indicators
  strokeWeight(0);
  fill(255,0,0);
  rect(610, 140, 20, 20);
  rect(1410, 140, 20, 20);
  
  // static text
  //title
  fill(0);
  textSize(70);
  stroke(98, 135, 193);
  text("Roma DJ", 1350, 80);
  stroke(0);
  
  // slider labels
  //textSize(5);
  //fill(0);
  //text("VOL",355,770);
  
  
  // reset lines
  resetLine1();
  resetLine2();

  


  // songs
  stupid = new SoundFile(this, "stupid.mp3");
  jackieChan = new SoundFile(this, "jackieChan.mp3");
  moreThanYouKnow = new SoundFile(this, "moreThanYouKnow.mp3");
  toughLove = new SoundFile(this, "toughLove.mp3");
  flyKicks = new SoundFile(this, "flyKicks.mp3");

  songs.add(stupid);
  songs.add(jackieChan);
  songs.add(moreThanYouKnow);
  songs.add(toughLove);
  songs.add(flyKicks);
  
  
  // song names
  songNames.add("Stupid - Mr. Belt & Wezol");
  songNames.add("Jackie Chan - Tiesto, Post Malone");
  songNames.add("More Than You Know - Axwell Ingrosso");
  songNames.add("Tough Love - Tiesto Remix - Avicii");
  songNames.add("Fly Kicks - Wax Motif mix - AC Slater");
  
  
  
  // scratch noises
  scratch1 = new SoundFile(this, "scratch1.wav");
  scratch2 = new SoundFile(this, "scratch2.wav");
  scratch3 = new SoundFile(this, "scratch3.wav");
  scratch4 = new SoundFile(this, "scratch4.wav");
  


  // display window song text
  textSize(15);

  text(songNames.get(songIndex1), 310, 170);
  text(songNames.get(songIndex2), 1110, 170);
  
  // initialize filters
  lowPass1 = new LowPass(this);
  lowPass2 = new LowPass(this);
  highPass1 = new HighPass(this);
  highPass2 = new HighPass(this);
  
  
}

void draw() {

  // change color squares
  for(int i = 760; i < 920; i += 40) {
    for(int j = 300; j < 640; j += 40) {
    strokeWeight(0);
    if(colorNum % 30 == 0) {
      fill(int(random(256)),int(random(256)),int(random(256)));
      square(i,j,40);
    }
    }
  }
  
  
  // animate lines
  if (spin1) {
    pushMatrix();
      translate(440, 500);
      fill(98, 135, 193);
      circle(0, 0, 250);
      fill(0);
      strokeWeight(7);
      line1x = 122*cos(theta1);
      line1y = 122*sin(theta1);
      line(0, 0, line1x, line1y);
      theta1 = theta1 + PI/60;
    popMatrix();
  }
  if (spin2) {
    pushMatrix();
      translate(1240, 500);
      fill(98, 135, 193);
      circle(0, 0, 250);
      fill(0);
      strokeWeight(7);
      line2x = 122*cos(theta2);
      line2y = 122*sin(theta2);
      line(0, 0, line2x, line2y);
      theta2 = theta2 + PI/60;
    popMatrix();
  }
  
  // vol slider 1 function
  if(vol1On && mouseX >= 280 && mouseX <= 340) {
    vol1 = map(mouseY, 955, 810, 0, 1);
    songs.get(songIndex1).amp(vol1);
    strokeWeight(3);
    // draw line
    if(mouseY >= 810 && mouseY <= 955) {
      stroke(130);
      fill(142,48,165);
      rect(280,810,60,145);
      stroke(0);
      line(280,mouseY,mouseX,mouseY);
      line(mouseX,mouseY,340,mouseY);
    }
  }
  
  // vol slider 2 function
  if(vol2On && mouseX >= 1080 && mouseX <= 1140) {
    vol2 = map(mouseY, 955, 810, 0, 1);
    songs.get(songIndex2).amp(vol2);
    strokeWeight(3);
    // draw line
    if(mouseY >= 810 && mouseY <= 955) {
      stroke(130);
      fill(142,48,165);
      rect(1080,810,60,145);
      stroke(0);
      line(1080,mouseY,mouseX,mouseY);
      line(mouseX,mouseY,1140,mouseY);
    }
  }
  
  // lpf slider 1 function
  if(low1On) {
    if(mouseX >= 410 && mouseX <= 470) {
      lowamp1 = map(mouseY, 810, 955, 0, 1500);
      lowPass1.process(songs.get(songIndex1),lowamp1);
      // draw line
      if(mouseY >= 810 && mouseY <= 955) {
        stroke(130);
        fill(142,48,165);
        strokeWeight(3);
        rect(410,810,60,145);
        stroke(0);
        line(410,mouseY,mouseX,mouseY);
        line(mouseX,mouseY,470,mouseY);
      }
     }
  }
  else {
    lowPass1.stop();
  }

  // lpf slider 2 function
  if(low2On) {
    if(mouseX >= 1210 && mouseX <= 1270) {
      lowamp2 = map(mouseY, 810, 955, 0, 1500);
      lowPass2.process(songs.get(songIndex2),lowamp2);     
      // draw line
      if(mouseY >= 810 && mouseY <= 955) {
        stroke(130);
        fill(142,48,165);
        strokeWeight(3);
        rect(1210,810,60,145);
        stroke(0);
        line(1210,mouseY,mouseX,mouseY);
        line(mouseX,mouseY,1270,mouseY);
      }
    }
  }
  else {
    lowPass2.stop();
  }
  
  // hpf slider 1 function
  if(high1On) {
    if(mouseX >= 540 && mouseX <= 600) {
      highamp1 = map(mouseY, 954, 811, 0, 5000);
      highPass1.process(songs.get(songIndex1),highamp1);
      // draw line
      if(mouseY > 810 && mouseY < 955) {
        stroke(130);
        fill(142,48,165);
        strokeWeight(3);
        rect(540,810,60,145);
        stroke(0);
        line(540,mouseY,mouseX,mouseY);
        line(mouseX,mouseY,600,mouseY);
      }
     }
  }
  else {
    highPass1.stop();
  }
  
  // hpf slider 2 function
  if(high2On) {
    if( mouseX >= 1340 && mouseX <= 1400) {
      highamp2 = map(mouseY, 954, 811, 0, 5000);
      highPass2.process(songs.get(songIndex2),highamp2);
      // draw line
      if(mouseY > 810 && mouseY < 955) {
        stroke(130);
        fill(142,48,165);
        strokeWeight(3);
        rect(1340,810,60,145);
        stroke(0);
        line(1340,mouseY,mouseX,mouseY);
        line(mouseX,mouseY,1400,mouseY);
      }
     }
  }
  else {
    highPass2.stop();
  }

  colorNum++;
}
