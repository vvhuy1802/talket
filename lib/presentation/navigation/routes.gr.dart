// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:talket/domain/model/conversion/conversion_args.dart' as _i7;
import 'package:talket/presentation/module/conversion/conversion_screen.dart'
    as _i1;
import 'package:talket/presentation/module/home/home_screen.dart' as _i2;
import 'package:talket/presentation/module/onboarding/onboarding_screen.dart'
    as _i3;
import 'package:talket/presentation/module/splash/splash_screen.dart' as _i4;

/// generated route for
/// [_i1.ConversionScreen]
class ConversionRoute extends _i5.PageRouteInfo<ConversionRouteArgs> {
  ConversionRoute({
    _i6.Key? key,
    required _i7.ConversionArgs args,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ConversionRoute.name,
          args: ConversionRouteArgs(key: key, args: args),
          initialChildren: children,
        );

  static const String name = 'ConversionRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ConversionRouteArgs>();
      return _i1.ConversionScreen(key: args.key, args: args.args);
    },
  );
}

class ConversionRouteArgs {
  const ConversionRouteArgs({this.key, required this.args});

  final _i6.Key? key;

  final _i7.ConversionArgs args;

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
/// [_i2.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.OnboardingScreen]
class OnboardingRoute extends _i5.PageRouteInfo<void> {
  const OnboardingRoute({List<_i5.PageRouteInfo>? children})
      : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.OnboardingScreen();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute({List<_i5.PageRouteInfo>? children})
      : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}
