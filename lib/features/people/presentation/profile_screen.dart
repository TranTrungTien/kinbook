import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage(
      'Hồ Sơ Người Quen',
      [
        Center(
            child: Column(children: [
          const CircleAvatar(
              radius: 32,
              backgroundColor: Color(0xFFF2B999),
              child: Text('B',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF7D1712)))),
          const SizedBox(height: 8),
          appText('Nguyễn Văn B', sz: 18, w: FontWeight.w800),
          appText('(Gia Đình)', sz: 12, col: AppColors.mute)
        ])),
        const SizedBox(height: 14),
        summaryCards('Mình Đã Nhận (8 đi mình)', '2.500.000đ',
            'Mình Đã Đi (Đi B)', '1.500.000đ'),
        Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: const Color(0xFFF6E6CF),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.line),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              appText('Dư/Thiếu (Ân Tình):', w: FontWeight.w700),
              appText('Dư 1.000.000đ', w: FontWeight.w800, col: AppColors.green),
            ],
          ),
        ),
        sectionTitle('Historical log'),
        personTile('Cưới mình', 'B đi 1tr',
            a: 1000000,
            tap: () => pushScreen(c, const ContributionDetailScreen())),
        personTile('Cưới B', 'Mình đi 1tr',
            a: -1000000,
            tap: () => pushScreen(c, const ContributionDetailScreen())),
        personTile('Tân gia B', 'Mình đi 500k',
            a: -500000,
            tap: () => pushScreen(c, const ContributionDetailScreen())),
        personTile('Giỗ cụ B', 'B đi 1tr5',
            a: 1500000,
            hi: true,
            tap: () => pushScreen(c, const ContributionDetailScreen())),
        const SizedBox(height: 10),
        AppCard(
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              appText('Ghi nhớ', sz: 11, col: AppColors.mute),
              appText('Con gái tên Bông, thích cà phê')
            ]),
            onTap: () => pushScreen(c, const PersonNotesScreen())),
      ],
      bottom: PrimaryButton('＋ Lưu Thần Tốc',
          f: () => pushScreen(c, const QuickAddScreen())));
}
