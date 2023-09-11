//Sandbox

let grade: Character = "A"
let isNoon: Bool = false
let arr: [Int] = [9, 2, 19]
var group: String = "OOP"

class Car {
    var speed: Float = 0
    var isMoving: Bool = false
    func stop() {
        isMoving = false
    }
    func accelerate(amount: Float){
        speed += amount
        isMoving = speed != 0
    }
    func printSpeed() {
        if isMoving {
            print("The car is moving")
        } else {
            print("The car isn't moving")
        }
    }
}
