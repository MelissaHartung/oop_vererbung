abstract class Tiere {
  String name;

  Tiere(this.name);

  void makeSound();
  void move() {}
}

abstract class CanFly {
  void canfly();
}

abstract class CanBreatheUnderWater {
  void canBreatheUnderWater();
}

abstract class CanClimbing {
  void canClimbing();
}

class Katze extends Tiere implements CanClimbing {
  Katze(String name) : super(name);

  @override
  void move() {
    print('$name  läuft');
  }

  @override
  void makeSound() {
    print('Miau');
  }

  @override
  void canClimbing() {
    print('$name is climbing');
  }
}

class Vogel extends Tiere implements CanFly {
  Vogel(String name) : super(name);

  @override
  void move() {
    print('$name fliegt');
  }

  @override
  void makeSound() {
    print('Zwitscher');
  }

  @override
  void canfly() {
    print('$name fliegt');
  }
}

class Rotkelchen extends Vogel implements CanFly {
  Rotkelchen(String name) : super(name);

  @override
  void move() {
    print('$name fliegt');
  }

  @override
  void makeSound() {
    print('Zwitscher');
  }

  @override
  void canfly() {
    print('$name fliegt');
  }
}

class Adler extends Tiere implements CanFly {
  Adler(String name) : super(name);

  @override
  void move() {
    print('$name fliegt');
  }

  @override
  void makeSound() {
    print('Quack');
  }

  @override
  void canfly() {
    print('$name fliegt');
  }
}

class Fisch extends Tiere implements CanBreatheUnderWater {
  Fisch(String name) : super(name);

  @override
  void move() {
    print('Fisch schwimmt');
  }

  @override
  void makeSound() {
    print('Blub');
  }

  @override
  void canBreatheUnderWater() {
    print('$name is breathing under water');
  }
}

Vogel asmel = Vogel('asmel');
Adler adler1 = Adler('heinz');
Adler adler2 = Adler('hans');
Adler adler3 = Adler('heino');
Katze katz1 = Katze('Flauschi');
Katze katz2 = Katze('sir Schnurzelot');
Fisch fisch1 = Fisch('nemo');
Fisch fisch2 = Fisch('dory');
Rotkelchen rotkelchen1 = Rotkelchen('Piepsy');

List<Tiere> meineTiere = [
  asmel,
  adler1,
  adler2,
  adler3,
  katz1,
  katz2,
  fisch1,
  fisch2,
  rotkelchen1,
];

Object? globalFly() {
  for (Tiere Tier in meineTiere) {
    if (Tier is CanFly) {
      print(Tier.name);
    }
  }
}

void main() {
  globalFly();
}
