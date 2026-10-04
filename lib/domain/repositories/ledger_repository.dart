import 'package:kinbook/domain/models/ledger_models.dart';

/// Hợp đồng truy cập dữ liệu. Có thể thay bằng Isar/Drift mà UI không đổi.
abstract interface class LedgerRepository {
  Future<List<Person>> people();
  Future<void> addPerson(Person p);
  Future<void> deletePerson(String id);

  Future<List<LedgerEvent>> events();
  Future<void> addEvent(LedgerEvent e);
  Future<void> deleteEvent(String id);

  Future<List<Contribution>> contributions();
  Future<List<Contribution>> contributionsOf(String personId);
  Future<void> addContribution(Contribution c);
  Future<void> deleteContribution(String id);
}
