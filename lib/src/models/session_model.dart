import 'package:multiplebloc/src/models/question_model.dart';

class Session {
  final String sesi;
  final List<Question> list;
  final int waktu;

  const Session(this.sesi, this.list, this.waktu);
}
