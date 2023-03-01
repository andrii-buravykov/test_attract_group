import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesing/home/data/models/place_holder.dart';
import 'package:tesing/home/domain/repositories/holder_repository.dart';

part 'holder_state.dart';

class HolderCubit extends Cubit<HolderState> {
  HolderCubit(this.repository) : super(const HolderState()) {
    loadData();
  }

  final IHolderRepository repository;

  Future<void> loadData() async {
    if (state.isAllLoaded) return;
    final newPage = state.page + 1;

    final result = await repository.getPage(newPage);

    result.fold(
      (l) => emit(state.copyWith(errorMessage: l.errorMessage)),
      (r) => emit(HolderState(
        placeHolderLists: state.placeHolderLists + r,
        page: newPage,
      )),
    );

    if (result.right.isEmpty) {
      emit(HolderState(
        isAllLoaded: true,
        placeHolderLists: state.placeHolderLists,
      ));
      return;
    }
  }
}
