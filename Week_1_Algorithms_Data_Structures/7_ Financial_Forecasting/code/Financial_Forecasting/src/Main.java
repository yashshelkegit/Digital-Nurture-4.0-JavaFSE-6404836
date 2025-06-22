public class Main {

    // Recursive method to calculate future value
    public static double predict(double initialAmount, double rate, int years) {
        if (years == 0) {
            return initialAmount;
        }
        double amount = predict(initialAmount, rate, years - 1);
        return  amount * (1 + rate);
    }

    public static void main(String[] args) {
        double initialAmount = 1000;
        double growthRate = 0.10;
        int years = 10;

        double futureValue = predict(initialAmount, growthRate, years);
        System.out.printf("Predicted Value after %d years = %.2f", years, futureValue);
    }
}
