class LikesState {
  bool isLiked;
  LikesState({
    required this.isLiked,
  });

  LikesState copyWith({
    bool? isLiked,
  }) {
    return LikesState(
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
