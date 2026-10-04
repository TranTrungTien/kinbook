import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

class PersonNotesScreen extends StatelessWidget {
  const PersonNotesScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage(
      'Ghi nhớ · Nguyễn Văn B',
      [
        AppCard(appText('Con gái tên Bông, sinh tháng 8')),
        AppCard(appText('Thích cà phê, không uống bia')),
        AppCard(appText('Từng giúp mình khi đổi việc 2022')),
        const SizedBox(height: 8),
        appField('Thêm ghi nhớ', 'Chuyển nhà năm 2025...', lines: 3),
        const ChipGroup(['👶 Con cái', '☕ Sở thích', '🤝 Đã giúp'], on: -1),
      ],
      bottom: PrimaryButton('Lưu ghi nhớ', f: () => Navigator.pop(c)));
}
