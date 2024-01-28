import 'package:bloc/bloc.dart';
import 'package:bloc_code_validation/screens/bloc/signin_event.dart';
import 'package:bloc_code_validation/screens/bloc/signin_state.dart';
import 'package:email_validator/email_validator.dart';

class SigninBloc extends Bloc<SigninEvent,SigninState>{
  SigninBloc(): super(SigninInitializeState()){
  on<signinTextchangedevent>((event, emit) {
    if(EmailValidator.validate(event.email)==false){
      emit(SigninErrorstate("Please enter an valid email address")
      );
    }

    else if(event.password.length<7){
emit (SigninErrorstate("Please enter a valid password"));
  }
  else{
    emit(SigninValidstate());
  }
  });
  on<SIgninSubmittedevent>((event, emit) {
    emit(signinloadingstate());
    
  }
  
  );
  }
  
} 