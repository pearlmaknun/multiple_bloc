import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multiplebloc/src/helper/ticker.dart';

part 'session_timer_event.dart';
part 'session_timer_state.dart';

class SessionTimerBloc extends Bloc<SessionTimerEvent, SessionTimerState> {
  Ticker _ticker;

  StreamSubscription<int> _tickerSubscription;

  SessionTimerBloc() : super(SessionTimerInitial());

  void onTransition(Transition<SessionTimerEvent, SessionTimerState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<SessionTimerState> mapEventToState(
    SessionTimerEvent event,
  ) async* {
    if (event is SessionTimerStarted) {
      yield* _mapTimerStartedToState(event);
    } else if (event is SessionTimerTicked) {
      yield* _mapTimerTickedToState(event);
    }
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Stream<SessionTimerState> _mapTimerStartedToState(SessionTimerStarted event) async* {
    _ticker = event.ticker;
    yield SessionTimerRunInProgress(event.duration);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(SessionTimerTicked(duration)));
  }

  Stream<SessionTimerState> _mapTimerTickedToState(SessionTimerTicked event) async* {
    yield event.duration > 0
        ? SessionTimerRunInProgress(event.duration)
        : SessionTimerRunComplete(0);
  }
}
