import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/app/shell.dart';

class ExcelImportScreen extends StatelessWidget {
  const ExcelImportScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage(
      'Ghép cột',
      [
        optionTile('📄', 'so-cuoi-2024.xlsx', '48 dòng'),
        for (final m in const [
          ['Cột A', 'Tên'],
          ['Cột B', 'Dịp'],
          ['Cột C', 'Số tiền']
        ])
          AppCard(Row(children: [
            Expanded(child: appText(m[0])),
            const Icon(Icons.arrow_forward, size: 16),
            const SizedBox(width: 8),
            appText(m[1], w: FontWeight.w700, col: AppColors.red)
          ])),
        sectionTitle('Xem trước'),
        personTile('Chú Ba', 'Cưới', a: 500000),
        personTile('Cô Hạnh', 'Cưới', a: 1000000),
      ],
      bottom: PrimaryButton('Nhập 48 khoản', f: () => goHome(c)));
}
