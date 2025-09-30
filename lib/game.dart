import 'dart:io';
import 'dart:math';

/// The base class for all objects that can exist in the game world.
///
/// Every [GameObject] has a [name] and a position ([posX], [posY]).
class GameObject {
  /// The display name of the game object.
  String name;

  /// The object's position on the horizontal X-axis.
  int posX = 0;

  /// The object's position on the vertical Y-axis.
  int posY = 0;

  /// Creates a new instance of a [GameObject].
  GameObject(this.name, this.posX, this.posY);

  /// Called when the object is removed from the game.
  void despawn() {}
}

/// An abstract base class for any [GameObject] that can take damage.
abstract class DamageableObject extends GameObject {
  /// The maximum health this object can have.
  int maxHealth;
  int _health;
  int get health => _health;

  /// Creates a new instance of a [DamageableObject].
  DamageableObject(
    this.maxHealth,
    this._health,
    String name,
    int posX,
    int posY,
  ) : super(name, posX, posY);

  /// Checks if the object's health is at or below zero.
  bool isDead() {
    if (_health <= 0) {
      return true;
    } else {
      return false;
    }
  }

  /// Reduces the object's health by the given [damage] amount.
  void takeDamage(int damage) {
    _health -= damage;

    if (_health <= 0) {
      onKilled();
    }
  }

  /// A callback method that is triggered when the object's health drops to zero.
  void onKilled() {}
}

/// Represents the player in the game.
class Player extends DamageableObject {
  int _score = 0;
  int get score => _score;
  int _livesremaining = 3;

  /// Creates a new [Player] instance.
  Player(super.maxHealth, super._health, super.name, super.posX, super.posY);

  /// Overrides the default behavior for when the player is killed.
  /// Decrements lives and resets the player's position.
  @override
  void onKilled() {
    if (_livesremaining > 0) {
      _livesremaining--;
    }
    posX = 0;
    posY = 0;
  }

  /// Adds a given amount of [score] to the player's total score.
  void addScore(int score) {
    _score += score;
    print('Score: $_score');
  }
}

/// A simple manager to hold global game state, like the current player.
class GameManager {
  /// A static reference to the current player instance.
  static Player? currentPlayer;
}

/// Represents a monster enemy in the game.
class Monster extends DamageableObject {
  /// The threat level of the monster, used for score calculation.
  int threatlevel = 0;

  /// The color of the monster.
  String color = '';

  /// Creates a new [Monster] instance with a specific threat level and color.
  Monster(
    super.maxHealth,
    super._health,
    super.name,
    super.posX,
    super.posY,
    this.threatlevel,
    String color,
  ) {
    this.color = color;
  }

  /// Makes the monster produce a sound.
  String makeNoise() {
    print('grrr');
    return 'grrr';
  }

  /// Awards score to the player when the monster is killed.
  @override
  void onKilled() {
    print('$name wurde getötet');
    if (GameManager.currentPlayer != null) {
      GameManager.currentPlayer!.addScore(threatlevel * 10);
    }
  }
}
