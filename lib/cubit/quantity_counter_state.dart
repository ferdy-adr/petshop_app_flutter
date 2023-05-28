part of 'quantity_counter_cubit.dart';

class QuantityCounterState extends Equatable {
  final int counter;

  const QuantityCounterState(this.counter);

  @override
  List<Object> get props => [counter];
}
