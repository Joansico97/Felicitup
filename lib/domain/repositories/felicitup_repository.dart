import 'package:either_dart/either.dart';
import 'package:felicitup/core/utils/utils.dart';
import 'package:felicitup/domain/models/felicitup_model.dart';

abstract class FelicitupRepository {
  Future<Either<ApiException, List<FelicitupModel>>> getFelicitups();
  Future<Either<ApiException, FelicitupModel>> getFelicitupById(String id);
  Future<Either<ApiException, String>> createFelicitup(
    FelicitupModel felicitup,
  );
}
