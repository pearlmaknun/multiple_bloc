part of 'exam_timer_bloc.dart';

abstract class ExamTimerEvent extends Equatable {
  const ExamTimerEvent();

  @override
  List<Object> get props => [];
}

class ExamTimerStarted extends ExamTimerEvent {
  final int duration;
  ExamBloc examBloc;
  Ticker ticker;

  ExamTimerStarted(this.duration, this.examBloc, this.ticker);

  @override
  String toString() => "TimerStarted { duration: $duration }";
}

class ExamTimerTicked extends ExamTimerEvent {
  final int duration;

  const ExamTimerTicked(this.duration);

  @override
  List<Object> get props => [duration];

  @override
  String toString() => "TimerTicked { duration: $duration }";
}
