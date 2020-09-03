import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'session_timer_event.dart';
part 'session_timer_state.dart';

class SessionTimerBloc extends Bloc<SessionTimerEvent, SessionTimerState> {
  SessionTimerBloc() : super(SessionTimerInitial());

  @override
  Stream<SessionTimerState> mapEventToState(
    SessionTimerEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
