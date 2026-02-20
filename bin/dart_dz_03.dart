void main() {
  for (int i = 1; i <= 30; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('FizzBuzz');
    } else if (i % 3 == 0) {
      print('Fizz');
    } else if (i % 5 == 0) {
      print('Buzz');
    } else {
      print(i);
    }
  }

  List<int> numbers = [-3, 2, 0, 7, -5, -10, -11];

  int count = 0;
  int sum = 0;

  for (var n in numbers) {
    if (n > 0) {
      count++;
      sum += n;
    }
  }
  print("----------------------");
  if (count == 0) {
    print('No positive numbers.');
  } else {
    double average = sum / count;

    print('Positive numbers count: $count');
    print('Average of positive numbers: $average');
  }
  print("----------------------");
  Map<String, int> fruits = {'Apple': 5, 'Banana': 2, 'Mango': 7, 'Orange': 0};

  fruits.forEach((key, value) {
    if (value > 0) {
      print('Available: $key ($value pcs)');
    }
  });
}
