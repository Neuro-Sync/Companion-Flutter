// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'dart:developer';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:companion/core/app_cubit/app_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selected = 0;
  // Create components
  List<ComponentWidget> all = [];
  List<List<ComponentWidget>> neighbours = [];
  ComponentWidget component5 = ComponentWidget(name: 'Component 5');
  ComponentWidget component6 = ComponentWidget(name: 'Component 6');
  ComponentWidget component7 = ComponentWidget(name: 'Component 7');
  ComponentWidget component8 = ComponentWidget(name: 'Component 8');
  ComponentWidget component9 = ComponentWidget(name: 'Component 9');
  ComponentWidget component10 = ComponentWidget(name: 'Component 10');
  ComponentWidget component11 = ComponentWidget(name: 'Component 11');
  ComponentWidget component12 = ComponentWidget(name: 'Component 12');
  ComponentWidget component13 = ComponentWidget(name: 'Component 13');
  ComponentWidget component14 = ComponentWidget(name: 'Component 14');
  ComponentWidget component15 = ComponentWidget(name: 'Component 15');
  ComponentWidget component16 = ComponentWidget(name: 'Component 16');
  ComponentWidget component1 = ComponentWidget(name: 'Component 1');
  ComponentWidget component3 = ComponentWidget(
    name: 'Component 3',
  );
  ComponentWidget component2 = ComponentWidget(
    name: 'Component 2',
  );

  ComponentWidget component4 = ComponentWidget(name: 'Component 4');
  // Set references to neighboring components

  // Return the main screen
  @override
  var Cubit;

  @override
  void initState() {
    Cubit = AppCubit.get(context);
    neighbours.addAll([
      [
        component5,
        component2,
      ],
      [component6, component3, component1],
      [
        component7,
        component4,
        component2,
      ],
      [
        component8,
        component5,
        component3,
      ],
      [
        component1,
        component9,
        component6,
        component12,
      ],
      [
        component2,
        component10,
        component7,
        component5,
      ],
      [
        component3,
        component11,
        component8,
        component6,
      ],
      [
        component4,
        component12,
        component7,
        component9,
      ],
      [
        component5,
        component13,
        component10,
        component16,
      ],
      [
        component6,
        component14,
        component11,
        component9,
      ],
      [
        component7,
        component15,
        component12,
        component10,
      ],
      [
        component8,
        component16,
        component13,
        component11,
      ],
      [
        component9,
        component14,
      ],
      [
        component10,
        component15,
        component13,
      ],
      [
        component11,
        component16,
        component14,
      ],
      [
        component12,
        component15,
      ],
    ]);

    all.addAll([
      component1,
      component2,
      component3,
      component4,
      component5,
      component6,
      component7,
      component8,
      component9,
      component10,
      component11,
      component12,
      component13,
      component14,
      component15,
      component16
    ]);
    intializeEachComponent(mainWidgets: all, neighbours: neighbours);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Display your components

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selected = 0;
                            });
                            Cubit.navigation(
                                context,
                                AppCubit.get(context).componentWidget!,
                                AppCubit.get(context).componentWidget!.top!);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    selected == 0 ? Colors.amber : Colors.blue),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                "top",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selected = 1;
                            });
                            Cubit.navigation(
                                context,
                                AppCubit.get(context).componentWidget!,
                                AppCubit.get(context).componentWidget!.bottom!);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    selected == 1 ? Colors.amber : Colors.blue),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                "bottom",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selected = 2;
                            });
                            Cubit.navigation(
                                context,
                                AppCubit.get(context).componentWidget!,
                                AppCubit.get(context).componentWidget!.left!);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    selected == 2 ? Colors.amber : Colors.blue),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                "left",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              selected = 3;
                            });
                            Cubit.navigation(
                                context,
                                AppCubit.get(context).componentWidget!,
                                AppCubit.get(context).componentWidget!.right!);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color:
                                    selected == 3 ? Colors.amber : Colors.blue),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: const Text(
                                "right",
                                style: TextStyle(fontSize: 15.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              onTap: () {
                                print("hhh");
                                AppCubit.get(context)
                                    .change(componentWidget: all[0]);
                              },
                              child: all[0]),
                          InkWell(
                              onTap: () {
                                print("hhh");
                                AppCubit.get(context)
                                    .change(componentWidget: all[1]);
                              },
                              child: all[1]),
                          all[2],
                          all[3],
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        all[4],
                        all[5],
                        all[6],
                        all[7],
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        all[8],
                        all[9],
                        all[10],
                        all[11],
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        all[12],
                        all[13],
                        all[14],
                        all[15],
                      ],
                    ),

                    SizedBox(
                      height: 3.h,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ComponentWidget extends StatelessWidget {
  final String name;
  ComponentWidget? top;
  ComponentWidget? right;
  ComponentWidget? bottom;
  ComponentWidget? left;
  ComponentWidget? selected;

  ComponentWidget({
    super.key,
    required this.name,
    this.top,
    this.selected,
    this.right,
    this.bottom,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.all(5.sp),
          decoration: BoxDecoration(
            color: AppCubit.get(context).componentWidget?.name.toString() ==
                    name.toString()
                ? Colors.green
                : Colors.white,
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Center(
              child: Wrap(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 11.5, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}

void intializeEachComponent({
  required List<ComponentWidget> mainWidgets,
  required List<List<ComponentWidget>> neighbours,
}) {
  //tblr
  for (int index = 0; index < mainWidgets.length; index++) {
    var element = mainWidgets[index];

    switch (index) {
      case 0:
        element.left = neighbours[0][0];
        element.bottom = neighbours[0][1];

      case 1:
        element.left = neighbours[1][1];
        element.bottom = neighbours[1][0];
        element.right = neighbours[1][2];
      case 2:
        element.bottom = neighbours[2][0];
        element.right = neighbours[2][2];
        element.left = neighbours[2][1];
      case 3:
        element.right = neighbours[3][2];
        element.bottom = neighbours[3][0];
        element.left = neighbours[3][1];
      case 4:
        element.left = neighbours[4][2];
        element.bottom = neighbours[4][1];
        element.top = neighbours[4][0];
      case 5:
        element.left = neighbours[5][2];
        element.bottom = neighbours[5][1];
        element.top = neighbours[5][0];
        element.right = neighbours[5][3];
      case 6:
        element.left = neighbours[6][2];
        element.bottom = neighbours[6][1];
        element.top = neighbours[6][0];
        element.right = neighbours[6][3];
      case 7:
        element.left = neighbours[7][2];
        element.bottom = neighbours[7][1];
        element.top = neighbours[7][0];
        element.right = neighbours[7][3];
      case 8:
        element.left = neighbours[8][2];
        element.bottom = neighbours[8][1];
        element.top = neighbours[8][0];
      case 9:
        element.left = neighbours[9][2];
        element.bottom = neighbours[9][1];
        element.top = neighbours[9][0];
        element.right = neighbours[9][3];

      case 10:
        element.left = neighbours[10][2];
        element.bottom = neighbours[10][1];
        element.top = neighbours[10][0];
        element.right = neighbours[10][3];
      case 11:
        element.left = neighbours[11][2];
        element.bottom = neighbours[11][1];
        element.top = neighbours[11][0];
        element.right = neighbours[11][3];
      case 12:
        element.left = neighbours[12][1];
        element.top = neighbours[12][0];
      case 13:
        element.left = neighbours[13][1];
        element.top = neighbours[13][0];
        element.right = neighbours[13][2];
      case 14:
        element.left = neighbours[14][1];
        element.top = neighbours[14][0];
        element.right = neighbours[14][2];
      case 15:
        element.top = neighbours[15][0];
        element.right = neighbours[15][1];

      default:
    }
  }
}
