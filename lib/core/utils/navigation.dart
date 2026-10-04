import 'package:flutter/material.dart';

void pushScreen(BuildContext c, Widget w) =>
    Navigator.push(c, MaterialPageRoute(builder: (_) => w));
