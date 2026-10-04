import 'package:flutter_test/flutter_test.dart';
import 'package:kinbook/app/app.dart';

void main() {
  testWidgets('hiển thị màn giới thiệu', (tester) async {
    await tester.pumpWidget(const KinbookApp());
    expect(find.text('Nhớ ai đã gửi mình'), findsOneWidget);
  });
}
