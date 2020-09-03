part of 'session_timer_bloc.dart';

abstract class SessionTimerState extends Equatable {
  final int duration;

  const SessionTimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class SessionTimerInitial extends SessionTimerState {
  SessionTimerInitial({int duration}) : super(duration);
}

class SessionTimerRunInProgress extends SessionTimerState {

  const SessionTimerRunInProgress(int duration) : super(duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

class SessionTimerRunComplete extends SessionTimerState {
  const SessionTimerRunComplete(int duration) : super(0);
}