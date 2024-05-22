import 'package:flutter/widgets.dart';

typedef ServiceBuilder<T extends Object> = T Function(BuildContext context);
typedef Disposer<T extends Object> = void Function(T service);

sealed class ServiceProvider {

  Type get key;
}

final class Singleton<T extends Object> implements ServiceProvider {

  const Singleton(this.service);

  final T service;

  @override
  Type get key => T;
}

final class LazySingleton<T extends Object> implements ServiceProvider {

  LazySingleton(this._builder);

  final ServiceBuilder<T> _builder;

  @override
  final Type key = T;

  T? _service;

  T create(BuildContext context) {
    return _service ??= _builder(context);
  }
}

final class Factory<T extends Object> implements ServiceProvider {
  Factory({
    required ServiceBuilder<T> create,
    Disposer<T>? dispose,
  }) : _builder = create,
        _disposer = dispose;

  final ServiceBuilder<T> _builder;
  final Disposer<T>? _disposer;

  @override
  final Type key = T;

  T? _service;

  T create(BuildContext context) {
    final service = _service ??= _builder(context);
    if (_disposer != null) {
      WidgetsBinding.instance
          .addPostFrameCallback((timeStamp) => _disposer(service));
    }
    return service;
  }
}