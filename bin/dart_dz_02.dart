import 'dart:io';

void main() {
  print("Введите возраст: ");
  var age = int.parse(stdin.readLineSync()!);
  print("Введите температуру воздуха: ");
  var temp = int.parse(stdin.readLineSync()!);

  if (age >= 20 && age <= 45 && temp >= -20 && temp <= 30) {
    print("You can go for a walk.");
  } else if (age < 20 && temp >= 0 && temp <= 28)
    ;
  else if (age > 45 && temp >= -10 && temp <= 25)
    ;
  else
    (print("Stay home."));

  print("Введите день недели: ");
  var day = (stdin.readLineSync()!).toLowerCase();
  switch (day) {
    case "monday":
      print("It's the start of the week!");
      break;

    case "tuesday":
    case "wednesday":
    case "thursday":
      print("Keep going, almost weekend!");
      break;

    case "friday":
      print("Weekend is coming!");
      break;

    case "saturday":
    case "sunday":
      print("Enjoy your weekend!");
      break;

    default:
      print("Invalid day.");
  }
  print("Введите пароль: ");
  var password = (stdin.readLineSync()!);
  if (password.isEmpty) {
print("Password cannot be empty.");
  }
  else if(password.length < 6){;
  print("Password too short.");}
  else if (password == "dart123"){
print("Access granted.");
  }
  else (
    print("Wrong password.")
  );
}
