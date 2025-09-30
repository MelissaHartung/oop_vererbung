class Teilnehmer {
  final String name;
  final int alter;
  final String? email;

  const Teilnehmer({required this.name, required this.alter, this.email});

  @override
  String toString() {
    return 'Name: $name, Alter: $alter, Email: $email';
  }

  Teilnehmer copyWith({String? name, int? alter, Function()? email}) =>
      Teilnehmer(
        name: name ?? this.name,
        alter: alter ?? this.alter,
        email: email != null ? email() : this.email,
      );
}

Teilnehmer teilnehmer1 = const Teilnehmer(
  name: 'Max Mustermann',
  alter: 25,
  email: 'iwas',
);

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
