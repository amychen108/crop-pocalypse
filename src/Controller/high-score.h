#ifndef HIGHSCORE_H
#define HIGHSCORE_H

class HighScore {
    int scoresInOrder[3];

public:
    int* get_scores();
    void insert_new_score(int newScore);
};

#endif // HIGHSCORE_H
