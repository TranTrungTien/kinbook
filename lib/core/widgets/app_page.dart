import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

/// Khung màn hình: header đào bo tròn + danh sách + vùng nút dưới.
class AppPage extends StatelessWidget {
  final String title;
  final List<Widget> kids;
  final Widget? bottom;
  final bool back;
  final List<Widget> actions;
  const AppPage(this.title, this.kids,
      {super.key, this.bottom, this.back = true, this.actions = const []});
  @override
   Widget build(BuildContext c) {
    final topPadding = MediaQuery.of(c).padding.top;
    return Scaffold(
      backgroundColor: AppColors.cream,
      body: Stack(
        children: [
          const ParchmentBackground(),
          Column(children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(
                  12, (topPadding > 0 ? topPadding : 16) + 8, 12, 14),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFFBD5B6), Color(0xFFFDEEDD)]),
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(22)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0x144A2A14),
                      blurRadius: 8,
                      offset: Offset(0, 3))
                ],
              ),
              child: Row(children: [
                if (back)
                  IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new, size: 18),
                      onPressed: () => Navigator.pop(c))
                else
                  const SizedBox(width: 4),
                Expanded(
                    child: Text(title,
                        style: TextStyle(
                            fontSize: back ? 17 : 20,
                            fontWeight: FontWeight.w800,
                            color: back ? AppColors.ink : AppColors.red))),
                ...actions,
              ]),
            ),
            Expanded(
                child: ListView(
                    padding: const EdgeInsets.fromLTRB(14, 14, 14, 24),
                    children: kids)),
            if (bottom != null)
              SafeArea(
                  top: false,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 6, 14, 12),
                      child: bottom)),
          ]),
        ],
      ),
    );
  }
}
