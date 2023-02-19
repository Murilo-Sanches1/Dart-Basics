// - dois construtores (mesmo nome da classe)
// - classe com 3 propriedades, uma não pode ser setada diretamente,
// - então é definida com o método getter
class Spacecraft {
  String name;
  DateTime? launchDate;
  // + read-only non-final property
  int? get launchYear => launchDate?.year;

  // + constructor, com syntactic sugar para definir membros
  Spacecraft(this.name, this.launchDate) {
    // + ... ... ...
  }

  // + construtor nomeado que encaminha para o construtor padrão
  Spacecraft.unlaunched(String name) : this(name, null);

  // + método
  void describe() {
    print('Spacecraft: $name');
    // + type promotion doesn't work on getters.
    var launchDate = this.launchDate;
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

// print(DateTime.now().difference(new DateTime(2021, 1, 14)).inDays ~/ 365);

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(super.name, DateTime super.launchDate, this.altitude);
}

// + PilotedCraft agora tem o campo astronautas e o método describeCrew()
class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(super.name, super.launchDate);
}

// + Mixins are a way of reusing code in multiple class hierarchies. The following is a mixin declaration:
mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Número de astronautas: $astronauts');
  }
}

// + não tem interface
// - You can create an abstract class to be extended (or implemented) by a concrete class.
// - Abstract classes can contain abstract methods (with empty bodies).
abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}
// - Any class extending Describable has the describeWithEmphasis() method, which calls 
// - the extender’s implementation of describe().