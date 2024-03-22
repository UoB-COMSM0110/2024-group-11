import java.util.ArrayList;
import processing.sound.*;

//Declare interface related parameters and objects
int currentUI = 1;
final int MainMenuState = 1;
final int SettingsMenuState = 2;
final int InLevel = 3;
final int GameOverMenuState = 4;
MainMenu mainMenu;
SettingsMenu settingsMenu;
Level level;
GameOverMenu gameOverMenu;

boolean spacePressed = false;
boolean upPressed = false;
