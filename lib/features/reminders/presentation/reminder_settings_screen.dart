import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

class ReminderSettingsScreen extends StatelessWidget {
  const ReminderSettingsScreen({super.key});
  @override
  Widget build(BuildContext c) => AppPage('Nhắc nhở', [
        const ToggleTile('Sắp đến lượt đi đám',
            s: 'Hiện số tiền họ từng gửi bạn'),
        const ToggleTile('Sinh nhật'),
        const ToggleTile('Giỗ, kỷ niệm (theo âm lịch)'),
        sectionTitle('Nhắc trước'),
        const ChipGroup(['3 ngày', '7 ngày', '14 ngày', '30 ngày'], on: 1),
        appField('Giờ nhắc', '08:00', v: '08:00'),
      ]);
}
