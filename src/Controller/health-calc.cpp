class HealthCalc {
    int currentHealth = 3;

    void take_damage() {
        currentHealth = currentHealth - 1;
        if (currentHealth < 0) {
            currentHealth = 0;
        }
    }

    int get_health() {
        return currentHealth;
    }

}