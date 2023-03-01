import 'package:either_dart/either.dart';
import 'package:tesing/home/data/datasources/holder_data_source.dart';
import 'package:tesing/home/data/models/place_holder.dart';
import 'package:tesing/home/domain/repositories/failure.dart';

abstract class IHolderRepository {
  Future<Either<Failure, List<PlaceHolder>>> getPage(int page);
}

class HolderRepository implements IHolderRepository {
  HolderRepository(this.dataSource);
  final IHolderDataSource dataSource;

  @override
  Future<Either<Failure, List<PlaceHolder>>> getPage(int page) async {
    try {
      final result = await dataSource.getFromHolder(page);
      return Right(result);
    } catch (e) {
      return Left(Failure.from(e));
    }
  }
}
