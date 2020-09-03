import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multiplebloc/src/blocs/exam/exam_bloc.dart';
import 'package:multiplebloc/src/helper/ticker.dart';

part 'exam_timer_event.dart';
part 'exam_timer_state.dart';

class ExamTimerBloc extends Bloc<ExamTimerEvent, ExamTimerState> {
  Ticker _ticker;

  StreamSubscription<int> _tickerSubscription;

  ExamTimerBloc() : super(ExamTimerInitial());

  void onTransition(Transition<ExamTimerEvent, ExamTimerState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<ExamTimerState> mapEventToState(
    ExamTimerEvent event,
  ) async* {
    if (event is ExamTimerStarted) {
      yield* _mapTimerStartedToState(event);
    } else if (event is ExamTimerTicked) {
      yield* _mapTimerTickedToState(event);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Stream<ExamTimerState> _mapTimerStartedToState(ExamTimerStarted event) async* {
    _ticker = event.ticker;
    yield ExamTimerRunInProgress(event.duration);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(ExamTimerTicked(duration)));
  }

  Stream<ExamTimerState> _mapTimerTickedToState(ExamTimerTicked event) async* {
    yield event.duration > 0
        ? ExamTimerRunInProgress(event.duration)
        : ExamTimerRunComplete(0);
  }
}
