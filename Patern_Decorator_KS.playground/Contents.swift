import UIKit

protocol Coffee {
    
    var cost: Int {get}
}

protocol CoffeeDecorator: Coffee {
    var ingredient: Coffee {get}
    
    init(ingredient: Coffee)
}

class SimpleCoffee: Coffee {
    
    var cost: Int {
        return 10
    }
}

class DoubleCoffee: CoffeeDecorator {
    var ingredient: Coffee
    
    var cost: Int {
        return ingredient.cost + SimpleCoffee().cost
    }
    
    required init(ingredient: Coffee) {
        self.ingredient = ingredient
    }
}

class Milk: CoffeeDecorator {
    var ingredient: Coffee
    
    var cost: Int {
        return ingredient.cost + 5
    }
    
    required init(ingredient: Coffee) {
        self.ingredient = ingredient
    }
}

class Sugar: CoffeeDecorator {
    var ingredient: Coffee
    
    var cost: Int {
        return ingredient.cost + 2
    }
    
    required init(ingredient: Coffee) {
        self.ingredient = ingredient
    }
}

class Whip: CoffeeDecorator {
    var ingredient: Coffee
    
    var cost: Int {
        return ingredient.cost + 20
    }
    
    required init(ingredient: Coffee) {
        self.ingredient = ingredient
    }
}

let simpleCoffee = SimpleCoffee()
let coffeeWhithMilk = Milk(ingredient: simpleCoffee)
let coffeeWhithSugar = Sugar(ingredient: simpleCoffee)
let coffeeWhithMilkAndSuger = Sugar(ingredient: coffeeWhithMilk)
let coffeeWhithMilkAndDubleSuger = Sugar(ingredient: coffeeWhithMilkAndSuger)
let doubleCoffee = DoubleCoffee(ingredient: simpleCoffee)
let coffeeWhithWhip = Whip(ingredient: simpleCoffee)

let dubleCoffeeWithWhipShugarMilk = Whip(ingredient: Sugar(ingredient: Milk(ingredient: doubleCoffee)))

print(simpleCoffee.cost)
print(coffeeWhithMilk.cost)
print(coffeeWhithSugar.cost)
print(coffeeWhithMilkAndSuger.cost)
print(coffeeWhithMilkAndDubleSuger.cost)
print(doubleCoffee.cost)
print(coffeeWhithWhip.cost)

print(dubleCoffeeWithWhipShugarMilk.cost)






