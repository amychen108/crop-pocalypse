// unit tests

#include <iostream>
#include <array>
#include "src/Controller/health-calc.cpp"
#include "src/Controller/high-score.cpp"

bool testHealthCalc() {
    std::cout << "Testing Health Calculation, Damage Taken\n";
    HealthCalc myhealth = HealthCalc();
    int result = 2;
    myhealth.take_damage();
    if (result == myhealth.get_health()) {
        std::cout << "Test Passed: Damage taken once, health is 2\n";
        return true;
    }
    else {
        std::cerr << "Test Failed\n";
        return false;
    }
}

bool testHealthCalc2() {
    std::cout << "Testing Health Calculation, Damage Taken Twice\n";
    HealthCalc myhealth = HealthCalc();
    int result = 1;
    myhealth.take_damage();
    myhealth.take_damage();
    if (result == myhealth.get_health()) {
        std::cout << "Test Passed: Damage taken once, health is 1\n";
        return true;
    }
    else {
        std::cerr << "Test Failed\n";
        return false;
    }
}

bool testHealthCalc3() {
    std::cout << "Testing Health Calculation, Damage Taken More than 3 times\n";
    HealthCalc myhealth = HealthCalc();
    int result = 0;
    myhealth.take_damage();
    myhealth.take_damage();
    myhealth.take_damage();
    myhealth.take_damage();    
    myhealth.take_damage();
    myhealth.take_damage();
    if (result == myhealth.get_health()) {
        std::cout << "Test Passed: Damage taken once, health is 0\n";
        return true;
    }
    else {
        std::cerr << "Test Failed\n";
        return false;
    }
}

bool testHighScore() {
    std::cout << "Testing High Scores, numbers are 17, 25, 21\n";
    HighScore scores = HighScore();
    scores.insert_new_score(17); // should be moved to first
    scores.insert_new_score(25); // should be moved to first, other should be second
    scores.insert_new_score(21); // should be in second

    int * thescores = scores.get_scores();

    if (thescores[0] == 25 && thescores[1] == 21 && thescores[2] == 17) {
        std::cout << "Test Passed: High Scores are 25, 21, 17\n";
        return true;
    }
    else {
        std::cerr << "Test Failed\n";
        return false;
    }
}

bool testHighScore2() {
    std::cout << "Testing High Scores, numbers are 17, 25, 21, 84\n";
    HighScore scores = HighScore();
    scores.insert_new_score(17); // should be moved to first
    scores.insert_new_score(25); // should be moved to first, other should be second
    scores.insert_new_score(21); // should be in second
    scores.insert_new_score(84); //should replace first, knock down the rest

    int * thescores = scores.get_scores();

    if (thescores[0] == 84 && thescores[1] == 25 && thescores[2] == 21) {
        std::cout << "Test Passed: High Scores are 84, 25, 21\n";
        return true;
    }
    else {
        std::cerr << "Test Failed\n";
        return false;
    }
}

int main() {
    int passedTests = 0;
    int failedTests = 0;

    if (testHealthCalc()) {
        passedTests++;
    } else {
        failedTests++;
    }
        if (testHealthCalc2()) {
        passedTests++;
    } else {
        failedTests++;
    }
    
     if (testHealthCalc3()) {
        passedTests++;
    } else {
        failedTests++;
    }

    if (testHighScore()) {
        passedTests++;
    } else {
        failedTests++;
    }

    if (testHighScore2()) {
        passedTests++;
    } else {
        failedTests++;
    }

    std::cout << "Tests Passed: " << passedTests << std::endl;
    std::cout << "Tests Failed: " << failedTests << std::endl;

    return 0;
}
