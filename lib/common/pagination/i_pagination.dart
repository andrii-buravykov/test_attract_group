import 'package:either_dart/either.dart';
import 'package:tesing/common/pagination/pagination_result.dart';
import 'package:tesing/common/service/failure.dart';

abstract class IPagination<T> {
  Future<Either<Failure, PaginationResult<T>>> load({required int page});
}
