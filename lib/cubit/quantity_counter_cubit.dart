import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'quantity_counter_state.dart';

class QuantityCounterCubit extends Cubit<QuantityCounterState> {
  QuantityCounterCubit() : super(const QuantityCounterState(1));

  void increment() => emit(QuantityCounterState(state.counter + 1));
  void decrement() =>
      emit(QuantityCounterState((state.counter > 1) ? state.counter - 1 : 1));
}
