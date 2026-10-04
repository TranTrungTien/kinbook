import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';

class EventDetailScreen extends StatelessWidget {
  final bool hieu;
  const EventDetailScreen({super.key, this.hieu = false});
  @override
  Widget build(BuildContext c) => AppPage(
      'Sự kiện',
      [
        eventBanner(hieu ? 'Giỗ ông nội' : 'Đám cưới con gái',
            hieu ? 'Âm lịch 8/8' : '12/05/2026 · Âm 16/4',
            p: .75,
            note: 'Đã nhận 15.000.000đ · 36/48 ${hieu ? 'người' : 'khách'}',
            hi: hieu),
        appField('Tìm khách', 'Gõ tên...'),
        personTile('Nguyễn Văn B', 'Bạn đại học · mâm 5',
            a: 1000000,
            hi: hieu,
            tap: () => pushScreen(c, const ProfileScreen())),
        personTile('Chị Lan', 'Đồng nghiệp · mâm 3',
            a: 500000,
            hi: hieu,
            tap: () => pushScreen(c, const ProfileScreen())),
        personTile('Chú Ba', 'Họ hàng · quà hiện vật', hi: hieu),
      ],
      bottom: PrimaryButton(hieu ? '＋ Ghi phúng viếng' : '＋ Ghi khách mừng',
          f: () => pushScreen(c, const QuickAddScreen())));
}
