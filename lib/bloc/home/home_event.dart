abstract class HomeEvent{

}

class EventLoading extends HomeEvent{}

class EventFilter extends HomeEvent{
  final int status;
  EventFilter(this.status);
}