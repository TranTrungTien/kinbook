import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';
import 'package:kinbook/app/shell.dart';

class ImportHintScreen extends StatelessWidget {
  const ImportHintScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage(
      'Bắt đầu',
      [
        const SizedBox(height: 10),
        Center(child: redEnvelopeWidget()),
        const SizedBox(height: 16),
        Center(
            child: appText('Bạn đã có sổ cũ?',
                sz: 21, w: FontWeight.w800, col: AppColors.red)),
        Center(
            child: appText(
                'Nhập các khoản đã ghi để có đủ lịch sử ngay hôm nay.',
                col: AppColors.mute)),
        const SizedBox(height: 16),
        optionTile('📋', 'Dán danh sách', 'Nhanh nhất, từ ghi chú hoặc Zalo',
            () => pushScreen(c, const PasteImportScreen())),
        optionTile('📊', 'Nhập từ Excel/CSV', 'Từ file bạn đang dùng',
            () => pushScreen(c, const ExcelImportScreen())),
      ],
      bottom: PrimaryButton('Để sau, bắt đầu từ sổ trống',
          outline: true, f: () => goHome(c)),
      back: false);
}
