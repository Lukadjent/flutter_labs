enum Days { Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday }

mixin DaysMixin {
  late Days _day;

  void setColor(Days day) {
    _day = day;
  }

  Days get color => _day;
}

class SelectDayOfWeek with DaysMixin {
  void printDay() {
    print('Today is $_day');
  }
}

Function sum(int acc) {
  return (val) => val + acc;
}

void functionWithParameters(x, {y, z = 0}) {
  print("$x $y $z");
}

class MyBaseClass {
  int variable1;
  int variable2;

  MyBaseClass.init(this.variable1, this.variable2);
}

class MyClass extends MyBaseClass {
  int num1;
  int num2;
  int _privateField = 10;

  MyClass({required this.num1, required this.num2}) : super.init(0, 0);
  MyClass.init({required this.num1, required this.num2}) : super.init(num1, num2);

  factory MyClass.factory(flag, a, b) {
    return flag ? MyClass(num1: a, num2: b) : MyClass.init(num1: a, num2: b);
  }

  @override
  String toString() => "Variables: num1 = $num1, num2 = $num2, variable1 = $variable1, variable2 = $variable2";

  get getPrivateNum => _privateField;

  set setPrivateNum(int num) =>
      num > 50 ? _privateField = 10 : _privateField = num * 5;

  sugarDemonstration(dynamic num) {
    dynamic x;
    x ??= 10;
    dynamic a = num ?? 10;
    return [a, x];
  }
}

void assertExample(dynamic number) {
  assert(number > 20, "number should be > 20");
  print(number);
}