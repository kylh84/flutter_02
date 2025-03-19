num sum(num num1, num num2) {
  return num1 + num2;
}

num subtract(num num1, num num2) {
  return num1 - num2;
}

void printNumber(String message, num number) {
  print('$message: $number');
}

// void printUserInfo(String name, int age) {
//   print('Name: $name, Age: $age');
// }

void printUserInfo({required String name, required int age}) {
  print('Name: $name, Age: $age');
}

void main() {
  // printUserInfo('John', 18);
  // printUserInfo(18, 'John');

  printUserInfo(name: 'John', age: 18);
  printUserInfo(age: 19, name: 'Doe');

  // num num1 = 10;
  // num num2 = 20;
  //
  // // print('Sum: ${sum(num1, num2)}');
  // printNumber('Sum', sum(num1, num2));
  // // print('Subtract: ${subtract(num1, num2)}');
  // printNumber('Substract', subtract(num1, num2));
}
