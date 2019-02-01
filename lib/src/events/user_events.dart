
//Parent Event

abstract class UserEvent{}

//Child Events

class LoginEvent extends UserEvent{
  String username;
  String password;

  LoginEvent(this.username, this.password);


}

class SignUpEvent extends UserEvent{

  String username;
  String password;

  SignUpEvent(this.username, this.password);
  
}