
abstract class SigninEvent{}

class signinTextchangedevent extends SigninEvent{
final String email;
final String password;

  signinTextchangedevent(this.email, this.password);
}

class SIgninSubmittedevent extends SigninEvent{
  final String email;
  final String password;

  SIgninSubmittedevent(this.email, this.password);
}