import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';
import 'package:kinbook/app/app_state.dart';
import 'package:kinbook/domain/models/ledger_models.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});
  @override
  Widget build(BuildContext c) {
    final state = KinbookStateScope.of(c);
    return AppPage(
        'Sự kiện',
        [
          const SegmentedTabs(['Nhà tôi tổ chức', 'Tôi đi dự']),
          if (state.events.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(child: Text('Chưa có sự kiện nào.')),
            )
          else
            for (final e in state.events)
              personTile(
                e.title,
                '${e.date.day}/${e.date.month}/${e.date.year} · ${e.expectedGuests ?? 0} khách',
                a: 15000000,
                hi: e.kind == EventKind.hieu,
                tap: () => pushScreen(
                    c, EventDetailScreen(hieu: e.kind == EventKind.hieu)),
              ),
        ],
        back: false,
        actions: [
          IconButton(
              icon: const Icon(Icons.add_circle_outline, color: AppColors.red),
              onPressed: () => pushScreen(c, const CreateEventScreen()))
        ]);
  }
}
