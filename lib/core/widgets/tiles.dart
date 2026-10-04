import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

/// Hàng người: a>0 họ gửi bạn (xanh), a<0 bạn đi đám (đỏ).
Widget personTile(String n, String s,
        {int a = 0, bool hi = false, VoidCallback? tap}) =>
    AppCard(
      Row(children: [
        CircleAvatar(
            backgroundColor:
                hi ? const Color(0xFFCFC7BF) : const Color(0xFFF2B999),
            child: Text(n.trim()[0],
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    color: hi ? AppColors.grey : const Color(0xFF7D1712)))),
        const SizedBox(width: 10),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              appText(n, w: FontWeight.w700),
              appText(s, sz: 11, col: AppColors.mute)
            ])),
        if (a != 0)
          appText((a > 0 ? '+' : '') + formatVnd(a),
              w: FontWeight.w800, col: a > 0 ? AppColors.green : AppColors.red),
      ]),
      hi: hi,
      onTap: tap,
    );

Widget optionTile(String ic, String t, String s, [VoidCallback? f]) => AppCard(
      Row(children: [
        Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
                color: const Color(0xFFFBE7C8),
                borderRadius: BorderRadius.circular(11)),
            alignment: Alignment.center,
            child: Text(ic, style: const TextStyle(fontSize: 18))),
        const SizedBox(width: 10),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              appText(t, w: FontWeight.w700),
              appText(s, sz: 11, col: AppColors.mute)
            ])),
        const Icon(Icons.chevron_right, color: AppColors.mute),
      ]),
      onTap: f,
    );
