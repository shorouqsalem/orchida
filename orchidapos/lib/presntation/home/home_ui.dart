import 'package:flutter/material.dart';
import 'package:orchidapos/presntation/home/navigationBar/Home.dart';
import 'package:orchidapos/presntation/home/navigationBar/more.dart';
import 'package:orchidapos/presntation/home/navigationBar/operations_content/operations.dart';
import 'package:orchidapos/presntation/home/navigationBar/setting.dart';
import 'package:orchidapos/presntation/resources/color_manager.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List<Widget> screens = [
    Setting(),
    Operations(),
    More(),
  ];
  Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: PageStorageBucket(),
        child: currentScreen,
      ),



      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomeScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: currentTab == 0
                              ? ColorManager.primary
                              : ColorManager.grey,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: currentTab == 0
                                ? ColorManager.primary
                                : ColorManager.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Setting();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: currentTab == 1
                              ? ColorManager.primary
                              : ColorManager.grey,
                        ),
                        Text(
                          'Setting',
                          style: TextStyle(
                            color: currentTab == 1
                                ? ColorManager.primary
                                : ColorManager.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Operations();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.check_circle,
                          color: currentTab == 2
                              ? ColorManager.primary
                              : ColorManager.grey,
                        ),
                        Text(
                          'process',
                          style: TextStyle(
                            color: currentTab == 2
                                ? ColorManager.primary
                                : ColorManager.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = More();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.more_horiz,
                          color: currentTab == 3
                              ? ColorManager.primary
                              : ColorManager.grey,
                        ),
                        Text(
                          'More',
                          style: TextStyle(
                            color: currentTab == 3
                                ? ColorManager.primary
                                : ColorManager.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
