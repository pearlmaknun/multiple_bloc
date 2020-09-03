part of 'exam_bloc.dart';

abstract class ExamState extends Equatable {
  const ExamState();
}

class ExamInitial extends ExamState {
  @override
  List<Object> get props => [];
}

class UjianShowed extends ExamState {
  final List<Session> list;

  const UjianShowed(this.list);

  @override
  List<Object> get props => [];
}
