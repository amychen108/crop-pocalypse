// health-calc.cpp
#include "health-calc.h"

HealthCalc::HealthCalc() {} // Create instance of class

void HealthCalc::take_damage() {
    health--; // Decrease health by 1
    if (health < 0) {
        health = 0;
    }
}

int HealthCalc::get_health() const {
    return health;
}