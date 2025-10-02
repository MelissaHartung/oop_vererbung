void main() {
  for (int i = 1; i < 21; i++) {
    if (i % 2 != 0) {
      continue;
    }
    // print(i);
  }

  for (int i = 1; i < 21; i++) {
    // print(i);
  }

  int summe = 0;
  for (int i = 0; i < 100; i++) {
    if (i % 2 != 0) {
      continue;
    }
    summe += i;
  }

  // print(summe);

  for (int i = 0; i < 10; i++) {
    for (int j = 0; j < 10; j++) {
      int produkt = i * j;
      print('$i X $j =$produkt');
    }
  }

  int fakultaet(int n) {
    int ergebnis = 1;
    for (int i = 1; i <= n; i++) {
      ergebnis = ergebnis * i;
    }
    return ergebnis;
  }

  print(fakultaet(6));
}
