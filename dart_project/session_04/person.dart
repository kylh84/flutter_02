// Object
abstract class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void displayInfo() {
    print(name);
    print(age);
  }

  @override
  String toString() {
    // convert the object to string
    return 'Name: $name, Age: $age';
  }
}
