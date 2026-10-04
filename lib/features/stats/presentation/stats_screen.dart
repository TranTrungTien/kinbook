import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/app/app_state.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});
  @override
  Widget build(BuildContext c) {
    final state = KinbookStateScope.of(c);
    const a = [.3, .8, .55, .2, .9], b = [.12, .35, .2, .45, .15];
    return AppPage(
        'Thống kê',
        [
          const SegmentedTabs(['2024', '2025', '2026']),
          summaryCards('Đã nhận', formatVnd(state.totalReceived), 'Đã đi đám', formatVnd(state.totalGiven)),
          AppCard(SizedBox(
            height: 110,
            child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
              for (var i = 0; i < 5; i++)
                Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Container(
                          width: 12,
                          height: 100 * a[i],
                          decoration: BoxDecoration(
                              color: AppColors.green,
                              borderRadius: BorderRadius.circular(4))),
                      const SizedBox(width: 3),
                      Container(
                          width: 12,
                          height: 100 * b[i],
                          decoration: BoxDecoration(
                              color: AppColors.red,
                              borderRadius: BorderRadius.circular(4))),
                    ])),
            ]),
          )),
          sectionTitle('Theo dịp'),
          personTile('Cưới', '', a: 18000000),
          personTile('Tân gia', '', a: 9000000),
          personTile('Phúng viếng', '', a: 3000000, hi: true),
        ],
        back: false);
  }
}
