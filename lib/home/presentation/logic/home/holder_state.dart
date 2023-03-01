part of 'holder_cubit.dart';

class HolderState extends Equatable {
  const HolderState({
    this.placeHolderLists = const [],
    this.page = 0,
    this.isAllLoaded = false,
    this.errorMessage,
  });

  final List<PlaceHolder> placeHolderLists;
  final int page;
  final bool isAllLoaded;
  final String? errorMessage;

  HolderState copyWith({
    List<PlaceHolder>? placeHolderLists,
    int? page,
    bool? isAllLoaded,
    String? errorMessage,
  }) {
    return HolderState(
      placeHolderLists: placeHolderLists ?? this.placeHolderLists,
      page: page ?? this.page,
      isAllLoaded: isAllLoaded ?? this.isAllLoaded,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        placeHolderLists,
        page,
        isAllLoaded,
        errorMessage,
      ];
}
