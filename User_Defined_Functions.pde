
void resetLine1() {
  fill(98, 135, 193);
  circle(440, 500, 250);
  fill(0);
  strokeWeight(7);
  line(440,500,440,378);
}

void resetLine2() {
  fill(98, 135, 193);
  circle(1240, 500, 250);
  fill(0);
  strokeWeight(7);
  line(1240,500,1240,378);
}

void cueSongDeck1(SoundFile file) {
  file.stop();
  file.cue(0);
  spin1 = false;
  pushMatrix();
    translate(440,500);
    fill(98,135,193);
    circle(0,0,250);
    fill(0);
  popMatrix();
  resetLine1();
  theta1 = 0;
}

void cueSongDeck2(SoundFile file) {
  file.stop();
  file.cue(0);
  spin2 = false;
  pushMatrix();
    translate(1240,500);
    fill(98,135,193);
    circle(0,0,250);
    fill(0);
  popMatrix();
  resetLine2();
  theta2 = 0;
}

void togglePlaySongDeck1(SoundFile file) {
  if(!play1) {
    file.play();
    spin1 = true;
    play1 = true;
  }
  else {
    file.pause();
    spin1 = false;
    play1 = false;
  }
}

void togglePlaySongDeck2(SoundFile file) {
  if(!play2) {
    file.play();
    
    spin2 = true;
    play2 = true;
  }
  else {
    file.pause();
    spin2 = false;
    play2 = false;
  }
}

void scratch() {
  int num = int(random(4));
  if(num == 0) {
    scratch1.play();
  }
  else if(num == 1) {
    scratch2.play();
  }
  else if(num == 2) {
    scratch3.play();
  }
  else if(num == 3) {
    scratch4.play();
  }
}

void loadSongDeck1(int index) {
  songs.get(songIndex1).stop();
  spin1 = false;
  resetLine1();
  songIndex1 = index; // change index to new selected index
  // reset display window
  fill(16, 89, 206);
  strokeWeight(4);
  stroke(130);
  rect(295, 140, 300, 60);
  // display window song text
  textSize(15);
  stroke(0);
  fill(0);
  text(songNames.get(songIndex1), 310, 170);
}

void loadSongDeck2(int index) {
  songs.get(songIndex2).stop();
  spin2 = false;
  resetLine2();
  songIndex2 = index; // change index to new selected index
  // reset display window
  fill(16, 89, 206);
  strokeWeight(4);
  stroke(130);
  rect(1095, 140, 300, 60);
  // display window song text
  textSize(15);
  stroke(0);
  fill(0);
  text(songNames.get(songIndex2), 1110, 170);
}
