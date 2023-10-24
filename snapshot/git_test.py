import random

# Create a list of random numbers
random_numbers = [random.randint(1, 100) for _ in range(10)]

# Function to check if a number is prime
def is_prime(num):
    if num < 2:
        return False
    for i in range(2, int(num ** 0.5) + 1):
        if num % i == 0:
            return False
    return True

# Filter prime numbers from the list
prime_numbers = [num for num in random_numbers if is_prime(num)]

# Calculate the average of the prime numbers
if prime_numbers:
    average_prime = sum(prime_numbers) / len(prime_numbers)
else:
    average_prime = 0

# Print the original list
print("Random Numbers:")
print(random_numbers)

# Print the prime numbers
print("Prime Numbers:")
print(prime_numbers)

# Print the average of prime numbers
print("Average of Prime Numbers:", average_prime)

# Function to reverse a string
def reverse_string(input_str):
    return input_str[::-1]

# Example usage
original_string = "Hello, World!"
reversed_string = reverse_string(original_string)

# Print the reversed string
print("Original String:", original_string)
print("Reversed String:", reversed_string)

# Class definition
class Dog:
    def __init__(self, name, breed):
        self.name = name
        self.breed = breed

    def bark(self):
        print(f"{self.name} is barking!")

# Create a Dog instance
my_dog = Dog("Buddy", "Golden Retriever")

# Call the bark method
my_dog.bark()
