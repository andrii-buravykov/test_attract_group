// part of 'holder_cubit.dart';
//
// enum HolderStatus { initial, loading, success, failure }
//
// class HolderState extends Equatable {
//   const HolderState({
//     this.status = HolderStatus.initial,
//     this.placeHolderLists = const [],
//     this.page = 0,
//     this.isAllLoaded = false,
//     this.errorMessage,
//   });
//
//   final HolderStatus status;
//   final List<PlaceHolder> placeHolderLists;
//   final int page;
//   final bool isAllLoaded;
//   final String? errorMessage;
//
//   HolderState copyWith({
//     HolderStatus? status,
//     List<PlaceHolder>? placeHolderLists,
//     int? page,
//     bool? isAllLoaded,
//     String? errorMessage,
//   }) {
//     return HolderState(
//       status: status ?? this.status,
//       placeHolderLists: placeHolderLists ?? this.placeHolderLists,
//       page: page ?? this.page,
//       isAllLoaded: isAllLoaded ?? this.isAllLoaded,
//       errorMessage: errorMessage ?? this.errorMessage,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//         status,
//         placeHolderLists,
//         page,
//         isAllLoaded,
//         errorMessage,
//       ];
// }
