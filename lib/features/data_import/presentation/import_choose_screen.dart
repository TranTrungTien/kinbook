import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';

class ImportChooseScreen extends StatelessWidget {
  const ImportChooseScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage('Nhập dữ liệu', [
        optionTile('📋', 'Dán danh sách', 'Chú Ba 500k, Cô Hạnh 1tr...',
            () => pushScreen(c, const PasteImportScreen())),
        optionTile('📊', 'File Excel / CSV', 'Tên, dịp, số tiền, ngày',
            () => pushScreen(c, const ExcelImportScreen())),
        optionTile('👥', 'Danh bạ điện thoại', 'Chỉ lấy tên, bạn chọn người'),
        optionTile('✍️', 'Nhập từng khoản', 'Bằng Ghi nhanh',
            () => pushScreen(c, const QuickAddScreen())),
      ]);
}
