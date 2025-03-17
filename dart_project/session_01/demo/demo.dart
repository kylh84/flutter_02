import 'dart:io';

void main() {
  print('Hello World');

  String name; // not null
  int age;

  print('Enter name: ');
  name = stdin.readLineSync()!;

  print('Enter age: ');
  age = int.parse(stdin.readLineSync()!); // convert string to int

  print('Name: $name');
  print('Age: $age');
}
