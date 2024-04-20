//Declare image resources
int currentBG = 0;
PImage BG;
ArrayList<String> bgStr = new ArrayList<String>();
ArrayList<String> birdColour = new ArrayList<String>();
PFont font1;
PFont font2;

SoundFile buttonClickSound;
SoundFile birdDieSound;
SoundFile birdhitPipeSound;
SoundFile birdJumpSound;
SoundFile birdHitCoinSound;
SoundFile eagleSound;

SoundFile menuBGM;
SoundFile normalModeLevelBGM;
SoundFile difficultModeLevelBGM;
SoundFile currentBGM;


//Create instances
void loadResources() {
  bgStr.add("BackGround/bg_cloudy.png");
  bgStr.add("BackGround/bg_forest.png");
  bgStr.add("BackGround/bg_mountain.png");
  bgStr.add("BackGround/bg_mountain2.png");
  bgStr.add("BackGround/bg_sunny.png");
  BG = loadImage(bgStr.get(currentBG));

  buttonClickSound = new SoundFile(this, "sound/click-button.mp3");
  birdDieSound = new SoundFile(this, "sound/die.mp3");
  birdhitPipeSound = new SoundFile(this, "sound/hit-sound.mp3");
  birdJumpSound = new SoundFile(this, "sound/jump.mp3");
  birdHitCoinSound = new SoundFile(this, "sound/point.mp3");
  eagleSound = new SoundFile(this, "sound/eagleSound.mp3");

  menuBGM = new SoundFile(this, "music/menu.mp3");
  normalModeLevelBGM = new SoundFile(this, "music/normalMode.MP3");
  difficultModeLevelBGM = new SoundFile(this, "music/difficultMode.MP3");
  
  font1 = loadFont("Font/Optima-Bold-48.vlw");
  font2 = loadFont("Font/Optima-Bold-200.vlw");
  textFont(font1);
}
