import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/core/theme/cal_theme.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calType = ref.watch(cal_Theme_Provider).type;
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 50, // 원하는 높이로 설정
                  color: Colors.blueGrey,
                  alignment: Alignment.center,
                  child: const Text(
                    '계산기 테마',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                RadioListTile<String>(
                  value: 'white',
                  groupValue: calType,
                  title: const Text('화이트'),
                  secondary: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                RadioListTile<String>(
                  value: 'pink',
                  groupValue: calType,
                  title: const Text('핑크'),
                  secondary: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                RadioListTile<String>(
                  value: 'grey',
                  groupValue: calType,
                  title: const Text('그레이'),
                  secondary: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 50, // 원하는 높이로 설정
                  color: Colors.blueGrey,
                  alignment: Alignment.center,
                  child: const Text(
                    '칠판 테마',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                RadioListTile<String>(
                  value: 'white',
                  groupValue: calType,
                  title: const Text('화이트보드'),
                  secondary: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                RadioListTile<String>(
                  value: 'green',
                  groupValue: calType,
                  title: const Text('칠판'),
                  secondary: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.green[600],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                RadioListTile<String>(
                  value: 'grey',
                  groupValue: calType,
                  title: const Text('그레이'),
                  secondary: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Container(
                  height: 50, // 원하는 높이로 설정
                  color: Colors.blueGrey,
                  alignment: Alignment.center,
                  child: const Text(
                    '글씨 테마',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                RadioListTile<String>(
                  value: 'white',
                  groupValue: calType,
                  title: const Text('화이트'),
                  secondary: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                RadioListTile<String>(
                  value: 'yellow',
                  groupValue: calType,
                  title: const Text('옐로우'),
                  secondary: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.yellow[600],
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                RadioListTile<String>(
                  value: 'black',
                  groupValue: calType,
                  title: const Text('블랙'),
                  secondary: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
