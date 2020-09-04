part of 'exam_timer_bloc.dart';

abstract class ExamTimerState extends Equatable {
  final int duration;

  const ExamTimerState(this.duration);

  @override
  List<Object> get props => [duration];
}

class ExamTimerInitial extends ExamTimerState {
  ExamTimerInitial({int duration}) : super(duration);
}

class ExamTimerRunInProgress extends ExamTimerState {
  const ExamTimerRunInProgress(int duration) : super(duration);

  @override
  String toString() => 'TimerRunInProgress { duration: $duration }';
}

class ExamTimerRunComplete extends ExamTimerState {
  const ExamTimerRunComplete(int duration) : super(0);
}