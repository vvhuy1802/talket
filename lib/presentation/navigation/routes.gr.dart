// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:talket/domain/model/conversion/conversion_args.dart' as _i8;
import 'package:talket/presentation/module/conversion/conversion_screen.dart'
    as _i1;
import 'package:talket/presentation/module/demo_login/demo_login.dart' as _i2;
import 'package:talket/presentation/module/home/home_screen.dart' as _i3;
import 'package:talket/presentation/module/onboarding/onboarding_screen.dart'
    as _i4;
import 'package:talket/presentation/module/splash/splash_screen.dart' as _i5;

/// generated route for
/// [_i1.ConversionScreen]
class ConversionRoute extends _i6.PageRouteInfo<ConversionRouteArgs> {
  ConversionRoute({
    _i7.Key? key,
    required _i8.ConversionArgs args,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ConversionRoute.name,
          args: ConversionRouteArgs(key: key, args: args),
          initialChildren: children,
        );

  static const String name = 'ConversionRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ConversionRouteArgs>();
      return _i1.ConversionScreen(key: args.key, args: args.args);
    },
  );
}

class ConversionRouteArgs {
  const ConversionRouteArgs({this.key, required this.args});

  final _i7.Key? key;

  final _i8.ConversionArgs args;

  @override
  String toString() {
    return 'ConversionRouteArgs{key: $key, args: $args}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ConversionRouteArgs) return false;
    return key == other.key && args == other.args;
  }

  @override
  int get hashCode => key.hashCode ^ args.hashCode;
}

/// generated route for
/// [_i2.DemoLogin]
class DemoLogin extends _i6.PageRouteInfo<void> {
  const DemoLogin({List<_i6.PageRouteInfo>? children})
      : super(DemoLogin.name, initialChildren: children);

  static const String name = 'DemoLogin';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.DemoLogin();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.OnboardingScreen]
class OnboardingRoute extends _i6.PageRouteInfo<void> {
  const OnboardingRoute({List<_i6.PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i5.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i5.SplashScreen();
    },
  );
}
