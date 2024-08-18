import 'package:semu_cal/core/enum/enum.dart';

class DisplayModel {
  String displyOutput = '0';
  List<double> memory = [];
  List<double> gt = [];
  operationEnum operation = operationEnum.none;
  operationEnum kShow = operationEnum.none;
  String touchedButton = '';
  DisplayModel({
    this.displyOutput = '0',
    this.memory = const [],
    this.gt = const [],
    this.operation = operationEnum.none,
    this.kShow = operationEnum.none,
    this.touchedButton = '',
  });

  DisplayModel copyWith({
    String? displyOutput,
    List<double>? memory,
    List<double>? gt,
    operationEnum? operation,
    operationEnum? kShow,
    String? touchedButton,
  }) {
    return DisplayModel(
      displyOutput: displyOutput ?? this.displyOutput,
      memory: memory ?? this.memory,
      gt: gt ?? this.gt,
      operation: operation ?? this.operation,
      kShow: kShow ?? this.kShow,
      touchedButton: touchedButton ?? this.touchedButton,
    );
  }
}
