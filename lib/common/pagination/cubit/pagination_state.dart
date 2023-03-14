part of 'pagination_cubit.dart';

abstract class PaginationState<T> extends Equatable {
  const PaginationState(this.result);

  final PaginationResult<T> result;

  @override
  List<Object?> get props => [result];
}

class PaginationInitial<T> extends PaginationState<T> {
  const PaginationInitial(PaginationResult<T> result) : super(result);
}

class PaginationLoading<T> extends PaginationState<T> {
  const PaginationLoading(PaginationResult<T> result) : super(result);
}

// class PaginationLoadingOnScroll<T> extends PaginationState<T> {
//   const PaginationLoadingOnScroll(PaginationResult<T> result) : super(result);
// }

class PaginationSuccess<T> extends PaginationState<T> {
  const PaginationSuccess(PaginationResult<T> result) : super(result);
}

class PaginationError<T> extends PaginationState<T> {
  final String error;

  const PaginationError(
    PaginationResult<T> result, {
    required String? error,
  })  : error = error ?? AppConstants.unexpectedError,
        super(result);

  @override
  List<Object?> get props => super.props + [error];
}
