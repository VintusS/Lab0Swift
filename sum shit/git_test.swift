import Foundation

func generateRandomNumbers() -> [Int] {
    var randomNumbers: [Int] = []
    for _ in 1...10 {
        let randomNumber = Int.random(in: 1...100)
        randomNumbers.append(randomNumber)
    }
    return randomNumbers
}

func isPrime(_ number: Int) -> Bool {
    if number < 2 { return false }
    for i in 2...Int(sqrt(Double(number))) {
        if number % i == 0 {
            return false
        }
    }
    return true
}

let randomNumbers = generateRandomNumbers()

print("Random Numbers:")
print(randomNumbers)

let primeNumbers = randomNumbers.filter { isPrime($0) }
let averagePrime = primeNumbers.isEmpty ? 0 : Double(primeNumbers.reduce(0, +)) / Double(primeNumbers.count)

print("Prime Numbers:")
print(primeNumbers)
print("Average of Prime Numbers: \(averagePrime)")

let originalString = "Hello, World!"
let reversedString = String(originalString.reversed())

print("Original String: \(originalString)")
print("Reversed String: \(reversedString)")

class Dog {
    let name: String
    let breed: String
    
    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }
    
    func bark() {
        print("\(name) is barking!")
    }
}

let myDog = Dog(name: "Buddy", breed: "Golden Retriever")
myDog.bark()
