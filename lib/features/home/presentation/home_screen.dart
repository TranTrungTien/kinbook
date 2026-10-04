import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';
import 'package:kinbook/app/app_state.dart';
import 'package:kinbook/domain/models/ledger_models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext c) {
    final state = KinbookStateScope.of(c);
    final rec = formatVnd(state.totalReceived);
    final giv = formatVnd(state.totalGiven);

    return AppPage(
        'Sổ Hiếu Hỉ',
        [
          homeTotalSummaryCards(
            receivedTitle: state.events.isNotEmpty
                ? state.events.first.title
                : 'Chưa có sự kiện',
            receivedAmount: rec,
            givenTitle: state.contributions.isNotEmpty
                ? state.contributions.last.occasion
                : 'Chưa có khoản đi',
            givenAmount: giv,
            onReceivedTap: () => pushScreen(c, const EventDetailScreen()),
            onGivenTap: () => pushScreen(c, const ContributionDetailScreen()),
          ),
          AppCard(
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                appText('🔔 Sắp tới · 20/10 (âm 9/9)', w: FontWeight.w700),
                appText('Đám cưới Hùng – Mai. Lần trước họ gửi bạn 500.000đ',
                    sz: 12)
              ]),
              onTap: () => pushScreen(c, const RemindersScreen())),
          sectionTitle('Gần đây'),
          if (state.contributions.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                  child: Text(
                      'Chưa có giao dịch nào. Bấm "Lưu Thần Tốc" để ghi sổ.')),
            )
          else
            for (final item in state.contributions.reversed.take(5))
              personTile(
                item.personId,
                '${item.occasion} · ${item.date.day}/${item.date.month}/${item.date.year}',
                a: item.direction == Direction.received
                    ? item.amount
                    : -item.amount,
                tap: () => pushScreen(c, const ContributionDetailScreen()),
              ),
        ],
        back: false,
        bottom: PrimaryButton('＋ Lưu Thần Tốc',
            f: () => pushScreen(c, const QuickAddScreen())),
        actions: [
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () => pushScreen(c, const SearchScreen())),
          IconButton(
              icon: const Icon(Icons.settings_outlined),
              onPressed: () => pushScreen(c, const SettingsScreen())),
        ]);
  }
}
