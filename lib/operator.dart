/// class of coins to lern operator
class Coinstack {
  final List<int> _coins;

  Coinstack(this._coins);

  /// the sum of the list in [Coinstack]
  int get sum => _coins.fold(0, (a, b) => a + b);

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
  int get hashCode => _coins.hashCode;

  @override
  bool operator ==(Object other) {
    return sum == other;
  }

  /// Add the list with the other.
  Coinstack operator +(Coinstack other) {
    return Coinstack(_coins + other._coins);
  }

  /// Subtract the list index with the [other] an create a new object or return null.
  Coinstack? operator -(Coinstack other) {
    for (int coin in other._coins) {
      _coins.remove(coin);
      return Coinstack(_coins);
    }

    if (other._coins != _coins) {}
    return null;
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
  bool stack4 = stack1 < stack2;

  print(stack3);
  print(stack4);

  print(stack1 == stack2);
}
