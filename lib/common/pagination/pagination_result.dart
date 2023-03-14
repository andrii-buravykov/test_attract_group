import 'package:tesing/common/service/meta.dart';

class PaginationResult<T> {
  final List<T> list;
   final Meta meta;

  PaginationResult({
    this.list = const [],
     Meta? meta,
  }) : meta = meta ?? const Meta();

  PaginationResult<T> copyWith({
    List<T>? list,
    Meta? meta,
  }) {
    return PaginationResult(
      list: list ?? this.list,
      meta: meta ?? this.meta,
    );
  }
}
