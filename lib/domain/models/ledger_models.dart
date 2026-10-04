/// Chiều của khoản mừng: họ gửi bạn hay bạn đi đám.
enum Direction { received, given }

/// Hỉ (vui) hoặc Hiếu (tang, giỗ).
enum EventKind { hi, hieu }

class Person {
  final String id;
  final String name;
  final String? nickname;
  final String relation;
  final List<String> notes;
  const Person(
      {required this.id,
      required this.name,
      this.nickname,
      required this.relation,
      this.notes = const []});
}

class LedgerEvent {
  final String id;
  final String title;
  final EventKind kind;
  final DateTime date;
  final bool isLunar;
  final int? expectedGuests;
  const LedgerEvent(
      {required this.id,
      required this.title,
      required this.kind,
      required this.date,
      this.isLunar = false,
      this.expectedGuests});
}

class Contribution {
  final String id;
  final String personId;
  final String? eventId;
  final Direction direction;
  final int amount;
  final String occasion;
  final String? note;
  final DateTime date;
  const Contribution(
      {required this.id,
      required this.personId,
      this.eventId,
      required this.direction,
      required this.amount,
      required this.occasion,
      this.note,
      required this.date});
}
