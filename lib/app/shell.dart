import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';

/// Khung 4 tab chính của ứng dụng bám sát specification HTML.
class Shell extends StatefulWidget {
  const Shell({super.key});
  @override
  State<Shell> createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  int _index = 0;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.cream,
        body: IndexedStack(index: _index, children: const [
          HomeScreen(),
          EventsScreen(),
          PeopleScreen(),
          StatsScreen()
        ]),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.fromLTRB(14, 0, 14, 12),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x1FA81F1A),
                  blurRadius: 16,
                  offset: Offset(0, 4))
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildTab(0, '🏠', 'Trang chủ'),
              _buildTab(1, '📅', 'Sự kiện'),
              _buildTab(2, '👥', 'Người quen'),
              _buildTab(3, '📊', 'Thống kê'),
            ],
          ),
        ),
      );

  Widget _buildTab(int idx, String emoji, String label) {
    final bool on = _index == idx;
    return GestureDetector(
      onTap: () => setState(() => _index = idx),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: on ? FontWeight.w800 : FontWeight.w600,
                color: on ? AppColors.red : AppColors.mute,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Về trang chủ và xóa toàn bộ ngăn xếp điều hướng.
void goHome(BuildContext c) => Navigator.pushAndRemoveUntil(
    c, MaterialPageRoute(builder: (_) => const Shell()), (r) => false);
