import Foundation

// MARK: Checkpoint 7

/*
 - Mmake a class hierarchy for animals.
 - Start with Animal. Add a legs property for the number of legs an animal has.
 - Make Dog a subclass of Animal, giving it a speak() method that prints a dog barking string, but each subclass should print something different.
 - Make Corgi and Poodle subclasses of Dog.
 - Make Cat an Animal subclass. Add a speak() method, with each subclass printing something different, and an isTame Boolean, set with an initializer.
 - Make Persian and Lion as subclasses of Cat.
*/

class Animal {
    let legs: Int

    init(legs: Int = 4) {
        self.legs = legs
    }

    func speak() {
        assertionFailure("This should never be called.")
    }
}

class Dog: Animal {
    override func speak() {
        print("The dog says 'woof'!")
    }
}

final class Corgi: Dog {
    override func speak() {
        print("The Corgi says 'yip'!")
    }
}

final class Poodle: Dog {
    override func speak() {
        print("The Poodle says 'bark'!")
    }
}

class Cat: Animal {
    let isTame: Bool

    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }

    override func speak() {
        print("The cat says 'meow'!")
    }
}

final class Persian: Cat {
    override func speak() {
        print("The Persian says 'purr'!")
    }
}

final class Lion: Cat {
    init(legs: Int) {
        super.init(legs: legs, isTame: false)
    }

    override func speak() {
        print("The Lion says 'roar'!")
    }
}
