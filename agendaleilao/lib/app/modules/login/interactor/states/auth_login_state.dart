abstract interface class AuthLoginState {}

class StartAuthLoginState implements AuthLoginState {
  const StartAuthLoginState();
}

class SuccessAuthLoginState implements AuthLoginState {
  final String token;
  const SuccessAuthLoginState({required this.token});
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
