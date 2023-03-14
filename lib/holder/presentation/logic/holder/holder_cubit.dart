// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tesing/common/pagination/i_pagination.dart';
// import 'package:tesing/holder/data/models/place_holder.dart';
//
// part 'holder_state.dart';
//
// class HolderCubit extends Cubit<HolderState> {
//   HolderCubit(this.repository) : super(const HolderState()) {
//     loadData();
//   }
//
//   final IPagination<PlaceHolder> repository;
//
//   Future<void> loadData({bool onScroll = false}) async {
//     if (state.isAllLoaded && onScroll) return;
//     emit(state.copyWith(status: HolderStatus.loading));
//
//     final newPage = onScroll ? (state.page + 1) : 1;
//     final result = await repository.load(page: newPage);
//     result.fold(
//       (l) => emit(state.copyWith(
//         status: HolderStatus.failure,
//         errorMessage: l.errorMessage,
//       )),
//       (r) => emit(state.copyWith(
//         status: HolderStatus.success,
//         isAllLoaded: r.list.isEmpty,
//         placeHolderLists: onScroll ? (state.placeHolderLists + r.list) : r.list,
//         page: newPage,
//       )),
//     );
//   }
// }
