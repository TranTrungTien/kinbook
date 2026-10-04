String formatVnd(int n) {
  final s = n
      .abs()
      .toString()
      .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (m) => '.');
  return '${n < 0 ? '−' : ''}$sđ';
}
