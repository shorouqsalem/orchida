

import 'package:orchidapos/presntation/resources/color_manager.dart';

import 'package:flutter/material.dart';

class More extends StatefulWidget {
  const More({Key? key});

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More Page"),
        backgroundColor: ColorManager.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0), // Set the desired space between AppBar and body
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double availableWidth = constraints.maxWidth;
            final double cardWidth = availableWidth >= 600 ? 400 : availableWidth * 0.8;
            final double spacing = 10.0; // Set the desired spacing value

            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: spacing),
                    child: SizedBox(
                      width: cardWidth,
                      child: Card(
                        elevation: 5,
                        shadowColor:  ColorManager.primary,
                        child: ListTile(
                          leading: Icon(
                            Icons.check,
                            color:  ColorManager.primary,
                          ),
                          title: Text(
                            "Term and Condition",
                            style: TextStyle(
                              color: ColorManager.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            // Handle button tap
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: spacing),
                    child: SizedBox(
                      width: cardWidth,
                      child: Card(
                        elevation: 5,
                        shadowColor: ColorManager.primary,
                        child: ListTile(
                          leading: Icon(
                            Icons.dock,
                            color: ColorManager.primary,
                          ),
                          title: Text(
                            "Privacy and Policy",
                            style: TextStyle(
                              color: ColorManager.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            // Handle button tap
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: spacing),
                    child: SizedBox(
                      width: cardWidth,
                      child: Card(
                        elevation: 5,
                        shadowColor: ColorManager.primary,
                        child: ListTile(
                          leading: Icon(
                            Icons.lock,
                            color: ColorManager.primary,
                          ),
                          title: Text(
                            "Change Password",
                            style: TextStyle(
                              color: ColorManager.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            // Handle button tap
                          },
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: spacing),
                    child: SizedBox(
                      width: cardWidth,
                      child: Card(
                        elevation: 5,
                        shadowColor: ColorManager.primary,
                        child: ListTile(
                          leading: Icon(
                            Icons.info,
                            color: ColorManager.primary,
                          ),
                          title: Text(
                            "About Us",
                            style: TextStyle(
                              color: ColorManager.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap: () {
                            // Handle button tap
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: cardWidth,
                    child: Card(
                      elevation: 5,
                      shadowColor: ColorManager.primary,
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          color: ColorManager.primary,
                        ),
                        title: Text(
                          "Logout",
                          style: TextStyle(
                            color: ColorManager.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          // Handle button tap
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
