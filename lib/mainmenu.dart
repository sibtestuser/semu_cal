import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:semu_cal/%08widgets/drawer.dart';
import 'package:semu_cal/core/enum/enum.dart';
import 'package:semu_cal/core/theme/board_theme.dart';
import 'package:semu_cal/core/theme/cal_theme.dart';
import 'package:semu_cal/core/theme/pen_theme.dart';
import 'package:semu_cal/core/theme/texttheme.dart';
import 'package:semu_cal/feature/calculator/controller/calculate_controller.dart';
import 'package:semu_cal/feature/calculator/controller/display_controller.dart';
import 'package:semu_cal/feature/class/controller/class_controller.dart';
import 'package:semu_cal/feature/class/screen/class_screen.dart';
import 'package:semu_cal/feature/test/screen/test_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainMenuScreen extends ConsumerStatefulWidget {
  const MainMenuScreen({super.key});

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends ConsumerState<MainMenuScreen> {
  bool memoryMenuTab = false;
  bool gtMenuTab = false;
  bool kMenuTab = false;
  @override
  void initState() {
    super.initState();
    _initializePreferences();
    // // 상태 변경을 initState에서 수행
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   ref.read(cal_Theme_Provider.notifier).changeTheme('white');
    // });
  }

  Future<void> _initializePreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // 초기 설정 로드
    final calTheme = prefs.getString('calTheme') ?? 'white';
    final penTheme = prefs.getString('penTheme') ?? 'black';
    final boardTTheme = prefs.getString('boardTTheme') ?? 'white';

    // 초기 상태 설정
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(cal_Theme_Provider.notifier).changeTheme(calTheme);
      ref.read(pen_Theme_Provider.notifier).changeTheme(penTheme);
      ref.read(board_Theme_Provider.notifier).changeTheme(boardTTheme);
    });
  }

  void memoryMenuTabChange() {
    setState(() {
      memoryMenuTab = !memoryMenuTab;
      gtMenuTab = false;
      kMenuTab = false;
    });
  }

  void gtMenuTabChange() {
    setState(() {
      gtMenuTab = !gtMenuTab;
      memoryMenuTab = false;
      kMenuTab = false;
    });
  }

  void kMenuTabChange() {
    setState(() {
      kMenuTab = !kMenuTab;
      memoryMenuTab = false;
      gtMenuTab = false;
    });
  }

  void allReset() {
    ref.read(displayControllerProvider.notifier).makeReset();
    ref.read(calculatorControllerProvider.notifier).makeReset();
  }

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
        final bool shouldPop = await _showExitConfirmationDialog(context);
        if (context.mounted && shouldPop) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          centerTitle: true,
          title: const Text(
            'sib  세무 회계 계산기 연습앱',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.white, // 아이콘 색상 변경
          ),
        ),
        drawer: const Drawer(
          elevation: 10,
          child: MyDrawer(),
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                const MainPageIntroduction(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0), // 둥근 모서리
                        ),
                        elevation: 10,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: memoryMenuTab ? 100.0 : 80.0,
                          child: ListTile(
                            leading: const Icon(
                              CupertinoIcons
                                  .doc_text, // Changed to Cupertino icon
                              size: 40,
                            ),
                            title: Text(
                              'MEMROY ',
                              style:
                                  CustomTextTheme.getMainMenuTextBlack(context),
                            ),
                            subtitle: Text(
                              'M+ 와 M- 알아보기',
                              style: CustomTextTheme
                                  .getsubMainMenuDescriptionTextBlack(context),
                            ),
                            tileColor: Colors.blue[100],
                            onTap: () {
                              memoryMenuTabChange();
                            },
                          ),
                        ),
                      ),
                      if (memoryMenuTab)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 5),
                          child: FadeIn(
                            animate: memoryMenuTab,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0), // 둥근 모서리
                              ),
                              elevation: 10,
                              child: ListTile(
                                title: const Text(' M+  M- 알아보기'),
                                leading: const Icon(
                                  CupertinoIcons
                                      .pencil, // Changed to Cupertino icon
                                  size: 30,
                                ),
                                tileColor: Colors.white,
                                onTap: () {
                                  allReset();
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setClassType(ClassEnum.memory);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const ClassScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      if (memoryMenuTab)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 5),
                          child: FadeInRight(
                            animate: memoryMenuTab,
                            duration: const Duration(milliseconds: 300),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0), // 둥근 모서리
                              ),
                              elevation: 10,
                              child: ListTile(
                                title: const Text('M+  M- 기본 문제 풀기'),
                                tileColor: Colors.white,
                                leading: const Icon(
                                  CupertinoIcons
                                      .pencil_circle, // Changed to Cupertino icon
                                  size: 30,
                                ),
                                onTap: () {
                                  allReset();
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setTestType(TestEnum.basic);
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setClassType(ClassEnum.memory);

                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const TestScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      if (memoryMenuTab)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 5),
                          child: FadeInRight(
                            animate: memoryMenuTab,
                            duration: const Duration(milliseconds: 300),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0), // 둥근 모서리
                              ),
                              elevation: 10,
                              child: ListTile(
                                title: const Text('M+  M- 응용 문제 풀기'),
                                tileColor: Colors.white,
                                leading: const Icon(
                                  CupertinoIcons
                                      .pencil_circle_fill, // Changed to Cupertino icon
                                  size: 30,
                                ),
                                onTap: () {
                                  allReset();
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setClassType(ClassEnum.memory);
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setTestType(TestEnum.advanced);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const ClassScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0), // 둥근 모서리
                        ),
                        elevation: 10,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: gtMenuTab ? 100.0 : 80.0,
                          child: ListTile(
                            leading: const Icon(
                              CupertinoIcons
                                  .equal_circle, // Changed to Cupertino icon
                              size: 40,
                            ),
                            title: Text(
                              'GT ',
                              style:
                                  CustomTextTheme.getMainMenuTextBlack(context),
                            ),
                            subtitle: Text(
                              '= 을 누르면 계산기는 저장한다',
                              style: CustomTextTheme
                                  .getsubMainMenuDescriptionTextBlack(context),
                            ),
                            tileColor: Colors.green[100],
                            onTap: () {
                              gtMenuTabChange();
                            },
                          ),
                        ),
                      ),
                      if (gtMenuTab)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 5),
                          child: FadeIn(
                            animate: gtMenuTab,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0), // 둥근 모서리
                              ),
                              elevation: 10,
                              child: ListTile(
                                title: const Text('GT 알아보기'),
                                leading: const Icon(
                                  CupertinoIcons
                                      .pencil, // Changed to Cupertino icon
                                  size: 30,
                                ),
                                tileColor: Colors.white,
                                onTap: () {
                                  allReset();
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setClassType(ClassEnum.gt);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const ClassScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      if (gtMenuTab)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 5),
                          child: FadeInRight(
                            animate: gtMenuTab,
                            duration: const Duration(milliseconds: 300),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0), // 둥근 모서리
                              ),
                              elevation: 10,
                              child: ListTile(
                                title: const Text('GT 기본 문제 풀기'),
                                tileColor: Colors.white,
                                leading: const Icon(
                                  CupertinoIcons
                                      .pencil_circle, // Changed to Cupertino icon
                                  size: 30,
                                ),
                                onTap: () {
                                  allReset();
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setClassType(ClassEnum.none);
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setTestType(TestEnum.basic);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const ClassScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      if (gtMenuTab)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 5),
                          child: FadeInRight(
                            animate: gtMenuTab,
                            duration: const Duration(milliseconds: 300),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0), // 둥근 모서리
                              ),
                              elevation: 10,
                              child: ListTile(
                                title: const Text('GT 응용 문제 풀기'),
                                tileColor: Colors.white,
                                leading: const Icon(
                                  CupertinoIcons
                                      .pencil_circle_fill, // Changed to Cupertino icon
                                  size: 30,
                                ),
                                onTap: () {
                                  allReset();
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setClassType(ClassEnum.none);
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setTestType(TestEnum.advanced);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const ClassScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 30),
                  child: Column(
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0), // 둥근 모서리
                        ),
                        elevation: 10,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          height: kMenuTab ? 100.0 : 80.0,
                          child: ListTile(
                            leading: const Icon(
                              CupertinoIcons
                                  .refresh_circled, // Changed to Cupertino icon
                              size: 40,
                            ),
                            title: Text(
                              'K ',
                              style:
                                  CustomTextTheme.getMainMenuTextBlack(context),
                            ),
                            subtitle: Text(
                              '반복적인 연산을 쉽고 빠르게',
                              style: CustomTextTheme
                                  .getsubMainMenuDescriptionTextBlack(context),
                            ),
                            tileColor: Colors.yellow[100],
                            onTap: () {
                              kMenuTabChange();
                            },
                          ),
                        ),
                      ),
                      if (kMenuTab)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 5),
                          child: FadeIn(
                            animate: kMenuTab,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0), // 둥근 모서리
                              ),
                              elevation: 10,
                              child: ListTile(
                                title: const Text('K 알아보기'),
                                leading: const Icon(
                                  CupertinoIcons
                                      .pencil, // Changed to Cupertino icon
                                  size: 30,
                                ),
                                tileColor: Colors.white,
                                onTap: () {
                                  allReset();
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setClassType(ClassEnum.k);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const ClassScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      if (kMenuTab)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 5),
                          child: FadeInRight(
                            animate: kMenuTab,
                            duration: const Duration(milliseconds: 300),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0), // 둥근 모서리
                              ),
                              elevation: 10,
                              child: ListTile(
                                title: const Text('K 기본 문제 풀기'),
                                tileColor: Colors.white,
                                leading: const Icon(
                                  CupertinoIcons
                                      .pencil_circle, // Changed to Cupertino icon
                                  size: 30,
                                ),
                                onTap: () {
                                  allReset();
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setClassType(ClassEnum.none);
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setTestType(TestEnum.basic);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const ClassScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      if (kMenuTab)
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 5),
                          child: FadeInRight(
                            animate: kMenuTab,
                            duration: const Duration(milliseconds: 300),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20.0), // 둥근 모서리
                              ),
                              elevation: 10,
                              child: ListTile(
                                title: const Text('K 응용 문제 풀기'),
                                tileColor: Colors.white,
                                leading: const Icon(
                                  CupertinoIcons
                                      .pencil_circle_fill, // Changed to Cupertino icon
                                  size: 30,
                                ),
                                onTap: () {
                                  allReset();
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setClassType(ClassEnum.none);
                                  ref
                                      .read(classModelProvider.notifier)
                                      .setTestType(TestEnum.advanced);
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => const ClassScreen(),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                ListTile(
                  title: const Text('임시 계산기 연습'),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TestScreen()),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    bool? shouldExit = false;
    shouldExit = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: const Text(
          '앱 종료',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          '학습을 마칠까요?',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              '아니오',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              ' 네 ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
    return shouldExit ?? false;
  }
}

class MainPageIntroduction extends StatelessWidget {
  const MainPageIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '계산기와 익숙해지는 시간',
            style: CustomTextTheme.getIntroText(context),
          ),
          const SizedBox(height: 8),
          Column(
            children: [
              Text(
                '이 앱은 세무 회계 계산기를 연습할 수 있는 앱입니다.',
                style: CustomTextTheme.getSubIntroText(context),
              ),
              Text(
                '다양한 기능을 통해 계산기 사용에 익숙해지세요.',
                style: CustomTextTheme.getSubIntroText(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
