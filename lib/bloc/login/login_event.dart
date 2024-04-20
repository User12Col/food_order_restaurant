abstract class LoginEvent{}

class EventLogin extends LoginEvent{
  final String email;
  final String password;
  EventLogin(this.email, this.password);
}

class EventLogout extends LoginEvent{

}

// class EventLoadUser extends LoginEvent{
//   final String email;
//   final String password;
//   final String token;
//   EventLoadUser(this.email, this.password, this.token);
// }