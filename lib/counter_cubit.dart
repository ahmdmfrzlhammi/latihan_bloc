import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(1); // Start with 1 for multiplication to make sense

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
  
  void multiply(int value) => emit(state * value);
  
  void divide(int value) {
    if (value != 0) {
      emit(state ~/ value); // Integer division
    } else {
      emit(state); // Do nothing to avoid division by zero
    }
  }
}
