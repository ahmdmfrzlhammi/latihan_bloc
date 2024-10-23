part of 'bilangan_primer_cubit.dart';

@immutable
abstract class BilanganPrimerState {}

class BilanganPrimerInitial extends BilanganPrimerState {}

class BilanganPrima extends BilanganPrimerState {
  final int number;
  BilanganPrima(this.number);
}

class BilanganBukanPrima extends BilanganPrimerState {
  final int number;
  BilanganBukanPrima(this.number);
}
