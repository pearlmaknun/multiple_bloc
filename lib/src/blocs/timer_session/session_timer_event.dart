part of 'session_timer_bloc.dart';

abstract class SessionTimerEvent extends Equatable {
  const SessionTimerEvent();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SessionTimerStarted extends SessionTimerEvent {
  final int duration;
  Ticker ticker;

  SessionTimerStarted(this.duration, this.ticker);

  @override
  String toString() => "TimerStarted { duration: $duration }";
}

class SessionTimerTicked extends SessionTimerEvent {
  final int duration;

  const SessionTimerTicked(this.duration);

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "TimerTicked { duration: $duration }";
}
