/// Represents a participant.
///
/// This is an **immutable** class. Once an instance is created, its properties
/// cannot be changed. To "modify" a participant, a new instance must be
/// created using the [copyWith] method.
class Teilnehmer {
  /// The full name of the participant.
  final String name;

  /// The age of the participant.
  final int alter;

  /// The participant's email address. Can be null if not provided.
  final String? email;

  /// Creates a new constant instance of a [Teilnehmer].
  const Teilnehmer({required this.name, required this.alter, this.email});

  /// Returns a user-friendly string representation of the [Teilnehmer].
  @override
  String toString() {
    return 'Name: $name, Alter: $alter, Email: $email';
  }

  /// Creates a copy of this [Teilnehmer] instance with optional new values.
  ///
  /// If a parameter is not provided, the value from the original instance is used.
  /// For example, `copyWith(name: 'New Name')` will create a new participant
  /// with the new name but the same age and email as the original.
  Teilnehmer copyWith({String? name, int? alter, Function()? email}) =>
      Teilnehmer(
        name: name ?? this.name,
        alter: alter ?? this.alter,
        email: email != null ? email() : this.email,
      );
}

/// An example participant instance.
Teilnehmer teilnehmer1 = const Teilnehmer(
  name: 'Max Mustermann',
  alter: 25,
  email: 'iwas',
);

/// A second example participant instance.
Teilnehmer teilnehmer2 = const Teilnehmer(
  name: 'Melissa ',
  alter: 26,
  email: 'iwas',
);

void main() {
  print('Original: $teilnehmer1');

  Teilnehmer teilnehmer1Kopie = teilnehmer2.copyWith(email: () {});

  print('Kopie ohne Email: $teilnehmer1Kopie');
}
