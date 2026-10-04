import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage('Tìm kiếm', [
        appField('Tìm', 'Tên, dịp, số tiền, năm', v: '500000'),
        const ChipGroup(['Tất cả', 'Người', 'Sự kiện', 'Khoản']),
        sectionTitle('Khoản 500.000đ · 6 kết quả'),
        personTile('Chú Ba', 'Giỗ cụ · 2024', a: 500000),
        personTile('Anh Long', 'Tân gia · 2025', a: -500000),
        personTile('Chị Lan', 'Thôi nôi · 2026', a: 500000),
        personTile('Anh Tuấn', 'Cưới · 2023', a: -500000),
      ]);
}
