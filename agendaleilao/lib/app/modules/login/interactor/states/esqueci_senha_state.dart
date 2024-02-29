abstract interface class EsqueciSenhaState {}

class StartEsqueciSenhaState implements EsqueciSenhaState {
  const StartEsqueciSenhaState();
}

class SuccessEsqueciSenhaState implements EsqueciSenhaState {
  const SuccessEsqueciSenhaState();
}

class SuccessDeleteEsqueciSenhaState implements EsqueciSenhaState {
  const SuccessDeleteEsqueciSenhaState();
}

class ErrorExceptionEsqueciSenhaState implements EsqueciSenhaState {
  const ErrorExceptionEsqueciSenhaState();
}

class LoadingEsqueciSenhaState implements EsqueciSenhaState {
  const LoadingEsqueciSenhaState();
}

class EmptyEsqueciSenhaState implements EsqueciSenhaState {
  const EmptyEsqueciSenhaState();
}
