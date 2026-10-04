import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

class WatermarkCircles extends StatelessWidget {
  const WatermarkCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -40,
      top: 60,
      child: IgnorePointer(
        child: Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0x30C9962B), // #c9962b30
              width: 1.0,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x10C9962B), // #c9962b10
                blurRadius: 0,
                spreadRadius: 14,
              ),
              BoxShadow(
                color: Color(0x08C9962B), // #c9962b08
                blurRadius: 0,
                spreadRadius: 28,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParchmentBackground extends StatelessWidget {
  const ParchmentBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFDF3E6),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topRight,
                  radius: 0.8,
                  colors: [
                    const Color(0xFFF6D9B8).withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 260,
              height: 260,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomLeft,
                  radius: 0.8,
                  colors: [
                    const Color(0xFFF8E2C6).withValues(alpha: 0.8),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          const WatermarkCircles(),
        ],
      ),
    );
  }
}

Widget _gradientCard(String l, String v, List<Color> c) => Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: c,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(18),
            boxShadow: const [
              BoxShadow(
                  color: Color(0x1F000000), blurRadius: 10, offset: Offset(0, 4))
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          appText(l, sz: 11, col: Colors.white70),
          const SizedBox(height: 6),
          appText(v, sz: 16, w: FontWeight.w800, col: Colors.white)
        ]),
      ),
    );

Widget summaryCards(String l1, String v1, String l2, String v2) => Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(children: [
        _gradientCard(l1, v1, const [Color(0xFF2E6B45), Color(0xFF163823)]),
        const SizedBox(width: 10),
        _gradientCard(l2, v2, const [Color(0xFFA81F1A), Color(0xFF6F130F)]),
      ]),
    );

class EnvelopePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF9E1F18)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width / 2, size.height * 0.8)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

Widget redEnvelopeWidget() => Container(
      width: 104,
      height: 72,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFC93A30), Color(0xFF7D1712)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x407D1712),
            blurRadius: 14,
            offset: Offset(0, 6),
          )
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 36,
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: CustomPaint(
                painter: EnvelopePainter(),
              ),
            ),
          ),
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: Color(0xFFF6DC8A),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Color(0x33000000),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                )
              ],
            ),
            alignment: Alignment.center,
            child: const Text('đ',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF7D1712))),
          ),
        ],
      ),
    );

Widget homeTotalSummaryCards({
  required String receivedTitle,
  required String receivedAmount,
  required String givenTitle,
  required String givenAmount,
  VoidCallback? onReceivedTap,
  VoidCallback? onGivenTap,
}) =>
    Column(
      children: [
        GestureDetector(
          onTap: onReceivedTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFC0312A), Color(0xFF7D1712)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x33A81F1A),
                    blurRadius: 14,
                    offset: Offset(0, 5))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText('Tổng Thu (Sự kiện Vui/Hiếu)',
                        sz: 11, col: Colors.white70),
                    const SizedBox(height: 4),
                    appText(receivedTitle,
                        sz: 15, w: FontWeight.w700, col: Colors.white),
                    const SizedBox(height: 6),
                    appText(receivedAmount,
                        sz: 22, w: FontWeight.w800, col: Colors.white),
                  ],
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: const Text('💰', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: onGivenTap,
          child: Container(
            margin: const EdgeInsets.only(bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1E5638), Color(0xFF0D2818)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Color(0x330D2818),
                    blurRadius: 14,
                    offset: Offset(0, 5))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText('Tổng Chi (Đi Sự kiện/Hi)',
                        sz: 11, col: Colors.white70),
                    const SizedBox(height: 4),
                    appText(givenTitle,
                        sz: 15, w: FontWeight.w700, col: Colors.white),
                    const SizedBox(height: 6),
                    appText(givenAmount,
                        sz: 22, w: FontWeight.w800, col: Colors.white),
                  ],
                ),
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  alignment: Alignment.center,
                  child: const Text('🧧', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
          ),
        ),
      ],
    );

Widget eventBanner(String t, String s,
        {double? p, String? note, bool hi = false}) =>
    Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: hi
                ? const [Color(0xFF6F665E), Color(0xFF3A342E)]
                : const [Color(0xFFC0312A), Color(0xFF6A110D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        appText(t, sz: 18, w: FontWeight.w800, col: Colors.white),
        appText(s, sz: 12, col: Colors.white70),
        if (note != null)
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: appText(note, col: Colors.white)),
        if (p != null)
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: LinearProgressIndicator(
                      value: p,
                      minHeight: 8,
                      backgroundColor: Colors.white24,
                      color: const Color(0xFFF3C75B)))),
      ]),
    );
