
void mousePressed() {
  if(mouseX >= 180 && mouseX <= 245 && mouseY >= 810 && mouseY <= 875) { // cue button 1
    cueSongDeck1(songs.get(songIndex1));
  }
  
  if(mouseX >= 180 && mouseX <= 245 && mouseY >= 890 && mouseY <= 955) { // play button 1
    togglePlaySongDeck1(songs.get(songIndex1));
  }
  
  if(mouseX >= 980 && mouseX <= 1045 && mouseY >= 810 && mouseY <= 875) { // cue button 2
    cueSongDeck2(songs.get(songIndex2));
  }
  
  if(mouseX >= 980 && mouseX <= 1045 && mouseY >= 890 && mouseY <= 955) { // play button 2
    togglePlaySongDeck2(songs.get(songIndex2));
  }
  
  if(mouseX >= 215 && mouseX <= 665 && mouseY >= 275 && mouseY <= 725) { // play scratch deck 1
    scratch();
  }
  
  if(mouseX >= 1015 && mouseX <= 1465 && mouseY >= 275 && mouseY <= 725) { // play scratch deck 2
    scratch();
  }
}

void keyPressed() {
  
  // turn on/off deck 1 load indicator
  if(key == 'v') { 
    if(!deck1Select) {
      deck1Select = !deck1Select;
      strokeWeight(0);
      fill(0,255,0);
      rect(610, 140, 20, 20);
      fill(0);
    }
    else if(deck1Select) {
      deck1Select = !deck1Select;
      strokeWeight(0);
      fill(255,0,0);
      rect(610, 140, 20, 20);
      fill(0);
    }
  }
  
  // turn on/off deck 2 load indicator
  if(key == 'b') {
    if(!deck2Select) {
      deck2Select = !deck2Select;
      strokeWeight(0);
      fill(0,255,0);
      rect(1410, 140, 20, 20);
      fill(0);
    }
    else if(deck2Select) {
      deck2Select = !deck2Select;
      strokeWeight(0);
      fill(255,0,0);
      rect(1410, 140, 20, 20);
      fill(0);
    }
  }
  
  // volume panel 1
  if(key == 'z') {
    if(!vol1On) {
      vol1On = !vol1On;
      strokeWeight(0);
      fill(0,255,0);
      rect(355,810,20,20);
      fill(0);
    }
    else if(vol1On) {
      vol1On = !vol1On;
      strokeWeight(0);
      fill(255,0,0);
      rect(355,810,20,20);
      fill(0);
    }
  }
  
  // volume panel 2
  if(key == 'n') {
    if(!vol2On) {
      vol2On = !vol2On;
      strokeWeight(0);
      fill(0,255,0);
      rect(1155,810,20,20);
      fill(0);
    }
    else if(vol2On) {
      vol2On = !vol2On;
      strokeWeight(0);
      fill(255,0,0);
      rect(1155,810,20,20);
      fill(0);
    }
  }
  
  // lowpass panel 1
  if(key == 'x') {
    if(!low1On) {
      low1On = !low1On;
      strokeWeight(0);
      fill(0,255,0);
      rect(485,810,20,20);
      fill(0);
    }
    else if(low1On) {
      low1On = !low1On;
      strokeWeight(0);
      fill(255,0,0);
      rect(485,810,20,20);
      fill(0);
    }
  }
  
  // lowpass panel 2
  if(key == 'm') {
    if(!low2On) {
      low2On = !low2On;
      strokeWeight(0);
      fill(0,255,0);
      rect(1285,810,20,20);
      fill(0);
    }
    else if(low2On) {
      low2On = !low2On;
      strokeWeight(0);
      fill(255,0,0);
      rect(1285,810,20,20);
      fill(0);
    }
  }
  
  // highpass panel 1
  if(key == 'c') {
    if(!high1On) {
      high1On = !high1On;
      strokeWeight(0);
      fill(0,255,0);
      rect(615,810,20,20);
      fill(0);
    }
    else if(high1On) {
      high1On = !high1On;
      strokeWeight(0);
      fill(255,0,0);
      rect(615,810,20,20);
      fill(0);
    }
  }
  
  // highpass panel 2
  if(key == ',') {
    if(!high2On) {
      high2On = !high2On;
      strokeWeight(0);
      fill(0,255,0);
      rect(1415,810,20,20);
      fill(0);
    }
    else if(high2On) {
      high2On = !high2On;
      strokeWeight(0);
      fill(255,0,0);
      rect(1415,810,20,20);
      fill(0);
    }
  }
  
  // load key presses
  if(deck1Select && !deck2Select){
    if(key == '1')
      loadSongDeck1(0);
    if(key == '2')
      loadSongDeck1(1);
    if(key == '3')
      loadSongDeck1(2);
    if(key == '4')
      loadSongDeck1(3);
    if(key == '5')
      loadSongDeck1(4);
  }
  if(deck2Select && !deck1Select){
    if(key == '1')
      loadSongDeck2(0);
    if(key == '2')
      loadSongDeck2(1);
    if(key == '3')
      loadSongDeck2(2);
    if(key == '4')
      loadSongDeck2(3);
    if(key == '5')
      loadSongDeck2(4);
  }
  
  if(key == 'f')
    scratch1.play();
  if(key == 'g')
    scratch2.play();
  if(key == 'h')
    scratch3.play();
  if(key == 'j')
    scratch4.play();
  
    
  if(key == 'w')
    cueSongDeck1(songs.get(songIndex1));
  if(key == 's')
    togglePlaySongDeck1(songs.get(songIndex1));
  if(key == 'i')
    cueSongDeck2(songs.get(songIndex2));
  if(key == 'k')
    togglePlaySongDeck2(songs.get(songIndex2));
  
}
