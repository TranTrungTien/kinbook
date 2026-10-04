import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

Widget appText(String s,
        {double sz = 13,
        FontWeight w = FontWeight.w400,
        Color col = AppColors.ink}) =>
    Text(s, style: TextStyle(fontSize: sz, fontWeight: w, color: col));

Widget sectionTitle(String s) => Padding(
    padding: const EdgeInsets.fromLTRB(0, 6, 0, 8),
    child: appText(s, w: FontWeight.w800));
