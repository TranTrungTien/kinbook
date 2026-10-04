const _groups = {
  'a': 'àáạảãâầấậẩẫăằắặẳẵ',
  'e': 'èéẹẻẽêềếệểễ',
  'i': 'ìíịỉĩ',
  'o': 'òóọỏõôồốộổỗơờớợởỡ',
  'u': 'ùúụủũưừứựửữ',
  'y': 'ỳýỵỷỹ',
  'd': 'đ',
};

/// Bỏ dấu tiếng Việt để tìm kiếm không dấu: "Nguyễn Văn B" -> "nguyen van b".
String removeDiacritics(String input) {
  var s = input.toLowerCase();
  _groups.forEach((base, chars) {
    for (final ch in chars.split('')) {
      s = s.replaceAll(ch, base);
    }
  });
  return s;
}
