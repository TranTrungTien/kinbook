import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/app/app_state.dart';
import 'package:kinbook/domain/models/ledger_models.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int kindIdx = 0; // 0: hi, 1: hieu
  final titleController = TextEditingController();
  final guestsController = TextEditingController(text: '30');

  @override
  Widget build(BuildContext c) {
    final state = KinbookStateScope.of(c);
    return AppPage(
        'Tạo sự kiện',
        [
          Row(children: [
            for (var i = 0; i < 2; i++)
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => kindIdx = i),
                  child: Container(
                    margin: EdgeInsets.only(right: i == 0 ? 6 : 0),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: kindIdx == i
                          ? (i == 0 ? AppColors.red : AppColors.grey)
                          : const Color(0xFFF6E6CF),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      i == 0 ? 'Hỉ' : 'Hiếu',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: kindIdx == i ? Colors.white : AppColors.ink,
                      ),
                    ),
                  ),
                ),
              ),
          ]),
          const SizedBox(height: 12),
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Tên sự kiện',
              hintText: 'Đám cưới con gái',
              filled: true,
              fillColor: const Color(0xFFFFFAF2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: AppColors.line),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: guestsController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Số khách dự kiến',
              hintText: '48',
              filled: true,
              fillColor: const Color(0xFFFFFAF2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: AppColors.line),
              ),
            ),
          ),
        ],
        bottom: PrimaryButton('Tạo sự kiện', f: () async {
          if (titleController.text.trim().isEmpty) {
            ScaffoldMessenger.of(c).showSnackBar(
              const SnackBar(content: Text('Vui lòng nhập tên sự kiện')),
            );
            return;
          }
          await state.addEvent(
            title: titleController.text.trim(),
            kind: kindIdx == 0 ? EventKind.hi : EventKind.hieu,
            date: DateTime.now(),
            expectedGuests: int.tryParse(guestsController.text.trim()) ?? 30,
          );
          if (!c.mounted) return;
          Navigator.pop(c);
        }));
  }
}
