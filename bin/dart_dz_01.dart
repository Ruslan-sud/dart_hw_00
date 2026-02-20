void main() {
  String myName = "Ruslan";
  int myAge = 23;
  String myCity = "Bishkek";
  String myProfession = "Mobile app developer";
  String myHobby = "Mobile games";
  print("Hello! My name is $myName");
  print("I am $myAge years old and I live in $myCity");
  print("My profession is $myProfession");
  print("In my free time, I enjoy $myHobby");

  double mySalary = 1000;
  double yearlyIncome = mySalary * 12;
  double yearlyIncomeWithBonus = yearlyIncome * 1.1;

  print("My Salari ${mySalary}");
  print("My yearly income: ${yearlyIncome} USD.");
  print("My yearly income with 10% bonus: ${yearlyIncomeWithBonus} USD.");

  String sampleTexst = "  Knowledge is power, but practice makes perfect.  ";
  print(sampleTexst.trim());
  print(sampleTexst.toUpperCase());
  print(sampleTexst.replaceAll("practice", "experience"));
  print(sampleTexst.contains("power"));

  int myApples = 9;
  int myPeople = 4;
  int eachGets = myApples ~/ myPeople;
  int myPemainder = myApples % myPeople;

  print("Each person gets $eachGets apples.");
  print("Apple left: $myPemainder");

  int currentYear = 2026; //Переменная с моим возростом есть по этому не создал
  print("I was born in ${currentYear - myAge}");

  var myCity2 = "Bishkek"; //var можно применять для всех типов данных
  final myCountry ="Kyrgyzstan"; //final нельзя изменить содержимоне этой переменной
  myCity2 = "Osh";
  //myCountry = "Russia";
  print(myCity2);
  print(myCountry);
}
