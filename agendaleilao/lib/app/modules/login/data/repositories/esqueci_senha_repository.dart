import 'package:agendaleilao/app/modules/login/interactor/states/esqueci_senha_state.dart';

import '../datasources/esqueci_senha_datasource.dart';

abstract interface class IEsqueciSenhaRepository {
  Future<EsqueciSenhaState> recuperarSenha(String email);
}

class EsqueciSenhaRepository implements IEsqueciSenhaRepository {
  final IEsqueciSenhaDatasource esqueciSenhaRepository;

  EsqueciSenhaRepository({required this.esqueciSenhaRepository});

  @override
  Future<EsqueciSenhaState> recuperarSenha(String email) async {
    try {
      var response = await esqueciSenhaRepository.recuperarSenha(email);
      return SuccessEsqueciSenhaState();
    } catch (e) {
      return ErrorExceptionEsqueciSenhaState();
    }
  }
}
