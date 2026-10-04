import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key});
  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  String pin = '';
  void tap(String k) {
    if (k == '👆') {
      return;
    }
    setState(() => k == '⌫'
        ? (pin = pin.isEmpty ? '' : pin.substring(0, pin.length - 1))
        : (pin.length < 4 ? pin += k : null));
    if (pin.length == 4) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const ImportHintScreen()));
    }
  }

  @override
  Widget build(BuildContext c) => AppPage('Bảo mật', [
        const SizedBox(height: 10),
        Center(
            child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: const Color(0xFFFBE7C8),
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: const Text('🔒', style: TextStyle(fontSize: 26)))),
        const SizedBox(height: 8),
        Center(
            child: appText('Đặt mã PIN 4 số',
                sz: 20, w: FontWeight.w800, col: AppColors.red)),
        Center(child: appText('Chỉ bạn mới mở được sổ', col: AppColors.mute)),
        const SizedBox(height: 12),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          for (var k = 0; k < 4; k++)
            Container(
                margin: const EdgeInsets.all(8),
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: k < pin.length ? AppColors.red : null,
                    border: Border.all(color: AppColors.red, width: 2))),
        ]),
        const SizedBox(height: 8),
        GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1.9,
          children: [
            for (final k in [
              '1',
              '2',
              '3',
              '4',
              '5',
              '6',
              '7',
              '8',
              '9',
              '👆',
              '0',
              '⌫'
            ])
              AppCard(
                  Center(
                      child: k == '👆'
                          ? const Text('👆', style: TextStyle(fontSize: 20))
                          : appText(k, sz: 20, w: FontWeight.w700)),
                  onTap: () => tap(k))
          ],
        ),
      ]);
}
