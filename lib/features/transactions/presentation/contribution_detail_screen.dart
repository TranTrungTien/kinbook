import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';

class ContributionDetailScreen extends StatelessWidget {
  const ContributionDetailScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage(
      'Chi tiết khoản',
      [
        Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color(0xFF3F9462), Color(0xFF1F4D33)]),
                borderRadius: BorderRadius.circular(20)),
            child: Column(children: [
              appText('Họ gửi bạn', col: Colors.white70),
              appText('1.000.000đ',
                  sz: 30, w: FontWeight.w800, col: Colors.white),
              appText('💍 Cưới', col: Colors.white)
            ])),
        personTile('Nguyễn Văn B', 'Bạn đại học',
            tap: () => pushScreen(c, const ProfileScreen())),
        AppCard(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          appText('Sự kiện', sz: 11, col: AppColors.mute),
          appText('Đám cưới con gái · 12/05/2026')
        ])),
        AppCard(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          appText('Ghi chú', sz: 11, col: AppColors.mute),
          appText('Mâm số 5, kèm quà hiện vật')
        ])),
        AppCard(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          appText('Lần trước bạn mừng họ', sz: 11, col: AppColors.mute),
          appText('500.000đ · Tân gia 2025')
        ])),
      ],
      bottom: PrimaryButton('Xóa khoản này',
          outline: true, f: () => Navigator.pop(c)));
}
