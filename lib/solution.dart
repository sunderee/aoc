import 'dart:async';

abstract interface class Solution<F extends Object, S extends Object> {
  FutureOr<F> first(String input, {bool inTestMode = false});
  FutureOr<S> second(String input, {bool inTestMode = false});
}
