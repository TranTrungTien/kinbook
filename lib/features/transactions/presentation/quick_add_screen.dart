import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/app/app_state.dart';
import 'package:kinbook/domain/models/ledger_models.dart';

class QuickAddScreen extends StatefulWidget {
  const QuickAddScreen({super.key});

  @override
  State<QuickAddScreen> createState() => _QuickAddScreenState();
}

class _QuickAddScreenState extends State<QuickAddScreen> {
  int directionIdx = 0; // 0: received (Họ gửi bạn), 1: given (Bạn đi đám)
  int amountIdx = 2; // default 500k
  final amounts = [100000, 200000, 500000, 1000000, 2000000];
  final amountLabels = ['100k', '200k', '500k', '1 triệu', '2 triệu'];
  int occasionIdx = 0;
  final occasions = ['Cưới', 'Tân gia', 'Đầy tháng', 'Tang lễ', 'Thăm đẻ'];

  final nameController = TextEditingController();
  final noteController = TextEditingController();

  @override
  Widget build(BuildContext c) {
    final state = KinbookStateScope.of(c);
    final selectedAmount = amounts[amountIdx];

    return AppPage(
      'Ghi Chú Nhanh',
      [
        sectionTitle('Loại Giao Dịch'),
        Row(children: [
          for (var i = 0; i < 2; i++)
            Expanded(
              child: GestureDetector(
                onTap: () => setState(() => directionIdx = i),
                child: Container(
                  margin: EdgeInsets.only(right: i == 0 ? 6 : 0),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: directionIdx == i
                        ? AppColors.red
                        : const Color(0xFFF6E6CF),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    i == 0 ? 'Họ gửi bạn' : 'Bạn đi đám',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: directionIdx == i ? Colors.white : AppColors.ink,
                    ),
                  ),
                ),
              ),
            ),
        ]),
        const SizedBox(height: 12),
        sectionTitle('Số Tiền'),
        Center(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.line),
          ),
          child: appText(formatVnd(selectedAmount),
              sz: 30, w: FontWeight.w800, col: AppColors.red),
        )),
        const SizedBox(height: 10),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            for (var i = 0; i < amountLabels.length; i++)
              GestureDetector(
                onTap: () => setState(() => amountIdx = i),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: amountIdx == i
                        ? AppColors.red
                        : const Color(0xFFF6E6CF),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    amountLabels[i],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: amountIdx == i ? Colors.white : AppColors.ink,
                    ),
                  ),
                ),
              ),
          ],
        ),
        sectionTitle('Tên Người/Gia Đình'),
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: 'VD: Chú Ba, Cô Hạnh...',
            filled: true,
            fillColor: const Color(0xFFFFFAF2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: AppColors.line),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Wrap(spacing: 8, children: [
          for (final p in state.people.take(3))
            ActionChip(
                label: Text(p.name),
                onPressed: () => setState(() => nameController.text = p.name),
                backgroundColor: const Color(0xFFF6E6CF)),
        ]),
        const SizedBox(height: 10),
        sectionTitle('Loại Sự Kiện'),
        Wrap(
          spacing: 6,
          runSpacing: 6,
          children: [
            for (var i = 0; i < occasions.length; i++)
              GestureDetector(
                onTap: () => setState(() => occasionIdx = i),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  decoration: BoxDecoration(
                    color: occasionIdx == i
                        ? AppColors.red
                        : const Color(0xFFF6E6CF),
                    borderRadius: BorderRadius.circular(99),
                  ),
                  child: Text(
                    occasions[i],
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: occasionIdx == i ? Colors.white : AppColors.ink,
                    ),
                  ),
                ),
              ),
          ],
        ),
        sectionTitle('Ghi Chú (Optional)'),
        TextField(
          controller: noteController,
          maxLines: 2,
          decoration: InputDecoration(
            hintText: 'Mâm số 5, Quà hiện vật...',
            filled: true,
            fillColor: const Color(0xFFFFFAF2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(13),
              borderSide: const BorderSide(color: AppColors.line),
            ),
          ),
        ),
      ],
      bottom: PrimaryButton('Lưu Thần Tốc', f: () async {
        if (nameController.text.trim().isEmpty) {
          ScaffoldMessenger.of(c).showSnackBar(
            const SnackBar(content: Text('Vui lòng nhập tên người/gia đình')),
          );
          return;
        }
        await state.addContribution(
          personName: nameController.text.trim(),
          direction: directionIdx == 0 ? Direction.received : Direction.given,
          amount: selectedAmount,
          occasion: occasions[occasionIdx],
          note: noteController.text.trim().isEmpty
              ? null
              : noteController.text.trim(),
        );
        if (c.mounted) Navigator.pop(c);
      }),
    );
  }
}
