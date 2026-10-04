import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage('Cài đặt', [
        const ToggleTile('🔒 Khóa ứng dụng', s: 'Face ID / mã PIN'),
        AppCard(Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          appText('📱 Dữ liệu lưu trên máy bạn', w: FontWeight.w700),
          appText('Không cần tài khoản. Không bán dữ liệu.',
              sz: 11, col: AppColors.mute)
        ])),
        optionTile('🔔', 'Nhắc nhở', 'Trước 7 ngày',
            () => pushScreen(c, const ReminderSettingsScreen())),
        optionTile('📥', 'Nhập dữ liệu', 'Dán danh sách, Excel',
            () => pushScreen(c, const ImportChooseScreen())),
        optionTile('📤', 'Xuất & sao lưu', 'Excel, PDF, JSON',
            () => pushScreen(c, const ExportScreen())),
      ]);
}
