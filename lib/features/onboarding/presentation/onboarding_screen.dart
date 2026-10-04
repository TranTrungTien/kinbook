import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int i = 0;
  final pc = PageController();
  static const d = [
    [
      'Nhớ ai đã gửi mình',
      'Ghi lại mỗi khoản mừng, phúng viếng theo từng người để đi đám không còn lúng túng.'
    ],
    [
      'Tìm nhanh, nhắc đúng lúc',
      'Sắp đến đám của ai, app nhắc số tiền lần trước họ gửi bạn.'
    ],
    [
      'Dữ liệu của riêng bạn',
      'Lưu trên máy, khóa bằng PIN, xuất file bất cứ lúc nào.'
    ],
  ];
  @override
  Widget build(BuildContext c) => Scaffold(
        backgroundColor: AppColors.cream,
        body: Stack(
          children: [
            const ParchmentBackground(),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(children: [
                  Expanded(
                    child: PageView(
                        controller: pc,
                        onPageChanged: (v) => setState(() => i = v),
                        children: [
                          for (final e in d)
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  redEnvelopeWidget(),
                                  const SizedBox(height: 32),
                                  appText(e[0],
                                      sz: 22,
                                      w: FontWeight.w800,
                                      col: AppColors.red),
                                  const SizedBox(height: 12),
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24),
                                      child: Text(e[1],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              color: AppColors.mute,
                                              height: 1.5,
                                              fontSize: 13))),
                                ]),
                        ]),
                  ),
                  const SizedBox(height: 16),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    for (var k = 0; k < 3; k++)
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.all(3),
                          width: k == i ? 20 : 7,
                          height: 7,
                          decoration: BoxDecoration(
                              color: k == i
                                  ? AppColors.red
                                  : const Color(0xFFE8CFAE),
                              borderRadius: BorderRadius.circular(9))),
                  ]),
                  const SizedBox(height: 20),
                  PrimaryButton(i == 2 ? 'Bắt đầu' : 'Tiếp tục',
                      f: () => i == 2
                          ? pushScreen(c, const PinScreen())
                          : pc.nextPage(
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.easeOut)),
                  const SizedBox(height: 4),
                  TextButton(
                      onPressed: () => pushScreen(c, const PinScreen()),
                      child: const Text('Bỏ qua',
                          style: TextStyle(
                              color: AppColors.mute,
                              fontWeight: FontWeight.w600))),
                  const SizedBox(height: 8),
                ]),
              ),
            ),
          ],
        ),
      );
}
