import 'package:flutter/material.dart';

class X3YearWidgetWithPV extends StatefulWidget {
  const X3YearWidgetWithPV(
      {super.key,
      this.x0 = '',
      this.x1 = '',
      this.x2 = '',
      this.x3 = '',
      this.pv0 = '',
      this.pv1 = '',
      this.pv2 = '',
      this.pv3 = ''});
  final String x0;
  final String x1;
  final String x2;
  final String x3;
  final String pv0;
  final String pv1;
  final String pv2;
  final String pv3;

  @override
  State<X3YearWidgetWithPV> createState() => _X3YearWidgetWithPVState();
}

class _X3YearWidgetWithPVState extends State<X3YearWidgetWithPV> {
  TextStyle textStyle = const TextStyle(fontSize: 14);
  TextStyle textStyle2 = const TextStyle(fontSize: 14, color: Colors.red);
  TextStyle textStyle3 = const TextStyle(fontSize: 14, color: Colors.blue);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'x0',
                      style: textStyle,
                    ),
                    Text(
                      'x1',
                      style: textStyle,
                    )
                  ],
                )),
              ),
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'x2',
                      style: textStyle,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'x3',
                      style: textStyle,
                    ),
                  ),
                ),
              ),
            ],
          ), //x0 x1, x2 년도 숫자 표시
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                    child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(width: 2.0, color: Colors.black),
                            top: BorderSide(width: 2.0, color: Colors.black),
                          ),
                        ),
                        height: 5,
                      ),
                    ),
                    Expanded(
                      child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(width: 2.0, color: Colors.black),
                              right:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                          ),
                          height: 5),
                    )
                  ],
                )),
              ),
              Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 2.0, color: Colors.black),
                          right: BorderSide(width: 2.0, color: Colors.black),
                        ),
                      ),
                      height: 5)),
              Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(width: 2.0, color: Colors.black),
                          right: BorderSide(width: 2.0, color: Colors.black),
                        ),
                      ),
                      height: 5)),
            ],
          ), // 여기는 보더라인 표시
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.x0,
                      style: textStyle2,
                    ),
                    Text(
                      widget.x1,
                      style: textStyle2,
                    )
                  ],
                )),
              ),
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.x2,
                      style: textStyle2,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.x3,
                      style: textStyle2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.pv0,
                      style: textStyle3,
                    ),
                    Text(
                      widget.pv1,
                      style: textStyle3,
                    )
                  ],
                )),
              ),
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.pv2,
                      style: textStyle3,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.pv3,
                      style: textStyle3,
                    ),
                  ),
                ),
              ),
            ],
          ),
          //x0 x1,
        ],
      ),
    );
  }
}
