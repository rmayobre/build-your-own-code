import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'logger.dart';

const _debug = 'Debug';
const _error = 'Error';
const _info = 'Info';
const _verbose = 'Verbose';
const _warning = 'Warning';

final class ConsoleLogger implements Logger {

  const ConsoleLogger({required this.defaultTag,}) 
      : assert(kDebugMode, "Console Logger shouldn't be used in release builds.");
  
  final String defaultTag;

  @override
  void d(String message, {String? tag, Exception? error, StackTrace? stacktrace}) {
    _log(
      level: _debug,
      message: message,
      tag: tag,
      error: error,
      stacktrace: stacktrace,
    );
  }

  @override
  void e(String message, {String? tag, Exception? error, StackTrace? stacktrace}) {
    _log(
      level: _error,
      message: message,
      tag: tag,
      error: error,
      stacktrace: stacktrace,
    );
  }

  @override
  void i(String message, {String? tag, Exception? error, StackTrace? stacktrace}) {
    _log(
      level: _info,
      message: message,
      tag: tag,
      error: error,
      stacktrace: stacktrace,
    );
  }

  @override
  void v(String message, {String? tag, Exception? error, StackTrace? stacktrace}) {
    _log(
      level: _verbose,
      message: message,
      tag: tag,
      error: error,
      stacktrace: stacktrace,
    );
  }

  @override
  void w(String message, {String? tag, Exception? error, StackTrace? stacktrace}) {
    _log(
      level: _warning, 
      message: message, 
      tag: tag, 
      error: error,
      stacktrace: stacktrace,
    );
  }

  void _log({
    required String level,
    required String message,
    String? tag,
    Exception? error,
    StackTrace? stacktrace
  }) {
    final time = DateTime.now();
    final buffer = StringBuffer('[$level]')
      ..write(' ')
      ..write('${time.hour}:')
      ..write('${time.minute}:')
      ..write('${time.second}:')
      ..write('${time.millisecond}')
      ..write(' - ')
      ..write(message);
    log(
      buffer.toString(), 
      time: time, 
      name: tag ?? defaultTag, 
      error: error, 
      stackTrace: stacktrace,
    );
  }
}