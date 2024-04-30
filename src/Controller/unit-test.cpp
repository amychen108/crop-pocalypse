// unit tests

#include <iostream>
#include "health-calc.cpp"

void testHealthCalc() {
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

int main() {
    testHealthCalc();

    return 0;
}