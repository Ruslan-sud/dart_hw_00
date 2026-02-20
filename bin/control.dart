import 'dart:io';

void main() {
  int warm = 0;
  int cool = 0;
  int cold = 0;

  for (int day = 1; day <= 7; day++) {
    print("Enter temperature for the day:");

    int t = int.parse(stdin.readLineSync()!);

    if (t > 20) {
      print("It's warm today!");
      warm++;
    } else if (t >= 10 && t <= 20) {
      print("It's cool today.");
      cool++;
    } else {
      print("It's cold today!");
      cold++;
    }
  }

  print("Warm days: $warm");
  print("Cool days: $cool");
  print("Cold days: $cold");
  print("Weekly temperature analysis completed.");
}

