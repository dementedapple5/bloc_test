
import 'package:bloc_test/src/blocs/base_bloc.dart';
import 'package:bloc_test/src/events/user_events.dart';
import 'package:bloc_test/src/resources/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc implements BaseBloc{

  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _eventController = BehaviorSubject<UserEvent>();
  final _fbUserController = BehaviorSubject<FirebaseUser>();
  final _userRepository = UserRepository();

  FirebaseUser _fbUser;

  Sink<String> get emailIn => _emailController.sink;
  Sink<String> get passwordIn => _passwordController.sink;

  Stream<String> get emailOut => _emailController.stream;
  Stream<String> get passwordOut => _passwordController.stream;

  Stream<FirebaseUser> get fbUserStream => _fbUserController.stream;
  Sink<FirebaseUser> get fbUserSink => _fbUserController.sink;

  FirebaseUser get fbUser => _fbUser;
  
  Sink<UserEvent> get onSubmit => _eventController.sink;

  AuthBloc(){
    _eventController.stream.listen(onUserEvent);
  }


  void onUserEvent(UserEvent event) async {

    if (event is LoginEvent) {
      try {
        fbUserSink.add(await _userRepository.login(_emailController.value, _passwordController.value));

      }catch (e) {
        _passwordController.addError(e);
        _emailController.addError(e);
      }
    }
    else if (event is SignUpEvent) {

      try {
        fbUserSink.add(await _userRepository.signUp(_emailController.value, _passwordController.value));
      }catch(e){
        _passwordController.addError("The password must have at least 6 characters");
        _emailController.addError("The email is not valid");
      }

    }
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _eventController.close();
    _fbUserController.close();
  }


}

final authBloc = AuthBloc();
