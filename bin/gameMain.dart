import 'dart:io';
import 'dart:math';
import 'package:oop_vererbung/game.dart';

void main() {
  Monster monster1 = Monster(50, 50, 'Flauschi', 5, 5, 1, 'red');
  Player player1 = Player(50, 50, 'Sir Schnurzelot', 0, 0);
  GameManager.currentPlayer = player1;
  Random random = Random();
  bool gameRunning = true;
  while (gameRunning) {
    print("\nWähle eine Attacke");
    print("1.Schwertschlag");
    print("2 Magischer Schlag");
    print("3. Pfeil");
    print("4. Überrauschungsangriff");
    String? eingabe = stdin.readLineSync();
    int damage = 0;

    switch (eingabe) {
      case '1':
        damage = random.nextInt(10) + 10;
        print("Schwertschlag verursacht $damage Schaden");
        monster1.takeDamage(damage);
        break;
      case '2':
        damage = random.nextInt(10) + 10;
        print("Magischer Schlag verursacht $damage Schaden");
        monster1.takeDamage(damage);
        break;
      case '3':
        damage = random.nextInt(10) + 10;
        print("Pfeil verursacht $damage Schaden");
        monster1.takeDamage(damage);
        break;
      case '4':
        damage = random.nextInt(10) + 10;
        print("Überrauschungsangriff verursacht $damage Schaden");
        monster1.takeDamage(damage);
        break;
      default:
        print('Ungültige Eingabe');
    }
    if (monster1.isDead()) {
      print("${monster1.name} ist gestorben");
      gameRunning = false;
      break;
    } else {
      print("${monster1.name} hat noch ${monster1.health} Lebenspunkte");
    }
    int monsterDamage = random.nextInt(15) + 5;
    print("Das Monster greift zurück und verursacht $monsterDamage Schaden");
    player1.takeDamage(monsterDamage);

    if (player1.isDead()) {
      print("${player1.name} ist gestorben");
      player1.onKilled();
      gameRunning = false;
      break;
    } else {
      print("${player1.name} hat noch ${player1.health} Lebenspunkte");
    }
  }
  print(" Spiel beendet. Endscore: ${player1.score} Punkte");
}
