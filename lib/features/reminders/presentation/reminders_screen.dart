import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';

class RemindersScreen extends StatelessWidget {
  const RemindersScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage('Sắp tới', [
        AppCard(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          appText('💍 Đám cưới Hùng – Mai', w: FontWeight.w700),
          appText('20/10 · còn 17 ngày', sz: 11, col: AppColors.mute),
          const SizedBox(height: 6),
          appText('Họ từng gửi bạn 500.000đ (tân gia 2025)',
              sz: 12, col: AppColors.green)
        ])),
        AppCard(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          appText('🎂 Sinh nhật Chị Lan', w: FontWeight.w700),
          appText('12/11 · còn 40 ngày', sz: 11, col: AppColors.mute),
          const SizedBox(height: 6),
          appText('Ghi nhớ: thích hoa cúc', sz: 12)
        ])),
        AppCard(
            hi: true,
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              appText('🕯️ Giỗ cụ nội', w: FontWeight.w700),
              appText('Âm 8/8 · còn 52 ngày', sz: 11, col: AppColors.mute)
            ])),
      ], actions: [
        IconButton(
            icon: const Icon(Icons.tune),
            onPressed: () => pushScreen(c, const ReminderSettingsScreen()))
      ]);
}
