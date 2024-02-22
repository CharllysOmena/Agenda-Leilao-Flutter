abstract interface class AuthCadastroState {}

class StartAuthCadastroState implements AuthCadastroState {
  const StartAuthCadastroState();
}

class SuccessAuthCadastroState implements AuthCadastroState {
  const SuccessAuthCadastroState();
}

class SuccessDeleteAuthCadastroState implements AuthCadastroState {
  const SuccessDeleteAuthCadastroState();
}

class ErrorExceptionAuthCadastroState implements AuthCadastroState {
  const ErrorExceptionAuthCadastroState();
}

class LoadingAuthCadastroState implements AuthCadastroState {
  const LoadingAuthCadastroState();
}

class EmptyAuthCadastroState implements AuthCadastroState {
  const EmptyAuthCadastroState();
}
