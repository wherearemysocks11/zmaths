import 'package:hive/hive.dart';

part 'questions.g.dart';

@HiveType(typeId: 0)
class Questions {
  @HiveField(0)
  String qnum;
  @HiveField(1)
  String num1;
  @HiveField(2)
  String num2;
  @HiveField(3)
  String ans;
  Questions(this.qnum, this.num1, this.num2, this.ans);
}
