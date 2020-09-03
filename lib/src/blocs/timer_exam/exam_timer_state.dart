part of 'exam_timer_bloc.dart';

abstract class ExamTimerState extends Equatable {
  const ExamTimerState();
}

class ExamTimerInitial extends ExamTimerState {
  @override
  List<Object> get props => [];
}

class ExamTimerRunInProgress extends ExamTimerState {
  final int duration;

  const ExamTimerRunInProgress(this.duration);

  @override
  // TODO: implement props
  List<Object> get props => [duration];

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

class ExamTimerRunComplete extends ExamTimerState {
  final int duration;

  const ExamTimerRunComplete(this.duration);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
