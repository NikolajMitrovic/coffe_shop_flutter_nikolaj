import 'dart:async';
import 'package:coffe_shop_flutter/likes_bloc/likes_event.dart';
import 'package:coffe_shop_flutter/likes_bloc/likes_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikesBloc extends Bloc<LikesEvent, LikesState> {
  LikesBloc() : super(LikesState(isLiked: false)) {
    on<LikesChangedEvent>(_changed);
  }

  Future<void> _changed(LikesChangedEvent event, Emitter<LikesState> emit) async {
    emit(state.copyWith(isLiked: !state.isLiked));
  }
}
