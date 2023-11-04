import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class RandomCode {
    public static void main(String[] args) {
        Random random = new Random();

        List<Integer> randomNumbers = new ArrayList<>();
        for (int i = 0; i < 10; i++) {
            randomNumbers.add(random.nextInt(100) + 1);
        }

        System.out.println("Random Numbers:");
        System.out.println(randomNumbers);

        List<Integer> primeNumbers = new ArrayList<>();
        for (int num : randomNumbers) {
            if (isPrime(num)) {
                primeNumbers.add(num);
            }
        }

        double averagePrime = primeNumbers.isEmpty() ? 0 : primeNumbers.stream().mapToDouble(Integer::doubleValue).average().getAsDouble();

        System.out.println("Prime Numbers:");
        System.out.println(primeNumbers);
        System.out.println("Average of Prime Numbers: " + averagePrime);

        String originalString = "Hello, World!";
        String reversedString = reverseString(originalString);

        System.out.println("Original String: " + originalString);
        System.out.println("Reversed String: " + reversedString);

        Dog myDog = new Dog("Buddy", "Golden Retriever");
        myDog.bark();
    }

    static boolean isPrime(int num) {
        if (num < 2) return false;
        for (int i = 2; i <= Math.sqrt(num); i++) {
            if (num % i == 0) {
                return false;
            }
        }
        return true;
    }

    static String reverseString(String input) {
        return new StringBuilder(input).reverse().toString();
    }

    static class Dog {
        private String name;
        private String breed;

        public Dog(String name, String breed) {
            this.name = name;
            this.breed = breed;
        }

        public void bark() {
            System.out.println(name + " is barking!");
        }
    }
}
