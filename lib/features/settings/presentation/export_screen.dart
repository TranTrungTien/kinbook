import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

class ExportScreen extends StatelessWidget {
  const ExportScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage(
      'Xuất & sao lưu',
      [
        sectionTitle('Xuất dữ liệu'),
        optionTile('📊', 'Excel (.xlsx)', 'Toàn bộ sổ'),
        optionTile('📄', 'PDF · bảng kê sự kiện', 'Gửi qua Zalo'),
        optionTile('🗂️', 'JSON', 'Bản đầy đủ'),
        AppCard(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          appText('Sao lưu gần nhất', w: FontWeight.w700),
          appText('Hôm qua 21:30 · 128 người · 342 khoản',
              sz: 11, col: AppColors.mute)
        ])),
        const ToggleTile('Tự động sao lưu hàng tuần'),
      ],
      bottom: PrimaryButton('Sao lưu ngay', f: () {}));
}
