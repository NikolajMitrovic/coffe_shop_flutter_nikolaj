import 'dart:async';
import 'package:coffe_shop_flutter/counter_bloc/counter_event.dart';
import 'package:coffe_shop_flutter/counter_bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(_initialState()) {
    on<CounterIncrementEvent>(_increment);
    on<CounterDecrementEvent>(_decrement);
  }

  Future<void> _increment(CounterIncrementEvent event, Emitter<CounterState> emit) async {
    emit(state.copyWith(count: state.count + 1));
  }

  Future<void> _decrement(CounterDecrementEvent event, Emitter<CounterState> emit) async {
    emit(state.copyWith(count: state.count - 1));
  }

  static CounterState _initialState() => CounterState(count: 1);
}
