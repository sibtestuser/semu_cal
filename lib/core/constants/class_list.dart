import 'package:flutter/material.dart';
import 'package:semu_cal/%08widgets/class_background_widget.dart';
import 'package:semu_cal/feature/class/gt_lass_list/gt_class_list_1.dart';
import 'package:semu_cal/feature/class/gt_lass_list/gt_class_list_2.dart';
import 'package:semu_cal/feature/class/gt_lass_list/gt_class_list_3.dart';
import 'package:semu_cal/feature/class/gt_lass_list/gt_class_list_4.dart';
import 'package:semu_cal/feature/class/gt_lass_list/gt_class_list_5.dart';
import 'package:semu_cal/feature/class/gt_lass_list/gt_class_list_7.dart';
import 'package:semu_cal/feature/class/gt_lass_list/gt_class_list_8.dart';
import 'package:semu_cal/feature/class/gt_lass_list/gt_class_list_6.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list5.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list6.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list7.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list_2.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list_3.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list_4.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list_8.dart';
import 'package:semu_cal/feature/class/memory_class_list/memory_class_list_9.dart';

class ClassList {
  static List<Widget> memoryClassList = [
    const MemoryClass_1(),
    const MemoryClass_2(),
    const MemoryClass_3(),
    const MemoryClass_4(),
    const MemoryClass_5(),
    const MemoryClass_6(),
    const MemoryClass_7(),
    const MemoryClass_8(),
    const MemoryClass_9(),
  ];

  static List<Widget> gtClassList = [
    const GTClass_1(),
    const GTClass_2(),
    const GTClass_3(),
    const GTClass_4(),
    const GTClass_5(),
    const GTClass_6(),
    const GTClass_7(),
    const GTClass_8(),
    const ClassBackgroundWidget(child: Text('gt')),
  ];
}
