// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignupState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function(String confirmationMessage) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function(String confirmationMessage)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function(String confirmationMessage)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignupInitialState value) initial,
    required TResult Function(SignupLoadingState value) loading,
    required TResult Function(SignupErrorState value) error,
    required TResult Function(SignupSuccessState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignupInitialState value)? initial,
    TResult? Function(SignupLoadingState value)? loading,
    TResult? Function(SignupErrorState value)? error,
    TResult? Function(SignupSuccessState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignupInitialState value)? initial,
    TResult Function(SignupLoadingState value)? loading,
    TResult Function(SignupErrorState value)? error,
    TResult Function(SignupSuccessState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupStateCopyWith<$Res> {
  factory $SignupStateCopyWith(
          SignupState value, $Res Function(SignupState) then) =
      _$SignupStateCopyWithImpl<$Res, SignupState>;
}

/// @nodoc
class _$SignupStateCopyWithImpl<$Res, $Val extends SignupState>
    implements $SignupStateCopyWith<$Res> {
  _$SignupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignupInitialStateImplCopyWith<$Res> {
  factory _$$SignupInitialStateImplCopyWith(_$SignupInitialStateImpl value,
          $Res Function(_$SignupInitialStateImpl) then) =
      __$$SignupInitialStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignupInitialStateImplCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$SignupInitialStateImpl>
    implements _$$SignupInitialStateImplCopyWith<$Res> {
  __$$SignupInitialStateImplCopyWithImpl(_$SignupInitialStateImpl _value,
      $Res Function(_$SignupInitialStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignupInitialStateImpl implements _SignupInitialState {
  const _$SignupInitialStateImpl();

  @override
  String toString() {
    return 'SignupState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignupInitialStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function(String confirmationMessage) success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function(String confirmationMessage)? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function(String confirmationMessage)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignupInitialState value) initial,
    required TResult Function(SignupLoadingState value) loading,
    required TResult Function(SignupErrorState value) error,
    required TResult Function(SignupSuccessState value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignupInitialState value)? initial,
    TResult? Function(SignupLoadingState value)? loading,
    TResult? Function(SignupErrorState value)? error,
    TResult? Function(SignupSuccessState value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignupInitialState value)? initial,
    TResult Function(SignupLoadingState value)? loading,
    TResult Function(SignupErrorState value)? error,
    TResult Function(SignupSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SignupInitialState implements SignupState {
  const factory _SignupInitialState() = _$SignupInitialStateImpl;
}

/// @nodoc
abstract class _$$SignupLoadingStateImplCopyWith<$Res> {
  factory _$$SignupLoadingStateImplCopyWith(_$SignupLoadingStateImpl value,
          $Res Function(_$SignupLoadingStateImpl) then) =
      __$$SignupLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignupLoadingStateImplCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$SignupLoadingStateImpl>
    implements _$$SignupLoadingStateImplCopyWith<$Res> {
  __$$SignupLoadingStateImplCopyWithImpl(_$SignupLoadingStateImpl _value,
      $Res Function(_$SignupLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignupLoadingStateImpl implements SignupLoadingState {
  const _$SignupLoadingStateImpl();

  @override
  String toString() {
    return 'SignupState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignupLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function(String confirmationMessage) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function(String confirmationMessage)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function(String confirmationMessage)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignupInitialState value) initial,
    required TResult Function(SignupLoadingState value) loading,
    required TResult Function(SignupErrorState value) error,
    required TResult Function(SignupSuccessState value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignupInitialState value)? initial,
    TResult? Function(SignupLoadingState value)? loading,
    TResult? Function(SignupErrorState value)? error,
    TResult? Function(SignupSuccessState value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignupInitialState value)? initial,
    TResult Function(SignupLoadingState value)? loading,
    TResult Function(SignupErrorState value)? error,
    TResult Function(SignupSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class SignupLoadingState implements SignupState {
  const factory SignupLoadingState() = _$SignupLoadingStateImpl;
}

/// @nodoc
abstract class _$$SignupErrorStateImplCopyWith<$Res> {
  factory _$$SignupErrorStateImplCopyWith(_$SignupErrorStateImpl value,
          $Res Function(_$SignupErrorStateImpl) then) =
      __$$SignupErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiErrorModel apiErrorModel});
}

/// @nodoc
class __$$SignupErrorStateImplCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$SignupErrorStateImpl>
    implements _$$SignupErrorStateImplCopyWith<$Res> {
  __$$SignupErrorStateImplCopyWithImpl(_$SignupErrorStateImpl _value,
      $Res Function(_$SignupErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiErrorModel = null,
  }) {
    return _then(_$SignupErrorStateImpl(
      null == apiErrorModel
          ? _value.apiErrorModel
          : apiErrorModel // ignore: cast_nullable_to_non_nullable
              as ApiErrorModel,
    ));
  }
}

/// @nodoc

class _$SignupErrorStateImpl implements SignupErrorState {
  const _$SignupErrorStateImpl(this.apiErrorModel);

  @override
  final ApiErrorModel apiErrorModel;

  @override
  String toString() {
    return 'SignupState.error(apiErrorModel: $apiErrorModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupErrorStateImpl &&
            (identical(other.apiErrorModel, apiErrorModel) ||
                other.apiErrorModel == apiErrorModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiErrorModel);

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupErrorStateImplCopyWith<_$SignupErrorStateImpl> get copyWith =>
      __$$SignupErrorStateImplCopyWithImpl<_$SignupErrorStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function(String confirmationMessage) success,
  }) {
    return error(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function(String confirmationMessage)? success,
  }) {
    return error?.call(apiErrorModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function(String confirmationMessage)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(apiErrorModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignupInitialState value) initial,
    required TResult Function(SignupLoadingState value) loading,
    required TResult Function(SignupErrorState value) error,
    required TResult Function(SignupSuccessState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignupInitialState value)? initial,
    TResult? Function(SignupLoadingState value)? loading,
    TResult? Function(SignupErrorState value)? error,
    TResult? Function(SignupSuccessState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignupInitialState value)? initial,
    TResult Function(SignupLoadingState value)? loading,
    TResult Function(SignupErrorState value)? error,
    TResult Function(SignupSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class SignupErrorState implements SignupState {
  const factory SignupErrorState(final ApiErrorModel apiErrorModel) =
      _$SignupErrorStateImpl;

  ApiErrorModel get apiErrorModel;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupErrorStateImplCopyWith<_$SignupErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignupSuccessStateImplCopyWith<$Res> {
  factory _$$SignupSuccessStateImplCopyWith(_$SignupSuccessStateImpl value,
          $Res Function(_$SignupSuccessStateImpl) then) =
      __$$SignupSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String confirmationMessage});
}

/// @nodoc
class __$$SignupSuccessStateImplCopyWithImpl<$Res>
    extends _$SignupStateCopyWithImpl<$Res, _$SignupSuccessStateImpl>
    implements _$$SignupSuccessStateImplCopyWith<$Res> {
  __$$SignupSuccessStateImplCopyWithImpl(_$SignupSuccessStateImpl _value,
      $Res Function(_$SignupSuccessStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? confirmationMessage = null,
  }) {
    return _then(_$SignupSuccessStateImpl(
      null == confirmationMessage
          ? _value.confirmationMessage
          : confirmationMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SignupSuccessStateImpl implements SignupSuccessState {
  const _$SignupSuccessStateImpl(this.confirmationMessage);

  @override
  final String confirmationMessage;

  @override
  String toString() {
    return 'SignupState.success(confirmationMessage: $confirmationMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupSuccessStateImpl &&
            (identical(other.confirmationMessage, confirmationMessage) ||
                other.confirmationMessage == confirmationMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, confirmationMessage);

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupSuccessStateImplCopyWith<_$SignupSuccessStateImpl> get copyWith =>
      __$$SignupSuccessStateImplCopyWithImpl<_$SignupSuccessStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(ApiErrorModel apiErrorModel) error,
    required TResult Function(String confirmationMessage) success,
  }) {
    return success(confirmationMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(ApiErrorModel apiErrorModel)? error,
    TResult? Function(String confirmationMessage)? success,
  }) {
    return success?.call(confirmationMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(ApiErrorModel apiErrorModel)? error,
    TResult Function(String confirmationMessage)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(confirmationMessage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignupInitialState value) initial,
    required TResult Function(SignupLoadingState value) loading,
    required TResult Function(SignupErrorState value) error,
    required TResult Function(SignupSuccessState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignupInitialState value)? initial,
    TResult? Function(SignupLoadingState value)? loading,
    TResult? Function(SignupErrorState value)? error,
    TResult? Function(SignupSuccessState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignupInitialState value)? initial,
    TResult Function(SignupLoadingState value)? loading,
    TResult Function(SignupErrorState value)? error,
    TResult Function(SignupSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class SignupSuccessState implements SignupState {
  const factory SignupSuccessState(final String confirmationMessage) =
      _$SignupSuccessStateImpl;

  String get confirmationMessage;

  /// Create a copy of SignupState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignupSuccessStateImplCopyWith<_$SignupSuccessStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
