import 'package:either_dart/either.dart';
import 'package:tesing/common/pagination/i_pagination.dart';
import 'package:tesing/common/pagination/pagination_result.dart';
import 'package:tesing/holder/data/datasources/holder_data_source.dart';
import 'package:tesing/common/service/failure.dart';
import 'package:tesing/holder/data/models/place_holder.dart';

class HolderRepository<T> extends IPagination<PlaceHolder> {
  HolderRepository(this.dataSource);

  final IHolderDataSource dataSource;

  @override
  Future<Either<Failure, PaginationResult<PlaceHolder>>> load(
      {required int page}) async {
    try {
      final result = await dataSource.getFromHolder(page);
      return Right(result);
    } catch (e) {
      return Left(Failure.from(e));
    }
  }
}
