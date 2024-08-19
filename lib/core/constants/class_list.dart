import 'package:flutter/material.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list5.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list_2.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list_3.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list_4.dart';

class ClassList {
  static List<Widget> memoryClassList = [
    const MemoryClass_1(),
    const MemoryClass_2(),
    const MemoryClass_3(),
    const MemoryClass_4(),
    const MemoryClass_5(),
    const ClassBackgroundWidget(child: Text('M-')),
  ];
}
