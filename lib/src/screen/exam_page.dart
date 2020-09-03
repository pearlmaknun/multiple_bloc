import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplebloc/src/blocs/exam/exam_bloc.dart';
import 'package:multiplebloc/src/blocs/timer_exam/exam_timer_bloc.dart';
import 'package:multiplebloc/src/blocs/timer_session/session_timer_bloc.dart';
import 'package:multiplebloc/src/helper/ticker.dart';

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  final ExamTimerBloc _examTimerBloc = ExamTimerBloc();
  final SessionTimerBloc _sessionTimerBloc = SessionTimerBloc();
  final ExamBloc _examBloc = ExamBloc();

  @override
  void initState() {
    _examBloc
        .add(GetUjian(_examTimerBloc, _sessionTimerBloc, _examBloc, new Ticker(), new Ticker()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider<ExamBloc>(
              create: (context) => _examBloc,
            ),
            BlocProvider<ExamTimerBloc>(
              create: (context) => _examTimerBloc,
            ),
            BlocProvider<SessionTimerBloc>(
              create: (context) => _sessionTimerBloc,
            )
          ],
          child: BlocBuilder<ExamTimerBloc, ExamTimerState>(
            builder: (context, state) {
              if (state is ExamTimerRunInProgress) {
                final String minutesStr = ((state.duration / 60) % 60)
                    .floor()
                    .toString()
                    .padLeft(2, '0');
                final String secondsStr =
                    (state.duration % 60).floor().toString().padLeft(2, '0');
                return Center(
                  child: Column(
                    children: [
                      Text(
                        '$minutesStr:$secondsStr',
                      ),
                      BlocBuilder<SessionTimerBloc, SessionTimerState>(
                        builder: (context, state) {
                          final String sminutesStr = ((state.duration / 60) % 60)
                              .floor()
                              .toString()
                              .padLeft(2, '0');
                          final String ssecondsStr =
                          (state.duration % 60).floor().toString().padLeft(2, '0');
                          return Column(
                            children: [
                              Text(
                                '$sminutesStr:$ssecondsStr',
                              ),
                              BlocBuilder<ExamBloc, ExamState>(
                                builder: (context, state) {
                                  if (state is UjianShowed) {
                                    return Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Text(state.list[0].list[0].soal),
                                    );
                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      )
                      /*BlocBuilder<ExamBloc, ExamState>(
                        builder: (context, state) {
                          if (state is UjianShowed) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(state.list[0].list[0].soal),
                            );
                          } else {
                            return Container();
                          }
                        },
                      )*/
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
