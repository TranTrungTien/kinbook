import 'package:flutter/material.dart';

/// Bảng màu thương hiệu: đỏ hỷ, vàng đồng, kem.
/// Quy ước theo Design System HTML Sổ Hiếu Hỉ:
/// - cream (--pg): #fdf3e6 (Nền trang)
/// - ink (--tx): #33201a (Chữ chính)
/// - mute (--mu): #85706a (Chữ phụ)
/// - red (--rd): #a81f1a (Đỏ hỉ / Đi đám)
/// - green (--gr): #2e6b45 (Xanh nhận / Họ gửi bạn)
/// - gold (--gd): #c9962b (Vàng đồng)
/// - line (--ln): #efdfca (Đường viền)
abstract final class AppColors {
  static const Color red = Color(0xFFA81F1A);
  static const Color redDark = Color(0xFF6F130F);
  static const Color gold = Color(0xFFC9962B);
  static const Color green = Color(0xFF2E6B45);
  static const Color greenDark = Color(0xFF1F4D33);
  static const Color peach = Color(0xFFFBDCC4);
  static const Color cream = Color(0xFFFDF3E6);
  static const Color ink = Color(0xFF33201A);
  static const Color mute = Color(0xFF85706A);
  static const Color line = Color(0xFFEFDFCA);
  static const Color grey = Color(0xFF4A423C);
}
