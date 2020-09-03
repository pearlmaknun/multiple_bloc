part of 'exam_bloc.dart';

abstract class ExamEvent extends Equatable {
  const ExamEvent();

  @override
  List<Object> get props => [];
}

class GetUjian extends ExamEvent {
  ExamTimerBloc examTimerBloc;
  SessionTimerBloc sessionTimerBloc;
  ExamBloc examBloc;
  Ticker ticker;

  GetUjian(this.examTimerBloc, this.sessionTimerBloc, this.examBloc, this.ticker);
}

class ShowUjian extends ExamEvent {
  const ShowUjian();
}