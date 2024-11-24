/// Extensions that can be used on any type [T].
extension ScopeFunctionExt<T> on T {
  /// Calls the specified function [block] with this value as its argument and
  /// returns `this` value.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  T also(void Function(T it) block) {
    block.call(this);
    return this;
  }

  /// Calls the specified function [block] with `this` value as its argument and
  /// returns its result.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  R let<R>(R Function(T it) block) {
    return block.call(this);
  }

  /// Returns `this` value if it satisfies the given [predicament] or null if
  /// it doesn't.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  T? takeIf(bool Function(T it) predicament) {
    return predicament.call(this) ? this : null;
  }

  /// Returns `this` value if it does not satisfy the given [predicament] or
  /// null if it does.
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  T? takeUnless(bool Function(T it) predicament) {
    return predicament.call(this) ? null : this;
  }
}

/// Extensions that can be used on any nullable type [T].
extension ScopeFunctionNullableExt<T> on T? {
  /// Calls the specified function [block] with `this` value as its argument and
  /// returns its result. In case `this` is null, it will return whatever is
  /// provided in [orElse].
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  R letWithElse<R>(R Function(T it) block, {required R orElse}) {
    return this?.let((innerIt) => block.call(innerIt)) ?? orElse;
  }

  /// This extension is used to prevent using `??` (null-coalescing operator)
  /// in favor of a more functional approach. In case the provided value of type
  /// [T] is null, it will return provided [defaultValue].
  @pragma('vm:prefer-inline')
  @pragma('dart2js:tryInline')
  T withDefault(T defaultValue) {
    return this ?? defaultValue;
  }
}

/// Calls the specified function [block] and returns its result.
@pragma('vm:prefer-inline')
@pragma('dart2js:tryInline')
R run<R>(R Function() block) => block.call();
