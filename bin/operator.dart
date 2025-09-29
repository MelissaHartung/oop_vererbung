class Coinstack {
  List<int> _coins = [];
  Coinstack(this._coins);

  @override
  int get sum => _coins.fold(0, (a, b) => a + b);
  bool operator <(Coinstack other) {
    return sum < other.sum;
  }

  bool operator >(Coinstack other) {
    return sum > other.sum;
  }

  bool operator <=(Coinstack other) {
    return sum <= other.sum;
  }

  bool operator >=(Coinstack other) {
    return sum >= other.sum;
  }

  bool operator ==(Object other) {
    return sum == other;
  }

  @override
  Coinstack operator +(Coinstack other) {
    return Coinstack(_coins + other._coins);
  }

  @override
  Coinstack? operator -(Coinstack other) {
    for (int coin in other._coins) {
      _coins.remove(coin);
      return Coinstack.new(_coins);
    }
    ;
    if (other._coins != _coins) {
      return null;
    }
  }

  @override
  String toString() {
    return _coins.toString();
  }
}

void main() {
  Coinstack stack1 = Coinstack([1, 2, 3]);
  Coinstack stack2 = Coinstack([3, 5, 6]);
  Coinstack? stack3 = stack1 - stack2;
  bool istStack1Kleiner = stack1 < stack2;
  bool istStack1Groesser = stack1 > stack2;
  bool istStack1Gleich = stack1 == stack2;
  print(stack3);
  print(istStack1Kleiner);
  print(istStack1Groesser);
  print(istStack1Gleich);
}
