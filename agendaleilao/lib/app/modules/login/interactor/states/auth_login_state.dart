abstract interface class AuthLoginState {}

class StartAuthLoginState implements AuthLoginState {
  const StartAuthLoginState();
}

class SuccessAuthLoginState implements AuthLoginState {
  const SuccessAuthLoginState();
}

class ErrorExceptionAuthLoginState implements AuthLoginState {
  const ErrorExceptionAuthLoginState();
}

class LoadingAuthLoginState implements AuthLoginState {
  const LoadingAuthLoginState();
}

class EmptyAuthLoginState implements AuthLoginState {
  const EmptyAuthLoginState();
}
