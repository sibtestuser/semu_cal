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

enum ClassEnum {
  none('none'),
  memory('memory'),
  gt('gt'),
  k('k');

  final String type;
  const ClassEnum(this.type);
}

enum TestEnum {
  none('none'),
  basic('basic'),
  advanced('advanced');

  final String type;
  const TestEnum(this.type);
}

enum ThemeEnum {
  light('light'),
  dark('dark');

  final String type;
  const ThemeEnum(this.type);
}
