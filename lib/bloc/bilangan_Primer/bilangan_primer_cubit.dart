import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'bilangan_primer_state.dart';

class BilanganPrimerCubit extends Cubit<BilanganPrimerState> {
  BilanganPrimerCubit() : super(BilanganPrimerInitial());

  // Method to check if a number is prime
  void cekBilanganPrima(int number) {
    if (number <= 1) {
      emit(BilanganBukanPrima(number)); // Emit state if not prime
      return;
    }

    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) {
        emit(BilanganBukanPrima(number)); // Not prime
        return;
      }
    }

    emit(BilanganPrima(number)); // Prime number
  }
}
