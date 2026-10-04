import 'package:flutter/material.dart';
import 'package:kinbook/domain/models/ledger_models.dart';
import 'package:kinbook/domain/repositories/ledger_repository.dart';
import 'package:kinbook/data/repositories/in_memory_ledger_repository.dart';

class KinbookStateScope extends InheritedNotifier<KinbookState> {
  const KinbookStateScope({
    super.key,
    required KinbookState notifier,
    required super.child,
  }) : super(notifier: notifier);

  static KinbookState of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<KinbookStateScope>();
    assert(scope != null, 'No KinbookStateScope found in context');
    return scope!.notifier!;
  }
}

class KinbookState extends ChangeNotifier {
  final LedgerRepository repository;
  KinbookState({LedgerRepository? repo})
      : repository = repo ?? InMemoryLedgerRepository() {
    loadData();
  }

  List<Person> _people = [];
  List<LedgerEvent> _events = [];
  List<Contribution> _contributions = [];

  List<Person> get people => _people;
  List<LedgerEvent> get events => _events;
  List<Contribution> get contributions => _contributions;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadData() async {
    _isLoading = true;
    notifyListeners();
    _people = await repository.people();
    _events = await repository.events();
    _contributions = await repository.contributions();
    _isLoading = false;
    notifyListeners();
  }

  int get totalReceived => _contributions
      .where((c) => c.direction == Direction.received)
      .fold(0, (sum, c) => sum + c.amount);

  int get totalGiven => _contributions
      .where((c) => c.direction == Direction.given)
      .fold(0, (sum, c) => sum + c.amount);

  Future<void> addContribution({
    required String personName,
    required Direction direction,
    required int amount,
    required String occasion,
    String? note,
    String? eventId,
  }) async {
    Person person;
    final existing = _people.where(
        (p) => p.name.toLowerCase() == personName.trim().toLowerCase());
    if (existing.isNotEmpty) {
      person = existing.first;
    } else {
      person = Person(
        id: 'p_${DateTime.now().millisecondsSinceEpoch}',
        name: personName.trim(),
        relation: 'Khác',
      );
      await repository.addPerson(person);
    }

    final contribution = Contribution(
      id: 'c_${DateTime.now().millisecondsSinceEpoch}',
      personId: person.id,
      eventId: eventId,
      direction: direction,
      amount: amount,
      occasion: occasion,
      note: note,
      date: DateTime.now(),
    );

    await repository.addContribution(contribution);
    await loadData();
  }

  Future<void> addPerson({
    required String name,
    String? nickname,
    required String relation,
    List<String> notes = const [],
  }) async {
    final person = Person(
      id: 'p_${DateTime.now().millisecondsSinceEpoch}',
      name: name.trim(),
      nickname: nickname,
      relation: relation,
      notes: notes,
    );
    await repository.addPerson(person);
    await loadData();
  }

  Future<void> addEvent({
    required String title,
    required EventKind kind,
    required DateTime date,
    bool isLunar = false,
    int? expectedGuests,
  }) async {
    final event = LedgerEvent(
      id: 'e_${DateTime.now().millisecondsSinceEpoch}',
      title: title.trim(),
      kind: kind,
      date: date,
      isLunar: isLunar,
      expectedGuests: expectedGuests,
    );
    await repository.addEvent(event);
    await loadData();
  }

  Future<void> deleteContribution(String id) async {
    await repository.deleteContribution(id);
    await loadData();
  }
}
