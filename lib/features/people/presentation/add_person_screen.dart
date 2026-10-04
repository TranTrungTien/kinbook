import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/app/app_state.dart';

class AddPersonScreen extends StatefulWidget {
  const AddPersonScreen({super.key});

  @override
  State<AddPersonScreen> createState() => _AddPersonScreenState();
}

class _AddPersonScreenState extends State<AddPersonScreen> {
  int relationIdx = 1; // default Bạn bè
  final relations = ['Họ hàng', 'Bạn bè', 'Đồng nghiệp', 'Hàng xóm', 'Khác'];
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();

  @override
  Widget build(BuildContext c) {
    final state = KinbookStateScope.of(c);
    return AppPage(
        'Thêm người',
        [
          const Center(
              child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFFF2B999),
                  child: Icon(Icons.camera_alt_outlined, color: AppColors.red))),
          const SizedBox(height: 12),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              labelText: 'Tên',
              hintText: 'Nguyễn Văn B',
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
            controller: nicknameController,
            decoration: InputDecoration(
              labelText: 'Tên hay gọi (tùy chọn)',
              hintText: 'Thằng B, anh Bê...',
              filled: true,
              fillColor: const Color(0xFFFFFAF2),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(13),
                borderSide: const BorderSide(color: AppColors.line),
              ),
            ),
          ),
          sectionTitle('Quan hệ'),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              for (var i = 0; i < relations.length; i++)
                GestureDetector(
                  onTap: () => setState(() => relationIdx = i),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 8),
                    decoration: BoxDecoration(
                      color: relationIdx == i
                          ? AppColors.red
                          : const Color(0xFFF6E6CF),
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      relations[i],
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: relationIdx == i ? Colors.white : AppColors.ink,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
        bottom: PrimaryButton('Lưu', f: () async {
          if (nameController.text.trim().isEmpty) {
            ScaffoldMessenger.of(c).showSnackBar(
              const SnackBar(content: Text('Vui lòng nhập tên người quen')),
            );
            return;
          }
          await state.addPerson(
            name: nameController.text.trim(),
            nickname: nicknameController.text.trim().isEmpty
                ? null
                : nicknameController.text.trim(),
            relation: relations[relationIdx],
          );
          if (!c.mounted) return;
          Navigator.pop(c);
        }));
  }
}
