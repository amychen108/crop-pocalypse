// health-calc.h
#ifndef HEALTH_CALC_H
#define HEALTH_CALC_H

class HealthCalc {
private:
    int health = 3;

public:
    HealthCalc(); // Constructor
    void take_damage();
    int get_health() const;
};

#endif // HEALTH_CALC_H
