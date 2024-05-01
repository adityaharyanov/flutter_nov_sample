import 'package:flutter_nov_trial/data/repositories/pocket.repository.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';

class PocketMemoryDataService implements PocketDataService {
  List<Pocket> pockets = List<Pocket>.empty(growable: true);

  @override
  Future<List<Pocket>> fetchAll() {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return pockets;
      },
    );
  }

  @override
  Future<Pocket?> save(Pocket data) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        pockets.add(data);
        return data;
      },
    );
  }

  @override
  Future<List<Map<String, Object?>>> getAllPockets({int page = 1}) {
    // TODO: implement getAllPockets
    throw UnimplementedError();
  }

  @override
  Future<bool> insertPocket(Map<String, Object?> pocket) {
    // TODO: implement insertPocket
    throw UnimplementedError();
  }
}
