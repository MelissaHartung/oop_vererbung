/// class of coins to lern operator
class Coinstack {
  static const _coinValues = [1, 2, 5, 10, 20, 50, 100, 200];
  final List<int> _coins;

  Coinstack(List<int> coins) : _coins = [] {
    for (var coin in coins) {
      if (!_coinValues.contains(coin)) {
        //ist der wert nicht passend zu den werten in _coinvalues
        throw ArgumentError('Ungültige Münze');
      }
      _coins.add(coin); //füge die der liste hinzu
    }
  }

  /// the sum of the list in [Coinstack]
  int get sum => _coins.fold(0, (a, b) => a + b);
  List get coin => _coins;

  int get summe1 {
    var summe = 0;
    for (var i = 0; i < _coins.length; i++) {
      summe = summe + _coins[i];
    }
    return summe;
  }

  int get summe2 {
    var summe = 0;
    for (final coin in _coins) {
      summe = summe + coin;
    }
    return summe;
  }

  /// Checks if the total value of this stack is less than the [other].
  bool operator <(Coinstack other) {
    return sum < other.sum;
  }

  /// Checks if the total value of this stack is more than the [other].
  bool operator >(Coinstack other) {
    return sum > other.sum;
  }

  /// Checks if the total value of this stack is less or the same than the [other].
  bool operator <=(Coinstack other) {
    return sum <= other.sum;
  }

  /// Checks if the total value of this stack is more or the same than the [other].
  bool operator >=(Coinstack other) {
    return sum >= other.sum;
  }

  @override
  bool operator ==(Object other) {
    return sum == other;
  }

  @override
  int get hashCode => _coins.hashCode;

  /// Add the list with the other.
  Coinstack operator +(Coinstack other) {
    return Coinstack([..._coins, ...other._coins]);
  }

  /// Subtract the list index with the [other] an create a new object or return null.
  Coinstack? operator -(Coinstack other) {
    List<int> remaining = List.from(_coins);
    for (int coin in other._coins) {
      if (remaining.contains(coin)) {
        remaining.remove(coin);
      } else {
        return null;
      }
    }
    return Coinstack(remaining);
  }

  @override
  String toString() {
    return _coins.toString();
  }

  void addcoin(int newCoin) {
    if (_coinValues.contains(newCoin)) {
      _coins.add(newCoin);
    } else {
      throw ArgumentError('Diese Münze gibt es nicht');
    }
  }

  void addCoins(List<int> newCoins) {
    for (int coin in newCoins) {
      if (_coinValues.contains(coin)) {
        _coins.add(coin);
      } else {
        throw ArgumentError('Bitte nur bekannte Münzen');
      }
    }
  }

  void removeCoin(int coin) {
    if (_coins.contains(coin)) {
      _coins.remove(coin);
    } else {
      throw ArgumentError('keine passende Münze in der Liste!');
    }
  }

  void removeCoins(List<int> coins) {
    for (int coins in coins) {
      if (_coins.contains(coins)) {
        _coins.remove(coins);
      } else {
        throw ArgumentError('keine passende Münzen');
      }
    }
  }

  bool containsCoins(List<int> coins) {
    for (int coin in coins) {
      if (!_coins.contains(coin)) {
        return false;
      }
    }
    return true;
  }

  bool containsCoin(int coin) {
    return _coins.contains(coin);
  }

  bool contains(Coinstack other) {
    if (coin.length != other.coin.length) {
      return false;
    }
    var coinstacksorted = [
      ...coin,
    ]..sort(); //kopiert die listen mit spread operartor und cascade operator sortiert diese
    var coinstackOtherSorted = [...other.coin]..sort();
    for (int i = 0; i < coinstacksorted.length; i++) {
      if (coinstacksorted[i] != coinstackOtherSorted[i]) {
        return false;
      }
    }
    return true;
  }

  bool canGiveValue(int value) {
    if (sum < value) {
      return false;
    }
    List<int> sortedcoins = List.from(coin)
      ..sort((b, a) => a.compareTo(b)); //sortiere die liste und mach eine kopie
    int rest = value;
    for (int coin in sortedcoins) {
      //für jede münze in der sortierten liste
      if (coin <= rest) {
        //ist der coin kleiner oder gleich dem rest value
        rest -= coin; //ziehe diesen ab
        if (rest == 0) {
          return true;
        }
      }
    }
    return false;
  }

  void removeValue(int value) {
    if (value > sum) {
      throw ArgumentError('Nicht genug Geld');
    }

    List<int> sortedCoins = List.from(coin)
      ..sort((b, a) => a.compareTo(b)); // von groß nach klein
    int rest = value;
    List<int> toRemove = [];

    for (int c in sortedCoins) {
      if (c <= rest) {
        rest -=
            c; // falls coin kleiner ist als restwert, soll er abziehen von coins
        toRemove.add(c);
        if (rest == 0) break;
      }
    }

    if (rest > 0) {
      throw ArgumentError('Nicht genug passende Münzen');
    }

    for (int c in toRemove) {
      _coins.remove(c);
    }
  }
}
// addCoin(int value)
// addCoins(List<int> values)
// removeCoin(int value) [throws]
// removeCoins(List<int> values) [throws]
// bool containsCoin(int value)
// bool containsCoins(List<int> value)
// bool contains(Coinstack coinstack)
// bool canGiveValue(int value)
// void removeValue(int value) [throws]
// Alle Methoden wehren sich gg. ungültige Coin-Values [throwing]

void main() {
  Coinstack stack1 = Coinstack([200, 50, 10]);
  Coinstack stack4 = Coinstack([2, 2, 2, 5]);
  // Coinstack stack3 = Coinstack([2, 3, 4, 5, 6, 7, 243, 41, 3, 34, 4, 32]);
  // stack1.addcoin(90);
  // stack1.addCoins([10, 10, 10, 80]);
  // stack1.removeCoin(3);
  // stack1.removeCoins([10, 10, 10]);
  // stack1.containsCoin(10);
  stack1.removeValue(200);
  print(stack1);
  print(stack4);

  // Coinstack stack2 = Coinstack([6, 3, 5]);

  // print(stack3);
  // print(stack4);
  // print(stack1);
  // print(stack3.contains(stack4));
  // print(stack1.canGiveValue(140));

  // print(stack1.containsCoin(10));
  // print(stack1.containsCoins([10, 10, 10]));
}
