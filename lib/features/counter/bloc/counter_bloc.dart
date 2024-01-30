import 'package:counter_app/features/counter/bloc/counter_event.dart';
import 'package:counter_app/features/counter/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(5)) {
    on<IncreaseCounterEvent>(_increase);
    on<DecreaseCounterEvent>(_decrease);
    on<ResetCounterEvent>((event, emit) {
      emit(CounterState(0));
    });
  }

  void _increase(IncreaseCounterEvent event, Emitter<CounterState> emit) {
    emit(CounterState(state.value + event.inceraseAmount));
  }

  void _decrease(DecreaseCounterEvent event, Emitter<CounterState> emit) {
    emit(CounterState(state.value - event.deceraseAmount));
  }
}
