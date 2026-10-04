import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';
import 'package:kinbook/app/app_state.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});
  @override
  Widget build(BuildContext c) {
    final state = KinbookStateScope.of(c);
    return AppPage(
        'Người quen',
        [
          appField('Tìm', 'nguyen van b...'),
          const ChipGroup(['Tất cả', 'Họ hàng', 'Bạn bè', 'Đồng nghiệp']),
          if (state.people.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: Text('Chưa có người quen nào.')),
            )
          else
            for (final p in state.people)
              personTile(p.name, '${p.relation} · ${p.notes.length} ghi chú',
                  tap: () => pushScreen(c, const ProfileScreen())),
        ],
        back: false,
        actions: [
          IconButton(
              icon: const Icon(Icons.person_add_alt, color: AppColors.red),
              onPressed: () => pushScreen(c, const AddPersonScreen()))
        ]);
  }
}
