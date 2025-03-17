void main() {
  List<int> list = [10, 20, 30, 40, 50];

  // print('Using for loop');
  // for (int i = 0; i < list.length; i++) {
  //   print("Element is: ${list[i]}");
  // }

  print('Using for-in');
  for (int element in list) {
    print("Element is: $element");
  }
}
