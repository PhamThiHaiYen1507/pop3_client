import 'package:laptrinhmang/styles/commons.dart';

final _AppLoggerImp _loggerImp = _AppLoggerImp();

class _AppLoggerImp extends AppLoggerDefine {
  _AppLoggerImp() : super(true);
}

void logD(dynamic message) {
  _loggerImp.logD(message);
}

void logW(dynamic message) {
  _loggerImp.logW(message);
}

void logE(dynamic message, [StackTrace? stackTrace]) {
  _loggerImp.logE(message, stackTrace);
}
