class HighScore {
    
    int scoresInOrder = [3];

    [int] get_scores() {
        return scoresInOrder;
    }

    void insert_new_score(int newScore) {
        if (newScore >= scoresInOrder[2]) { //check if greater than third
            if (newScore >= scoresInOrder[1]) { // check if greater than second
                if (newScore >= scoresInOrder[0]) { // check if greater than first
                    scoresInOrder[2] = scoresInOrder[1];
                    scoresInOrder[1] = scoresInOrder[0];
                    scoresInOrder[0] = newScore;
                }
                else {
                    scoresInOrder[2] = scoresInOrder[1];
                    scoresInOrder[1] = newScore;
                }
            }
            else {
                scoresInOrder[2] = newScore;
            }
        }
    }

}