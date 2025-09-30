/// Leere Liste um dort alle tiere zu speichern und filtern zu können
List<Tiere> meineTiere = [];

/// vorlageklasse für andere tierklassen
abstract class Tiere {
  /// Name des Tieres
  String name;

  /// Erstellt eine neue Instanz der [Tiere] mit dem gegebenen [name]
  /// und fügt sie automatisch der globalen Liste [meineTiere] hinzu.

  Tiere(this.name) {
    meineTiere.add(this);
  }

  /// Funktion für geräusche aller Tiere
  void makeSound();

  /// Funktion für das fortbewegen der Tiere
  void move() {}
}

/// Definiert einen Vertrag (Interface) für Objekte, die fliegen können.
abstract class CanFly {
  /// Die Aktion des Fliegens.
  void canFly();
}

/// Definiert einen Vertrag (Interface) für Objekte, die unter Wasser atmen können können.
abstract class CanBreatheUnderWater {
  /// Die Aktion des unter wasser atmen.
  void canBreatheUnderWater();
}

/// Definiert einen Vertrag (Interface) für Objekte, die klettern können.
abstract class CanClimbing {
  /// Die Aktion des klettern.
  void canClimbing();
}

/// Repräsentiert eine Katze.
/// Eine Katze ist ein [Tiere], das auch die Fähigkeit [CanClimbing] besitzt.
class Katze extends Tiere implements CanClimbing {
  /// Erstellt eine neue Instanz einer [Katze] mit dem gegebenen [name].
  Katze(super.name);

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

/// Repräsentiert eine Vogel.
/// Eine Vogel ist ein [Tiere], das auch die Fähigkeit [CanFly] besitzt.
class Vogel extends Tiere implements CanFly {
  /// Erstellt eine neue Instanz eines [Vogel] mit dem gegebenen [name].

  Vogel(super.name);

  @override
  void move() {
    print('$name fliegt');
  }

  @override
  void makeSound() {
    print('Zwitscher');
  }

  @override
  void canFly() {
    print('$name fliegt ');
  }
}

/// Repräsentiert einen Fisch.
/// Ein Fisch ist ein [Tiere], das auch die Fähigkeit [CanBreatheUnderWater] besitzt.
class Fisch extends Tiere implements CanBreatheUnderWater {
  /// Erstellt eine neue Instanz eines [Fisch] mit dem gegebenen [name].

  Fisch(super.name);

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

/// Repräsentiert einen Rotkelchen.
/// Ein Rotkelchen ist ein [Vogel].
class Rotkelchen extends Vogel {
  /// Erstellt eine neue Instanz eines [Rotkelchen] mit dem gegebenen [name].

  Rotkelchen(super.name);

  @override
  void move() {
    print('$name fliegt');
  }

  @override
  void makeSound() {
    print('Zwitscher');
  }
}

/// Repräsentiert einen Adler.
/// Ein Adler ist ein [Vogel].
class Adler extends Vogel {
  /// Erstellt eine neue Instanz eines [Adler] mit dem gegebenen [name].

  Adler(super.name);

  @override
  void move() {
    print('$name fliegt');
  }

  @override
  void makeSound() {
    print('Quack');
  }
}

/// Filtern der Tiere die fliegen können
Object? globalFly() {
  int anzahlFliegeVieh = 0;
  for (Tiere tier in meineTiere) {
    if (tier is CanFly) {
      anzahlFliegeVieh = meineTiere.whereType<CanFly>().length;

      print(tier.runtimeType);
      print(tier.name);
    }
  }
  print('Anzahl der fliegenden Geschöpfe der Welt $anzahlFliegeVieh');
  return null;
}

// muss in bin ordner
Vogel asmel = Vogel('asmel');
Adler adler1 = Adler('heinz');
Adler adler2 = Adler('hans');
Adler adler3 = Adler('heino');
Katze katz1 = Katze('Flauschi');
Katze katz2 = Katze('sir Schnurzelot');
Fisch fisch1 = Fisch('nemo');
Fisch fisch2 = Fisch('dory');
Rotkelchen rotkelchen1 = Rotkelchen('Piepsy');

void main() {
  globalFly();
}
