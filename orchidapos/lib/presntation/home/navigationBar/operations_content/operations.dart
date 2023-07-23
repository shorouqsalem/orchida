

import 'package:flutter/material.dart';
import 'package:orchidapos/presntation/home/navigationBar/operations_content/inventory.dart';
import 'package:orchidapos/presntation/home/navigationBar/operations_content/print_shelfLable.dart';
import 'package:orchidapos/presntation/resources/assets_manager.dart';
import 'package:orchidapos/presntation/resources/color_manager.dart';

class Operations extends StatefulWidget {
  const Operations({Key? key}) : super(key: key);

  @override
  State<Operations> createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Process"),
        backgroundColor: ColorManager.primary,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 24),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    "Choose the process",
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorManager.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              SizedBox(
                height: 200, // Adjust the height as needed
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder:
                                (context, animation, anotherAnimation) {
                              return InventoryScreen();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ));
                        },
                        child: Container(
                          height: 180,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 248, 248, 248),
                            border: Border.all(color: ColorManager.white),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 241, 241, 241),
                                blurRadius: 6.0,
                                spreadRadius: 3.0,
                                offset: Offset(3.0, 3.0),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  ImageAssets.inventory,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(
                                height: 9,
                              ),
                              const Text(
                                "inventory",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 16, 16, 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(PageRouteBuilder(
                            pageBuilder:
                                (context, animation, anotherAnimation) {
                              return PrintShelfLabelScreen();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                          ));
                        },
                        child: Container(
                          height: 180,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: ColorManager.primary,
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 241, 241, 241),
                                blurRadius: 6.0,
                                spreadRadius: 3.0,
                                offset: Offset(3.0, 3.0),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset(
                                  ImageAssets.printImage,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              const Text(
                                "print Label",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 30, 29, 29),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
