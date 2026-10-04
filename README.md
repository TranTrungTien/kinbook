# Kinbook

Sổ nghĩa tình của gia đình và bạn bè. Gift & Ceremony Ledger cho người Việt.

Sổ ghi nhớ hiếu hỉ theo từng người quen: ai đã gửi mình, mình đã đi đám ai, sắp tới có đám nào.

## Chạy
    flutter create . --project-name kinbook --org vn.kinbook   # sinh android/ios, không ghi đè lib/
    flutter pub get
    flutter test
    flutter run

## Cấu trúc
    lib/
      main.dart                  điểm vào
      app/                       app.dart (MaterialApp), shell.dart (4 tab, goHome)
      core/
        theme/                   app_colors, app_theme
        utils/                   format (VND), navigation, text_utils (bỏ dấu)
        widgets/                 AppPage, AppCard, PrimaryButton, ChipGroup, ...
      domain/
        models/                  Person, LedgerEvent, Contribution
        repositories/            LedgerRepository (interface)
      data/repositories/         InMemoryLedgerRepository (thay bằng Isar/Drift)
      features/                  mỗi tính năng một thư mục presentation/
        onboarding home events people transactions
        search reminders data_import stats settings
    test/                        widget + unit test

## Trạng thái
Giao diện 22 màn đã xong, đang dùng dữ liệu mẫu trong từng màn.
Lớp domain/data đã dựng sẵn nhưng chưa nối vào UI.

## Việc tiếp theo
1. Chọn DB cục bộ (Isar/Drift), viết repository thật.
2. Chọn state management (Riverpod khuyến nghị), nối màn với repository.
3. Lưu thật ở Ghi nhanh, hồ sơ, sự kiện; tìm kiếm dùng removeDiacritics.
4. Nhắc nhở (flutter_local_notifications), âm lịch, xuất Excel/PDF, khóa PIN/sinh trắc.
