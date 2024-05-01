import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_nov_trial/router/app_router.dart';
import 'package:flutter_nov_trial/router/app_routes.dart';

mixin BaseNavigator {
  late BuildContext _context;

  set context(BuildContext context) {
    _context = context;
  }

  Future<T?> push<T>(Routes route, {Object? extra}) {
    return _context.push<T>(route.path, extra: extra);
  }

  Future<T?> pushBottomSheet<T>({required WidgetBuilder builder}) {
    return showModalBottomSheet(
      context: _context,
      builder: builder,
    );
  }

  Future<T?> pushModalPopup<T>({required WidgetBuilder builder}) {
    return showCupertinoModalPopup(
      context: _context,
      builder: builder,
    );
  }

  void pop<T extends Object?>([T? result]) {
    return _context.pop<T>(result);
  }
}
