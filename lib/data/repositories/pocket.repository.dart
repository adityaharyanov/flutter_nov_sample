import 'package:flutter_nov_trial/domains/models/pocket.model.dart';

class PocketRepository {
  final PocketDataService dataProvider;

  PocketRepository({required this.dataProvider});

  Future<List<Pocket>> fetchAll() async {
    var result = await dataProvider.getAllPockets();
    return result.map((e) => Pocket.fromMap(e)).toList();
  }

  Future<bool> save(Pocket data) {
    return dataProvider.insertPocket(data.toMap());
  }
}

abstract class PocketDataService {
  Future<List<Map<String, Object?>>> getAllPockets({int page = 1});
  Future<bool> insertPocket(Map<String, Object?> pocket);
}
