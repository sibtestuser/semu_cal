import 'package:flutter/material.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list_2.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list_3.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list_4.dart';

class ClassList {
  static List<Widget> memoryClassList = [
    MemoryClass_1(),
    MemoryClass_2(),
    MemoryClass_3(),
    MemoryClass_4(),
    ClassBackgroundWidget(child: Text('M-')),
  ];
}
