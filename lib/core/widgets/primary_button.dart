import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';

class PrimaryButton extends StatelessWidget {
  final String t;
  final VoidCallback? f;
  final bool outline;
  const PrimaryButton(this.t, {super.key, this.f, this.outline = false});
  @override
  Widget build(BuildContext c) => GestureDetector(
        onTap: f,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 14),
          margin: const EdgeInsets.only(bottom: 8),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: outline
                ? null
                : const LinearGradient(
                    colors: [AppColors.red, Color(0xFFD8A437)]),
            border:
                outline ? Border.all(color: AppColors.red, width: 1.5) : null,
            borderRadius: BorderRadius.circular(16),
            boxShadow: outline
                ? null
                : const [
                    BoxShadow(
                        color: Color(0x50A81F1A),
                        blurRadius: 14,
                        offset: Offset(0, 6))
                  ],
          ),
          child: appText(t,
              sz: 15,
              w: FontWeight.w800,
              col: outline ? AppColors.red : Colors.white),
        ),
      );
}
