//Sandbox

let grade: Character = "A"
let isNoon: Bool = false
let arr: [Int] = [9, 2, 19]
var group: String = "OOP"

class Car {
    var speed: Float = 0
    var isMoving: Bool = false
    init(speed: Float, isMoving: Bool) {
        self.speed = speed
        self.isMoving = isMoving
    }
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
            print("Speed:", speed, " Units")
        } else {
            print("The car isn't moving")
        }
    }
}

var bibica = Car(speed: 0, isMoving: false)
bibica.accelerate(amount: 10)
bibica.printSpeed()
print()
bibica.stop()
bibica.printSpeed()
