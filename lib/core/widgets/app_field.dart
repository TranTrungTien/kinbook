import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

Widget appField(String l, String h,
        {String? v, TextInputType? k, int lines = 1}) =>
    Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        initialValue: v,
        keyboardType: k,
        maxLines: lines,
        decoration: InputDecoration(
            labelText: l,
            hintText: h,
            filled: true,
            fillColor: const Color(0xFFFFFAF2),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: AppColors.line))),
      ),
    );
