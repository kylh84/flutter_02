import 'dart:math';

void main() {
  // List<int> list = [10, 20, 30, 40, 50];

  var random = Random();
  // random.nextInt(100) + 1; // 1 - 100
  List<int> list = List.generate(10, (_) => random.nextInt(100) + 1);

  // print('Using for loop');
  // for (int i = 0; i < list.length; i++) {
  //   print("Element is: ${list[i]}");
  // }

  print('Using for-in');
  for (int element in list) {
    print("Element is: $element");
  }

  int sum = list.reduce((value, element) => value + element);
  num average = sum / list.length;

  print("Done");
}
