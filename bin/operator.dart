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
    return Coinstack([sum + other.sum]);
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
}

void main() {
  Coinstack stack1 = Coinstack([3, 5, 6]);
  Coinstack stack2 = Coinstack([1, 2]);
  Coinstack? stack3 = stack1 - stack2;
  bool stack4 = stack1 < stack2;

  print(stack3);
  print(stack4);

  // print(stack1 == stack2);
}
