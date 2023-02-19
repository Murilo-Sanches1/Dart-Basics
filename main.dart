// ignore_for_file: unused_local_variable
import 'class.dart';
import 'enum.dart';
import 'async.dart';

// + main é onde tudo começa
void main() {
  print("Olá console");

  // + string
  var name = 'Voyager I';
  // + int
  var year = 1977;
  // + double
  var antennaDiameter = 3.7;
  // + list = array
  var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
  // + map = object (key value pair)
  var image = {
    'tags': ['saturn'],
    'url': '//path/to/saturn.jpg'
  };

  // + final = js const - The final variable '...' can only be set once.
  for (final object in flybyObjects) {
    print(object);
  }

  // + retornos de funções e tipos de parâmetros
  int fibonacci(int n) {
    if (n == 0 || n == 1) return n;
    return fibonacci(n - 1) + fibonacci(n - 2);
  }

  print(fibonacci(20));

  // + arrow functions & parecido com System.linq (C#)
  // - pode passar top-level functions como argumentos (forEach(print))
  flybyObjects.where((name) => name.contains('turn')).forEach(print);

  Spacecraft voyager = new Spacecraft('voyager I', new DateTime(1977, 9, 5));
  voyager.describe();
  Spacecraft voyager3 = new Spacecraft.unlaunched('Voyager III');
  voyager3.describe();

  List<Planet> planets = [
    Planet.mercury,
    Planet.neptune,
    Planet.uranus,
    Planet.venus
  ];
  var spreed = [...planets];
  spreed.forEach(print);

  printWithDelay("Async Await");
}
