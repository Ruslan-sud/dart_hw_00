int totalCalls = 0;

void main() {
  greet();
  greet();
  greet();

  introduce("Alex", 25);
  introduce("Aria", 19);
  introduce("John", 30);

  int sum = addNumbers(987, 88);
  print("Sum of 5 and 8 is $sum.");

  double p1 = calculateDiscount(price: 100);
  print("Final price: $p1");

  double p2 = calculateDiscount(price: 100, discount: 10);
  print("Final price: $p2");

  double p3 = calculateDiscount(price: 100, discount: 10, tax: 5);
  print("Final price: $p3");

  print("Total function calls: $totalCalls");
}

void greet() {
  totalCalls++;
  print("Hello! Welcome to Dart programming!");
}

void introduce(String name, int age) {
  totalCalls++;
  print("My name is $name and I am $age years old.");
}

int addNumbers(int a, int b) {
  totalCalls++;
  return a + b;
}

double calculateDiscount({
  required double price,
  double discount = 0,
  double tax = 0,
}) {
  totalCalls++;

  double finalPrice = price - (price * discount / 100) + (price * tax / 100);

  return finalPrice;
}
