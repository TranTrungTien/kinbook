import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/app/shell.dart';

class PasteImportScreen extends StatelessWidget {
  const PasteImportScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage(
      'Nhập từ danh sách',
      [
        appField('Dán danh sách', 'Mỗi dòng một người',
            v: 'Chú Ba 500k\nCô Hạnh 1tr5\nAnh Tuấn 2 triệu', lines: 4),
        sectionTitle('Xem trước · 3 khoản'),
        personTile('Chú Ba', 'Họ gửi bạn', a: 500000),
        personTile('Cô Hạnh', 'Họ gửi bạn', a: 1500000),
        personTile('Anh Tuấn', 'Họ gửi bạn', a: 2000000),
        appText('✓ Nhận diện đúng 3/3 dòng',
            w: FontWeight.w700, col: AppColors.green),
      ],
      bottom: PrimaryButton('Nhập 3 khoản', f: () => goHome(c)));
}
