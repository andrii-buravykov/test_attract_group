import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesing/common/app_constants.dart';
import 'package:tesing/common/pagination/i_pagination.dart';
import 'package:tesing/common/pagination/pagination_result.dart';

part 'pagination_state.dart';

class PaginationCubit<T> extends Cubit<PaginationState<T>> {
  final IPagination<T> _repository;

  PaginationCubit(this._repository)
      : super(PaginationInitial<T>(PaginationResult())) {
    loadFreshData();
  }

  var _isLoading = false;

  /// Provide this method only to [RefreshIndicator] or
  /// first time when loading data
  Future<void> loadFreshData() async {
    if (_isLoading) return;
    _isLoading = true;
    emit(PaginationLoading<T>(state.result));

    final result = await _repository.load(page: 1);
    _isLoading = false;

    result.fold(
      (l) => emit(PaginationError<T>(
        state.result,
        error: l.errorMessage,
      )),
      (r) => emit(PaginationSuccess<T>(r)),
    );
  }

  Future<void> loadDataOnScroll() async {
    if (_isLoading) return;
    _isLoading = true;

    final result = await _repository.load(page: state.result.meta.currentPage);
    _isLoading = false;
    result.fold(
      (l) => emit(PaginationError<T>(
        state.result,
        error: l.errorMessage,
      )),
      (r) {
        final model = r..list.insertAll(0, state.result.list);

        emit(PaginationSuccess<T>(model));
      },
    );
  }
}
