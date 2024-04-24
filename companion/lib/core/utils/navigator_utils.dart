import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void pushScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    CupertinoPageRoute(builder: (context) => screen),
  );
}

void pushReplacementScreen(BuildContext context, Widget screen) {
  Navigator.pushReplacement(
    context,
    CupertinoPageRoute(builder: (context) => screen),
  );
}

void pop(context) {
  Navigator.pop(context);
}
