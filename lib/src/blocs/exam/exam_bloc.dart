import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multiplebloc/src/blocs/timer_exam/exam_timer_bloc.dart';
import 'package:multiplebloc/src/blocs/timer_session/session_timer_bloc.dart';
import 'package:multiplebloc/src/helper/ticker.dart';
import 'package:multiplebloc/src/models/question_model.dart';
import 'package:multiplebloc/src/models/session_model.dart';

part 'exam_event.dart';
part 'exam_state.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  List<Session> _list;
  ExamBloc() : super(ExamInitial());

  @override
  void onTransition(Transition<ExamEvent, ExamState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<ExamState> mapEventToState(
    ExamEvent event,
  ) async* {
    if (event is GetUjian) {
      yield* _mapGetUjianToState(event);
    } else if (event is ShowUjian) {
      yield* _mapShowUjianToState(event);
    }
  }

  Stream<ExamState> _mapGetUjianToState(GetUjian state) async* {
    _list = getExam();
    state.examTimerBloc.add(ExamTimerStarted(360, state.examBloc, state.ticker));
    yield UjianShowed(_list);
    //yield GotUjian(_list);
  }

  Stream<ExamState> _mapShowUjianToState(ShowUjian state) async* {
    yield UjianShowed(_list);
  }
}

getExam() => [
  new Session("Pilihan Ganda", [new Question(1, "Pelangi tercipta dari warna..."), new Question(2, "Salah satu warna yang dihasilkan pelangi adalah...")], 120),
  new Session("Isian Singkat", [new Question(1, "Sebutkan warna pertama pada pelangi..."), new Question(2, "Berapa warna yang dihasilkan pelangi...")], 120),
  new Session("Uraian", [new Question(1, "Jelaskan proses terciptanya pelangi?"), new Question(2, "Sebutkan 7 warna yang dihasilkan pelangi...")], 120)
];
