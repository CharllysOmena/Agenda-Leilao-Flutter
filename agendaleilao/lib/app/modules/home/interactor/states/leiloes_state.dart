import 'package:agendaleilao/app/modules/home/data/models/leilao.dart';

abstract interface class LeiloesState {}

class StartLeiloesState implements LeiloesState {
  const StartLeiloesState();
}

class SuccessLeiloesState implements LeiloesState {
  List<Leilao> leiloes;
  SuccessLeiloesState({required this.leiloes});
}

class ErrorExceptionLeiloesState implements LeiloesState {
  const ErrorExceptionLeiloesState();
}

class LoadingLeiloesState implements LeiloesState {
  const LoadingLeiloesState();
}

class EmptyLeiloesState implements LeiloesState {
  const EmptyLeiloesState();
}
