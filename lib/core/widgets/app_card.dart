import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final bool hi;
  final VoidCallback? onTap;
  const AppCard(this.child, {super.key, this.hi = false, this.onTap});
  @override
  Widget build(BuildContext c) => Container(
        margin: const EdgeInsets.only(bottom: 9),
        decoration: BoxDecoration(
          color: hi ? const Color(0xFFEFEBE7) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border:
              Border.all(color: hi ? const Color(0xFFD8D0C8) : AppColors.line),
          boxShadow: const [
            BoxShadow(
                color: Color(0x14A81F1A), blurRadius: 10, offset: Offset(0, 3))
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: onTap,
              child: Padding(padding: const EdgeInsets.all(12), child: child)),
        ),
      );
}
