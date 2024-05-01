import 'package:flutter_nov_trial/data/repositories/pocket.repository.dart';
import 'package:flutter_nov_trial/domains/models/pocket.model.dart';

class PocketUseCase {
  final PocketRepository pocketRepository;

  PocketUseCase({required this.pocketRepository});

  Future<List<Pocket>> fetchAllPockets() async {
    var asd = await pocketRepository.fetchAll();
    return asd;
  }

  Future<bool> savePocket(Pocket data) async {
    var isSuccess = await pocketRepository.save(data);
    if (!isSuccess) throw Exception("save failed: no pocket data");
    return isSuccess;
  }

  Future<List<Pocket>> saveAndfetchPockets(Pocket data) async {
    await pocketRepository.save(data);
    return fetchAllPockets();
  }
}
