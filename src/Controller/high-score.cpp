#include "high-score.h"

int* HighScore::get_scores() {
    return scoresInOrder;
}

void HighScore::insert_new_score(int newScore) {
    if (newScore >= scoresInOrder[2]) {
        if (newScore >= scoresInOrder[1]) {
            if (newScore >= scoresInOrder[0]) {
                scoresInOrder[2] = scoresInOrder[1];
                scoresInOrder[1] = scoresInOrder[0];
                scoresInOrder[0] = newScore;
            } else {
                scoresInOrder[2] = scoresInOrder[1];
                scoresInOrder[1] = newScore;
            }
        } else {
            scoresInOrder[2] = newScore;
        }
    }
}
