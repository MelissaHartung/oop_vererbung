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
      // print('$i X $j =$produkt');
    }
  }

  int fakultaet(int n) {
    int ergebnis = 1;
    for (int i = 1; i <= n; i++) {
      ergebnis = ergebnis * i;
    }
    return ergebnis;
  }

  // print(fakultaet(6));

  for (int i = 0; i < 20; i++) {
    for (int j = 0; j < 20; j++) {
      int produkt = i * j;
      // print('$i x $j = $produkt');
    }
  }

  int summe2 = 0;
  for (int i = 0; i < 100; i++) {
    summe2 += i;
  }
  // print(summe2);

  int summe3 = 0;
  for (int i = 0; i < 900; i++) {
    summe3 += i;
  }
  // print(summe3);

  int fakultaet2(int wert) {
    int ergebnis = 1;
    for (int i = 1; i <= wert; i++) {
      ergebnis = ergebnis * i;
    }
    return ergebnis;
  }

  print(fakultaet2(7));
}
