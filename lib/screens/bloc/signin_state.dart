abstract class SigninState{}

class SigninInitializeState extends SigninState{}
class SigninErrorstate extends SigninState{
  final String errorMessage;

  SigninErrorstate(this.errorMessage);
}
class Signininvalidstate extends SigninState{}
class SigninValidstate extends SigninState{}

class signinloadingstate extends SigninState{}