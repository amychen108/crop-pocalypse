// unit tests

#include <iostream>
#include <array>
#include "health-calc.cpp"
#include "high-score.cpp"

void testHealthCalc() {
    std::cout << "Testing Health Calculation, Damage Taken";
    HealthCalc myhealth = HealthCalc();
    int result = 2;
    myhealth.take_damage();
    if (result == myhealth.get_health()) {
        std::cout << "Test Passed: Damage taken once, health is 2";
    }
    else {
        std::cerr << "Test Failed";
    }

}

void testHighScore() {
    std::cout << "Testing High Scores, numbers are 17, 25, 21";
    HighScore scores = HighScore();
    scores.insert_new_score(17); // should be moved to first
    scores.insert_new_score(25); // should be moved to first, other should be second
    scores.insert_new_score(21); // should be in second

    int * thescores = scores.get_scores();

    if (thescores[0] == 25) {
        if (thescores[1] == 21) {
            if (thescores[2] == 17) {
                std::cout << "Test Passed: High Scores are 25, 21, 17";
            }
            else {
                std::cerr << "Test Failed";
            }
        }
        else {
            std::cerr << "Test Failed";
        }
    }
    else {
        std::cerr << "Test Failed";
    }

}

int main() {
    testHealthCalc();

    return 0;
}