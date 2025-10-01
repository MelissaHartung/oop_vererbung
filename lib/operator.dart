/// Repräsentiert eine Maßeinheit für Längen.
/// Jeder Wert enthält einen Umrechnungsfaktor ([toMmFactor]), um die Einheit
/// in Millimeter umzurechnen.
enum MeasurementSystem {
  /// Millimeter.
  mm(1),

  /// Zentimeter.
  cm(10),

  /// Dezimeter.
  dm(100),

  /// Meter.
  m(1000),

  /// Zoll (Inch).
  inch(25.4),

  /// Fuß (Feet).
  feet(304.8);

  /// Der Faktor zur Umrechnung dieser Einheit in Millimeter.
  final double toMmFactor;

  /// Erstellt eine neue Maßeinheit mit dem entsprechenden Umrechnungsfaktor.
  const MeasurementSystem(this.toMmFactor);
}

/// Repräsentiert ein Dreieck.
///
// Diese Klasse speichert die Maße intern immer in Millimetern, um eine
/// konsistente Basis für Berechnungen und Umrechnungen zu haben.
class Triangle {
  double _widthInMm;
  double _heightInMm;

  /// Die aktuelle Maßeinheit, in der die Dreiecksmaße repräsentiert werden.
  /// Wird durch die [convertTo]-Methode geändert.
  MeasurementSystem measurementSytem;

  Triangle(this._widthInMm, this._heightInMm)
    : measurementSytem = MeasurementSystem.mm;

  /// Rechnet die internen Maße des Dreiecks in eine andere [MeasurementSystem] um.
  /// Diese Methode modifiziert den privaten Zustand des Objekts.
  convertTo(MeasurementSystem to) {
    if (to == measurementSytem) return;
    _widthInMm = _widthInMm * measurementSytem.toMmFactor / to.toMmFactor;
    _heightInMm = _heightInMm * measurementSytem.toMmFactor / to.toMmFactor;
    measurementSytem = to;
  }

  /// Gibt die Höhe des Dreiecks in der angeforderten Maßeinheit [ms] zurück.
  ///
  /// Die Berechnung basiert auf der privat gespeicherten Höhe in Millimetern.
  getHeight(MeasurementSystem ms) {
    if (ms == MeasurementSystem.mm) return _heightInMm;
    if (ms == MeasurementSystem.cm) return _heightInMm / 10;
    if (ms == MeasurementSystem.dm) return _heightInMm / 100;
    if (ms == MeasurementSystem.m) return _heightInMm / 1000;
    if (ms == MeasurementSystem.inch) return _heightInMm / 25.4;
    if (ms == MeasurementSystem.feet) return _heightInMm / 304.8;
  }

  /// Gibt die Breite des Dreiecks in der angeforderten Maßeinheit [ms] zurück.
  /// Die Berechnung basiert auf der private gespeicherten Breite in Millimetern.
  getWidth(MeasurementSystem ms) {
    if (ms == MeasurementSystem.mm) return _widthInMm;
    if (ms == MeasurementSystem.cm) return _widthInMm / 10;
    if (ms == MeasurementSystem.dm) return _widthInMm / 100;
    if (ms == MeasurementSystem.m) return _widthInMm / 1000;
    if (ms == MeasurementSystem.inch) return _widthInMm / 25.4;
    if (ms == MeasurementSystem.feet) return _widthInMm / 304.8;
  }

  /// Setzt die Höhe des Dreiecks basierend auf einem Wert in der Maßeinheit [ms].
  /// Der Wert wird privat nach Millimetern umgerechnet und gespeichert.
  /// Werte kleiner oder gleich Null werden ignoriert.
  setHeight(MeasurementSystem ms, double height) {
    if (height <= 0) return;
    if (ms == MeasurementSystem.mm) _heightInMm = height;
    if (ms == MeasurementSystem.cm) _heightInMm = height * 10;
    if (ms == MeasurementSystem.dm) _heightInMm = height * 100;
    if (ms == MeasurementSystem.m) _heightInMm = height * 1000;
    if (ms == MeasurementSystem.inch) _heightInMm = height * 25.4;
    if (ms == MeasurementSystem.feet) _heightInMm = height * 304.8;
  }

  /// Setzt die Breite des Dreiecks basierend auf einem Wert in der Maßeinheit [ms].
  /// Der Wert wird privat  nach Millimetern umgerechnet und gespeichert.
  /// Werte kleiner oder gleich Null werden ignoriert.
  setWidth(MeasurementSystem ms, double width) {
    if (width <= 0) return;
    if (ms == MeasurementSystem.mm) _widthInMm = width;
    if (ms == MeasurementSystem.cm) _widthInMm = width * 10;
    if (ms == MeasurementSystem.dm) _widthInMm = width * 100;
    if (ms == MeasurementSystem.m) _widthInMm = width * 1000;
    if (ms == MeasurementSystem.inch) _widthInMm = width * 25.4;
    if (ms == MeasurementSystem.feet) _widthInMm = width * 304.8;
  }

  /// Berechnet die Fläche des Dreiecks in Quadratmillimetern.
  areaGetter(Triangle triangle) {
    return triangle._widthInMm * triangle._heightInMm;
  }

  @override
  String toString() {
    return 'widthInMm: $_widthInMm, heightInMm: $_heightInMm, measurementSytem: $measurementSytem';
  }
}
