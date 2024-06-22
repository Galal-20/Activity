// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Forget Password`
  String get forgetPassword {
    return Intl.message(
      'Forget Password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginButtonText {
    return Intl.message(
      'Login',
      name: 'loginButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Sing Up`
  String get signUpButtonText {
    return Intl.message(
      'Sing Up',
      name: 'signUpButtonText',
      desc: '',
      args: [],
    );
  }

  /// `Create an account? `
  String get createAnAccount {
    return Intl.message(
      'Create an account? ',
      name: 'createAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Do you have an account? `
  String get doYouHaveAnAccount {
    return Intl.message(
      'Do you have an account? ',
      name: 'doYouHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpText {
    return Intl.message(
      'Sign Up',
      name: 'signUpText',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Email and we will send you a password reset link.`
  String get titlePass {
    return Intl.message(
      'Enter your Email and we will send you a password reset link.',
      name: 'titlePass',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get hintEmail {
    return Intl.message(
      'Email',
      name: 'hintEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get hintPassword {
    return Intl.message(
      'Password',
      name: 'hintPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get hintConfirmPass {
    return Intl.message(
      'Confirm Password',
      name: 'hintConfirmPass',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `User Name`
  String get userName {
    return Intl.message(
      'User Name',
      name: 'userName',
      desc: '',
      args: [],
    );
  }

  /// `Activities`
  String get titleBar {
    return Intl.message(
      'Activities',
      name: 'titleBar',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get titleTask {
    return Intl.message(
      'Title',
      name: 'titleTask',
      desc: '',
      args: [],
    );
  }

  /// `description`
  String get description {
    return Intl.message(
      'description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Add Tasks`
  String get addTasks {
    return Intl.message(
      'Add Tasks',
      name: 'addTasks',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get titleEdit {
    return Intl.message(
      'Title',
      name: 'titleEdit',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get desEdit {
    return Intl.message(
      'Description',
      name: 'desEdit',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get addButton {
    return Intl.message(
      'Add',
      name: 'addButton',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasksBar {
    return Intl.message(
      'Tasks',
      name: 'tasksBar',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settingsBar {
    return Intl.message(
      'Settings',
      name: 'settingsBar',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get lang {
    return Intl.message(
      'Language',
      name: 'lang',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Mode`
  String get mode {
    return Intl.message(
      'Mode',
      name: 'mode',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get system {
    return Intl.message(
      'System',
      name: 'system',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Enter your valid Email`
  String get validEmail {
    return Intl.message(
      'Enter your valid Email',
      name: 'validEmail',
      desc: '',
      args: [],
    );
  }

  /// `Not valid password`
  String get notValidPassword {
    return Intl.message(
      'Not valid password',
      name: 'notValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your valid Full name`
  String get enterValidFullName {
    return Intl.message(
      'Enter your valid Full name',
      name: 'enterValidFullName',
      desc: '',
      args: [],
    );
  }

  /// `Not valid Full name`
  String get notValidFullName {
    return Intl.message(
      'Not valid Full name',
      name: 'notValidFullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your valid User name`
  String get enterValidUserName {
    return Intl.message(
      'Enter your valid User name',
      name: 'enterValidUserName',
      desc: '',
      args: [],
    );
  }

  /// `Not valid User name`
  String get notValidUserName {
    return Intl.message(
      'Not valid User name',
      name: 'notValidUserName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your valid email`
  String get enterValidEmail {
    return Intl.message(
      'Enter your valid email',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Not valid email`
  String get notValidEmail {
    return Intl.message(
      'Not valid email',
      name: 'notValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Email not match`
  String get emailNotMatch {
    return Intl.message(
      'Email not match',
      name: 'emailNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Enter your valid password`
  String get enterValidPassword {
    return Intl.message(
      'Enter your valid password',
      name: 'enterValidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your valid Confirm Password`
  String get enterValidConfirmPassword {
    return Intl.message(
      'Enter your valid Confirm Password',
      name: 'enterValidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Not valid Confirm Password`
  String get notValidConfirmPassword {
    return Intl.message(
      'Not valid Confirm Password',
      name: 'notValidConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password not matching`
  String get passwordNotMatching {
    return Intl.message(
      'Password not matching',
      name: 'passwordNotMatching',
      desc: '',
      args: [],
    );
  }

  /// `Password reset link sent!`
  String get passwordResetLinkSent {
    return Intl.message(
      'Password reset link sent!',
      name: 'passwordResetLinkSent',
      desc: '',
      args: [],
    );
  }

  /// `Congratulation`
  String get congratulation {
    return Intl.message(
      'Congratulation',
      name: 'congratulation',
      desc: '',
      args: [],
    );
  }

  /// `Empty value`
  String get emptyValue {
    return Intl.message(
      'Empty value',
      name: 'emptyValue',
      desc: '',
      args: [],
    );
  }

  /// `Sorry`
  String get sorry {
    return Intl.message(
      'Sorry',
      name: 'sorry',
      desc: '',
      args: [],
    );
  }

  /// `Sign in success`
  String get signInSuccess {
    return Intl.message(
      'Sign in success',
      name: 'signInSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sign up success`
  String get signUpSuccess {
    return Intl.message(
      'Sign up success',
      name: 'signUpSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sign out success`
  String get signOutSuccess {
    return Intl.message(
      'Sign out success',
      name: 'signOutSuccess',
      desc: '',
      args: [],
    );
  }

  /// `The email address is badly formatted`
  String get emailBadlyFormatted {
    return Intl.message(
      'The email address is badly formatted',
      name: 'emailBadlyFormatted',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
