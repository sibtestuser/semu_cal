enum operationEnum {
  none('none'),
  plus('+'),
  minus('-'),
  multiply('x'),
  divide('÷'),
  result('=');

  final String type;
  const operationEnum(this.type);
}

enum functionEnum {
  none('none'),
  mplus('M+'),
  mminus('M-'),
  gt('GT'),
  mr('MR'),
  k('K'),
  ac('AC'),
  ;

  final String type;
  const functionEnum(this.type);
}
