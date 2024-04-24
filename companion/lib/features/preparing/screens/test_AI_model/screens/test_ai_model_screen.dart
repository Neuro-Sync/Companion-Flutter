// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print, prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:companion/core/components/app_button.dart';
import 'package:companion/core/components/app_text.dart';
import 'package:companion/core/resources/app_colors.dart';
import 'package:companion/core/utils/utilities.dart';
import 'package:companion/features/preparing/screens/test_AI_model/widgtes/enter_num_item.dart';
import 'package:tflite_flutter/tflite_flutter.dart' as tfl;

import 'package:flutter/material.dart';

class TestSumModelScreen extends StatefulWidget {
  const TestSumModelScreen({super.key});

  @override
  _TestSumModelScreenState createState() => _TestSumModelScreenState();
}

class _TestSumModelScreenState extends State<TestSumModelScreen> {
  List<TextEditingController> numsControllers = [];
  List<int> inputs = [];
  String outputresult = "";
  @override
  void initState() {
    numsControllers = List.generate(
      6,
      (index) => TextEditingController(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TensorFlow Lite in Flutter'),
        backgroundColor: AppColors.primarycolor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Expanded(
                    child: EnterNumItem(
                  controller: numsControllers[index],
                  first: index == 0 ? true : false,
                  last: index != 5 ? false : true,
                )),
              )),
          SizedBox(
            height: 5.h,
          ),
          AppButton(
            color: AppColors.primarycolor,
            title: "Sum using model",
            radius: 5.sp,
            width: 80.w,
            onTap: () {
              numsControllers.forEach((element) {
                if (element.text != null &&
                    element.text.isNotEmpty &&
                    element.text != "") {
                  inputs.add(int.parse(element.text));
                }
              });
              if (inputs.length != 6) {
                print("hhghh");
                print(inputs.length.toString());
                print(inputs.toString());
                AppUtil.appAlert(context,
                    states: ToastStates.WARNING, msg: "Please enter 6 numbers");
              } else {
                print("hhghh54554");

                doSumWithModel([inputs], List.filled(1, 0).reshape([1]));
              }
            },
          ),
           SizedBox(
            height: 2.h,
          ),
          AppButton(
            color: AppColors.primarycolor,
            title: "clear",
            radius: 5.sp,
            width: 80.w,
            onTap: () {
              inputs.clear();
              numsControllers.forEach((element) {
                element.clear();
              });
              outputresult="";
              setState(() {});
            },
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.center,
                child: AppText(
                  "result : $outputresult",
                  color: AppColors.primarycolor,
                  fontSize: 15.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void doSumWithModel(Object input, Object output) async {
    final interpreter =
        await tfl.Interpreter.fromAsset('assets/models/sum.tflite');
    interpreter.run(input, output);
    inputs.clear();
    outputresult = output.toString();
    setState(() {});
    print(output);
  }
}
