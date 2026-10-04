import 'package:kinbook/domain/models/ledger_models.dart';
import 'package:kinbook/domain/repositories/ledger_repository.dart';

class InMemoryLedgerRepository implements LedgerRepository {
  final _people = <Person>[
    const Person(id: 'p1', name: 'Nguyễn Văn B', relation: 'Bạn đại học', notes: ['Con gái tên Bông, sinh tháng 8', 'Thích cà phê, không uống bia'])
  ];
  final _events = <LedgerEvent>[
    LedgerEvent(
        id: 'e1',
        title: 'Đám cưới con gái',
        kind: EventKind.hi,
        date: DateTime(2026, 5, 12),
        expectedGuests: 48)
  ];
  final _items = <Contribution>[
    Contribution(
        id: 'c1',
        personId: 'p1',
        eventId: 'e1',
        direction: Direction.received,
        amount: 1000000,
        occasion: 'Cưới',
        note: 'Mâm số 5, kèm quà hiện vật',
        date: DateTime.now().subtract(const Duration(days: 1))),
    Contribution(
        id: 'c2',
        personId: 'p1',
        direction: Direction.given,
        amount: 500000,
        occasion: 'Tân gia',
        note: 'Mừng nhà mới',
        date: DateTime.now().subtract(const Duration(days: 365))),
  ];

  @override
  Future<List<Person>> people() async => List.unmodifiable(_people);
  @override
  Future<void> addPerson(Person p) async => _people.add(p);
  @override
  Future<void> deletePerson(String id) async => _people.removeWhere((p) => p.id == id);

  @override
  Future<List<LedgerEvent>> events() async => List.unmodifiable(_events);
  @override
  Future<void> addEvent(LedgerEvent e) async => _events.add(e);
  @override
  Future<void> deleteEvent(String id) async => _events.removeWhere((e) => e.id == id);

  @override
  Future<List<Contribution>> contributions() async => List.unmodifiable(_items);
  @override
  Future<List<Contribution>> contributionsOf(String personId) async =>
      _items.where((c) => c.personId == personId).toList();
  @override
  Future<void> addContribution(Contribution c) async => _items.add(c);
  @override
  Future<void> deleteContribution(String id) async => _items.removeWhere((c) => c.id == id);
}
