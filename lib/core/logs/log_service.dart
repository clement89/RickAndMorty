import 'package:logger/logger.dart';

class LogService {
  final Logger _logger = Logger();

  void logInfo(String message) {
    _logger.i(message);
  }

  void logError(String message) {
    _logger.e(message);
  }
}
