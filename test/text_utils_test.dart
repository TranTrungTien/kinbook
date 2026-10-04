import 'package:flutter_test/flutter_test.dart';
import 'package:kinbook/core/utils/text_utils.dart';

void main() {
  test('bỏ dấu tiếng Việt', () {
    expect(removeDiacritics('Nguyễn Văn B'), 'nguyen van b');
    expect(removeDiacritics('Đồng nghiệp'), 'dong nghiep');
  });
}
