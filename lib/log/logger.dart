abstract interface class Logger {

  /// Verbose level logging
  void v(String message, {
    String? tag,
    Exception? error,
    StackTrace? stacktrace
  });

  /// Information level logging
  void i(String message, {
    String? tag,
    Exception? error,
    StackTrace? stacktrace
  });

  /// Debug level logging.
  void d(String message, {
    String? tag,
    Exception? error,
    StackTrace? stacktrace
  });

  /// Warning level logging
  void w(String message, {
    String? tag,
    Exception? error,
    StackTrace? stacktrace
  });

  /// Error level logging
  void e(String message, {
    String? tag,
    Exception? error,
    StackTrace? stacktrace
  });
}