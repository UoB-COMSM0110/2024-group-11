//End menu display
void drawEnd() {
  // iq23062 update
  background(bgimg);
  fill(255, 0, 0);
  textSize(40);
  text("GAME OVER", width/2, 100);
  fill(0);
  textSize(20);
  if (!isdouble) {
    text("Your Score: " + p1score, width/2, 150);
    if (p1score > bestScore) {
      bestScore = p1score;
    }
    text("Best Score: " + bestScore, width/2, 180);
  } else {
    text("Player1 Score: " + p1score, width/2, 150);
    text("Player2 Score: " + p2score, width/2, 180);
    if (p1score > bestScore) {
      bestScore = p1score;
    }
    if (p2score > bestScore) {
      bestScore = p2score;
    }
    text("Best Score: " + bestScore, width/2, 210);
  }

  playAgainButton.display();
  backToMainMenuButton.display();
}
