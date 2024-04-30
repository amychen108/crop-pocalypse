class HealthCalc {
    int currentHealth = 3;
public:
    void take_damage() {
        currentHealth = currentHealth - 1;
        if (currentHealth < 0) {
            currentHealth = 0;
        }
    }

    int get_health() {
        return currentHealth;
    }

};