import 'dart:io';
import 'dart:math';


class GameObject {
  String name;
  int PosX = 0;
  int PosY = 0;
  GameObject(this.name, this.PosX, this.PosY);

  void despawn(){}
}

abstract class  DamageableObject extends GameObject{
  int maxHealth;
  int _health;
  DamageableObject(this.maxHealth, this._health, String name, int PosX, int PosY) : super(name, PosX, PosY);

  bool isDead(){
    if (_health <= 0) {
      return true;
    } else {
      return false;
    }
  }
  void takeDamage (int damage){
    _health -= damage;

    if (_health <= 0){
      onKilled();
    }
  }
  void onKilled (){
  }
}

class Player extends DamageableObject{
  int _score = 0;
  int _livesremaining = 3;
  Player(int maxHealth, int _health, String name, int PosX, int PosY) : super(maxHealth, _health, name, PosX, PosY);
   @override
  void onKilled(){
    if (_livesremaining > 0) {
      _livesremaining--;
    }
    PosX=0;
    PosY=0;
  }
  void addScore(int score){
    _score += score;
    print('Score: $_score');
  }

}
class GameManager {
  static Player? currentPlayer;
}

class Monster extends DamageableObject{
int threatlevel = 0;
String color = '';
Monster(int maxHealth, int _health, String name, int PosX, int PosY, int threatlevel, String color) : super(maxHealth, _health, name, PosX, PosY){
  this.threatlevel = threatlevel;
  this.color = color;
}

String makeNoise(){
  print('grrr');
  return 'grrr';

}
@override
  void onKilled() {
    print('$name wurde getötet');
     if (GameManager.currentPlayer != null) {
      GameManager.currentPlayer!.addScore(threatlevel * 10);
    }
  }
  }

  void main() {
    Monster monster1 = Monster(50,50,'Flauschi',5,5,1,'red');
  Player player1=Player(50, 50, 'Sir Schnurzelot', 0, 0);
  GameManager.currentPlayer=player1;
  Random random = Random();
bool gameRunning = true;
  while (gameRunning) {
print ("\nWähle eine Attacke");
print("1.Schwertschlag");
print("2 Magischer Schlag");
print ("3. Pfeil");
print("4. Überrauschungsangriff");
String? eingabe = stdin.readLineSync();
int damage=0;

switch (eingabe) {

case '1':
damage = random.nextInt(10)+10;
print("Schwertschlag verursacht $damage Schaden");
monster1.takeDamage(damage);
break;
case '2':
damage = random.nextInt(10)+10;
print("Magischer Schlag verursacht $damage Schaden");
monster1.takeDamage(damage);
break;  
case '3':
damage = random.nextInt(10)+10;
print("Pfeil verursacht $damage Schaden");
monster1.takeDamage(damage);
break;
case '4':
damage = random.nextInt(10)+10;
print("Überrauschungsangriff verursacht $damage Schaden");
monster1.takeDamage(damage);
break;
default:
print('Ungültige Eingabe');
}
if (monster1.isDead()){
  print("${monster1.name} ist gestorben");
gameRunning=false;
break;
}
else {
print("${monster1.name} hat noch ${monster1._health} Lebenspunkte");
}
int monsterDamage= random.nextInt(15)+5;
print("Das Monster greift zurück und verursacht $monsterDamage Schaden");
player1.takeDamage(monsterDamage);

if (player1.isDead()){
  print("${player1.name} ist gestorben");
  player1.onKilled();
  gameRunning=false;
  break;
}
else {
  print("${player1.name} hat noch ${player1._health} Lebenspunkte");
}
}
print(" Spiel beendet. Endscore: ${player1._score} Punkte");
  }
  
  


