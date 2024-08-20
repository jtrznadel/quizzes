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

  /// `Enter credentials`
  String get signInHeading {
    return Intl.message(
      'Enter credentials',
      name: 'signInHeading',
      desc: '',
      args: [],
    );
  }

  /// `Don''t have an account?`
  String get signInAlreadyHaveAccount {
    return Intl.message(
      'Don\'\'t have an account?',
      name: 'signInAlreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Hello! 👋 Fill out the form to register`
  String get signUpHeading {
    return Intl.message(
      'Hello! 👋 Fill out the form to register',
      name: 'signUpHeading',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get signUpAlreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'signUpAlreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Password reset`
  String get forgotPasswordAppbarTitle {
    return Intl.message(
      'Password reset',
      name: 'forgotPasswordAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPasswordHeading {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPasswordHeading',
      desc: '',
      args: [],
    );
  }

  /// `Don''t worry! It happens. Enter the email address associated with your account.`
  String get forgotPasswordSubheading {
    return Intl.message(
      'Don\'\'t worry! It happens. Enter the email address associated with your account.',
      name: 'forgotPasswordSubheading',
      desc: '',
      args: [],
    );
  }

  /// `E-mail`
  String get forgotPasswordInputLabel {
    return Intl.message(
      'E-mail',
      name: 'forgotPasswordInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `Your e-mail`
  String get forgotPasswordInputHint {
    return Intl.message(
      'Your e-mail',
      name: 'forgotPasswordInputHint',
      desc: '',
      args: [],
    );
  }

  /// `Send e-mail`
  String get forgotPasswordButton {
    return Intl.message(
      'Send e-mail',
      name: 'forgotPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `E-mail sent`
  String get successfulPasswordResetRequestHeading {
    return Intl.message(
      'E-mail sent',
      name: 'successfulPasswordResetRequestHeading',
      desc: '',
      args: [],
    );
  }

  /// `Check your e-mail, there will be an e-mail with password reset link.`
  String get successfulPasswordResetRequestSubheading {
    return Intl.message(
      'Check your e-mail, there will be an e-mail with password reset link.',
      name: 'successfulPasswordResetRequestSubheading',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get successfulPasswordResetRequestButton {
    return Intl.message(
      'Back',
      name: 'successfulPasswordResetRequestButton',
      desc: '',
      args: [],
    );
  }

  /// `Password reset`
  String get newPasswordAppbarTitle {
    return Intl.message(
      'Password reset',
      name: 'newPasswordAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPasswordHeading {
    return Intl.message(
      'New password',
      name: 'newPasswordHeading',
      desc: '',
      args: [],
    );
  }

  /// `This new password must be unique to those previously used.`
  String get newPasswordSubheading {
    return Intl.message(
      'This new password must be unique to those previously used.',
      name: 'newPasswordSubheading',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get newPasswordInputLabel {
    return Intl.message(
      'New password',
      name: 'newPasswordInputLabel',
      desc: '',
      args: [],
    );
  }

  /// `Your password`
  String get newPasswordInputHint {
    return Intl.message(
      'Your password',
      name: 'newPasswordInputHint',
      desc: '',
      args: [],
    );
  }

  /// `Save and login`
  String get newPasswordButton {
    return Intl.message(
      'Save and login',
      name: 'newPasswordButton',
      desc: '',
      args: [],
    );
  }

  /// `Title: `
  String get quizzSummaryTitle {
    return Intl.message(
      'Title: ',
      name: 'quizzSummaryTitle',
      desc: '',
      args: [],
    );
  }

  /// `Text prompt`
  String get quizzCreationTextPromptHeading {
    return Intl.message(
      'Text prompt',
      name: 'quizzCreationTextPromptHeading',
      desc: '',
      args: [],
    );
  }

  /// `Here, you can create quizz based on your prompt.`
  String get quizzCreationTextPromptSubheading {
    return Intl.message(
      'Here, you can create quizz based on your prompt.',
      name: 'quizzCreationTextPromptSubheading',
      desc: '',
      args: [],
    );
  }

  /// `Upload file`
  String get quizzCreationUploadFile {
    return Intl.message(
      'Upload file',
      name: 'quizzCreationUploadFile',
      desc: '',
      args: [],
    );
  }

  /// `Prompt`
  String get quizzCreationTextPromptTextAreaLabel {
    return Intl.message(
      'Prompt',
      name: 'quizzCreationTextPromptTextAreaLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your prompt`
  String get quizzCreationTextPromptTextAreaHint {
    return Intl.message(
      'Enter your prompt',
      name: 'quizzCreationTextPromptTextAreaHint',
      desc: '',
      args: [],
    );
  }

  /// `Configure quizz`
  String get quizzCreationConfigureHeading {
    return Intl.message(
      'Configure quizz',
      name: 'quizzCreationConfigureHeading',
      desc: '',
      args: [],
    );
  }

  /// `Here, you can create quizz based on your prompt.`
  String get quizzCraetionConfigureSubheading {
    return Intl.message(
      'Here, you can create quizz based on your prompt.',
      name: 'quizzCraetionConfigureSubheading',
      desc: '',
      args: [],
    );
  }

  /// `What type of questions?`
  String get quizzCreationConfigureTypeQuestion {
    return Intl.message(
      'What type of questions?',
      name: 'quizzCreationConfigureTypeQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Multiple choice`
  String get quizzCreationConfigureType1 {
    return Intl.message(
      'Multiple choice',
      name: 'quizzCreationConfigureType1',
      desc: '',
      args: [],
    );
  }

  /// `True/False`
  String get quizzCreationConfigureType2 {
    return Intl.message(
      'True/False',
      name: 'quizzCreationConfigureType2',
      desc: '',
      args: [],
    );
  }

  /// `Fill in the blank`
  String get quizzCreationConfigureType3 {
    return Intl.message(
      'Fill in the blank',
      name: 'quizzCreationConfigureType3',
      desc: '',
      args: [],
    );
  }

  /// `How many questions?`
  String get quizzCreationConfigureQuestionCount {
    return Intl.message(
      'How many questions?',
      name: 'quizzCreationConfigureQuestionCount',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get quizzCreationConfigureQuestionCount1 {
    return Intl.message(
      'Low',
      name: 'quizzCreationConfigureQuestionCount1',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get quizzCreationConfigureQuestionCount2 {
    return Intl.message(
      'Medium',
      name: 'quizzCreationConfigureQuestionCount2',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get quizzCreationConfigureQuestionCount3 {
    return Intl.message(
      'High',
      name: 'quizzCreationConfigureQuestionCount3',
      desc: '',
      args: [],
    );
  }

  /// `Manual`
  String get quizzCreationConfigureQuestionCount4 {
    return Intl.message(
      'Manual',
      name: 'quizzCreationConfigureQuestionCount4',
      desc: '',
      args: [],
    );
  }

  /// `Add new question`
  String get addNewQuestionBottomSheetHeading {
    return Intl.message(
      'Add new question',
      name: 'addNewQuestionBottomSheetHeading',
      desc: '',
      args: [],
    );
  }

  /// `Manual`
  String get addNewQuestionBottomSheetManual {
    return Intl.message(
      'Manual',
      name: 'addNewQuestionBottomSheetManual',
      desc: '',
      args: [],
    );
  }

  /// `Generate question with AI`
  String get addNewQuestionBottomSheetAI {
    return Intl.message(
      'Generate question with AI',
      name: 'addNewQuestionBottomSheetAI',
      desc: '',
      args: [],
    );
  }

  /// `Quizz Preview`
  String get quizzCreationPreviewHeading {
    return Intl.message(
      'Quizz Preview',
      name: 'quizzCreationPreviewHeading',
      desc: '',
      args: [],
    );
  }

  /// `Quiz Detail`
  String get quizzDetailsAppbarTitle {
    return Intl.message(
      'Quiz Detail',
      name: 'quizzDetailsAppbarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Questions`
  String get quizzDetailsTabQuestions {
    return Intl.message(
      'Questions',
      name: 'quizzDetailsTabQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get quizzDetailsTabSettings {
    return Intl.message(
      'Settings',
      name: 'quizzDetailsTabSettings',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get quizzDetailsTabStatistics {
    return Intl.message(
      'Statistics',
      name: 'quizzDetailsTabStatistics',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get quizzDetailsTabGeneral {
    return Intl.message(
      'General',
      name: 'quizzDetailsTabGeneral',
      desc: '',
      args: [],
    );
  }

  /// `Manage your quiz questions here. You can edit and delete questions. This page is preview page for your questions.`
  String get quizzDetailsTabQuestionsSubheading {
    return Intl.message(
      'Manage your quiz questions here. You can edit and delete questions. This page is preview page for your questions.',
      name: 'quizzDetailsTabQuestionsSubheading',
      desc: '',
      args: [],
    );
  }

  /// `Answers`
  String get quizzDetailsTabQuestionsSwitch {
    return Intl.message(
      'Answers',
      name: 'quizzDetailsTabQuestionsSwitch',
      desc: '',
      args: [],
    );
  }

  /// `New question`
  String get quizzDetailsTabQuestionsAddNewQuestion {
    return Intl.message(
      'New question',
      name: 'quizzDetailsTabQuestionsAddNewQuestion',
      desc: '',
      args: [],
    );
  }

  /// `Manage your quiz settings here.`
  String get quizzDetailsTabSettingsSubheading {
    return Intl.message(
      'Manage your quiz settings here.',
      name: 'quizzDetailsTabSettingsSubheading',
      desc: '',
      args: [],
    );
  }

  /// `Quiz Status`
  String get quizzDetailsTabSettingsQuizStatus {
    return Intl.message(
      'Quiz Status',
      name: 'quizzDetailsTabSettingsQuizStatus',
      desc: '',
      args: [],
    );
  }

  /// `When switched on, quizz is active and available for everyone. If not, no one can access the quizz from the external link.`
  String get quizzDetailsTabSettingsQuizStatusDescription {
    return Intl.message(
      'When switched on, quizz is active and available for everyone. If not, no one can access the quizz from the external link.',
      name: 'quizzDetailsTabSettingsQuizStatusDescription',
      desc: '',
      args: [],
    );
  }

  /// `Availability`
  String get quizzDetailsTabSettingsQuizAvailability {
    return Intl.message(
      'Availability',
      name: 'quizzDetailsTabSettingsQuizAvailability',
      desc: '',
      args: [],
    );
  }

  /// `When switched on, quizz is active and available for everyone. If not, no one can access the quizz from the external link.`
  String get quizzDetailsTabSettingsQuizAvailabilityDescription {
    return Intl.message(
      'When switched on, quizz is active and available for everyone. If not, no one can access the quizz from the external link.',
      name: 'quizzDetailsTabSettingsQuizAvailabilityDescription',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get quizzDetailsTabSettingsQuizAvailabilityActive {
    return Intl.message(
      'Active',
      name: 'quizzDetailsTabSettingsQuizAvailabilityActive',
      desc: '',
      args: [],
    );
  }

  /// `Public`
  String get quizzDetailsTabSettingsQuizAvailabilityPublic {
    return Intl.message(
      'Public',
      name: 'quizzDetailsTabSettingsQuizAvailabilityPublic',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get quizzDetailsTabSettingsSaveChanges {
    return Intl.message(
      'Save changes',
      name: 'quizzDetailsTabSettingsSaveChanges',
      desc: '',
      args: [],
    );
  }

  /// `You can view your quiz statistics here.`
  String get quizzDetailsTabStatisticsSubheading {
    return Intl.message(
      'You can view your quiz statistics here.',
      name: 'quizzDetailsTabStatisticsSubheading',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get quizzDetailsTabStatisticsDetailsStatusBadge {
    return Intl.message(
      'Details',
      name: 'quizzDetailsTabStatisticsDetailsStatusBadge',
      desc: '',
      args: [],
    );
  }

  /// `Finished`
  String get quizzDetailsTabStatisticsFinishedStatusBadge {
    return Intl.message(
      'Finished',
      name: 'quizzDetailsTabStatisticsFinishedStatusBadge',
      desc: '',
      args: [],
    );
  }

  /// `Stopped`
  String get quizzDetailsTabStatisticsStoppedStatusBadge {
    return Intl.message(
      'Stopped',
      name: 'quizzDetailsTabStatisticsStoppedStatusBadge',
      desc: '',
      args: [],
    );
  }

  /// `Score`
  String get quizzDetailsTabStatisticsScore {
    return Intl.message(
      'Score',
      name: 'quizzDetailsTabStatisticsScore',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get quizzDetailsTabStatisticsName {
    return Intl.message(
      'Name',
      name: 'quizzDetailsTabStatisticsName',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get quizzDetailsTabStatisticsDate {
    return Intl.message(
      'Date',
      name: 'quizzDetailsTabStatisticsDate',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get quizzDetailsTabStatisticsTime {
    return Intl.message(
      'Time',
      name: 'quizzDetailsTabStatisticsTime',
      desc: '',
      args: [],
    );
  }

  /// `Duration`
  String get quizzDetailsTabStatisticsEmail {
    return Intl.message(
      'Duration',
      name: 'quizzDetailsTabStatisticsEmail',
      desc: '',
      args: [],
    );
  }

  /// `Manage your quiz page settings here.`
  String get quizzDetailsTabGeneralSubheading {
    return Intl.message(
      'Manage your quiz page settings here.',
      name: 'quizzDetailsTabGeneralSubheading',
      desc: '',
      args: [],
    );
  }

  /// `Quiz page settings`
  String get quizzDetailsTabGeneralPageSettingsHeading {
    return Intl.message(
      'Quiz page settings',
      name: 'quizzDetailsTabGeneralPageSettingsHeading',
      desc: '',
      args: [],
    );
  }

  /// `Quiz title`
  String get quizzDetailsTabGeneralQuizTitle {
    return Intl.message(
      'Quiz title',
      name: 'quizzDetailsTabGeneralQuizTitle',
      desc: '',
      args: [],
    );
  }

  /// `This is you public quiz title. It will be displayed on your quiz page. You can change it anytime.`
  String get quizzDetailsTabGeneralQuizTitleTextFieldDescription {
    return Intl.message(
      'This is you public quiz title. It will be displayed on your quiz page. You can change it anytime.',
      name: 'quizzDetailsTabGeneralQuizTitleTextFieldDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter quiz title`
  String get quizzDetailsTabGeneralQuizTitleHint {
    return Intl.message(
      'Enter quiz title',
      name: 'quizzDetailsTabGeneralQuizTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Quiz description`
  String get quizzDetailsTabGeneralQuizDescription {
    return Intl.message(
      'Quiz description',
      name: 'quizzDetailsTabGeneralQuizDescription',
      desc: '',
      args: [],
    );
  }

  /// `This is your public quiz description. It will be displayed on your quiz page. You can change it anytime.`
  String get quizzDetailsTabGeneralQuizDescriptionTextFieldDescription {
    return Intl.message(
      'This is your public quiz description. It will be displayed on your quiz page. You can change it anytime.',
      name: 'quizzDetailsTabGeneralQuizDescriptionTextFieldDescription',
      desc: '',
      args: [],
    );
  }

  /// `Enter quiz title`
  String get quizzDetailsTabGeneralQuizDescriptionHint {
    return Intl.message(
      'Enter quiz title',
      name: 'quizzDetailsTabGeneralQuizDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure?`
  String get quizzCreationQuitHeading {
    return Intl.message(
      'Are you sure?',
      name: 'quizzCreationQuitHeading',
      desc: '',
      args: [],
    );
  }

  /// `You are about to quit the quiz creation process. Any progress made so far will be lost. This action cannot be undone.`
  String get quizzCreationQuitSubheading {
    return Intl.message(
      'You are about to quit the quiz creation process. Any progress made so far will be lost. This action cannot be undone.',
      name: 'quizzCreationQuitSubheading',
      desc: '',
      args: [],
    );
  }

  /// `Yes, quit`
  String get quizzCreationQuitButton {
    return Intl.message(
      'Yes, quit',
      name: 'quizzCreationQuitButton',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get quizzCreationQuitButtonCancel {
    return Intl.message(
      'Cancel',
      name: 'quizzCreationQuitButtonCancel',
      desc: '',
      args: [],
    );
  }

  /// `New question`
  String get quizzCreationAddQuestionHeading {
    return Intl.message(
      'New question',
      name: 'quizzCreationAddQuestionHeading',
      desc: '',
      args: [],
    );
  }

  /// `Question Title`
  String get quizzCreationAddQuestionTitleLabel {
    return Intl.message(
      'Question Title',
      name: 'quizzCreationAddQuestionTitleLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter question title`
  String get quizzCreationAddQuestionTitleHint {
    return Intl.message(
      'Enter question title',
      name: 'quizzCreationAddQuestionTitleHint',
      desc: '',
      args: [],
    );
  }

  /// `Question Description`
  String get quizzCreationAddQuestionDescriptionLabel {
    return Intl.message(
      'Question Description',
      name: 'quizzCreationAddQuestionDescriptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter question description`
  String get quizzCreationAddQuestionDescriptionHint {
    return Intl.message(
      'Enter question description',
      name: 'quizzCreationAddQuestionDescriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Answers`
  String get quizzCreationAddQuestionAnswersLabel {
    return Intl.message(
      'Answers',
      name: 'quizzCreationAddQuestionAnswersLabel',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get quizzCreationSaveQuestion {
    return Intl.message(
      'Save',
      name: 'quizzCreationSaveQuestion',
      desc: '',
      args: [],
    );
  }

  /// `What is one of the key features of cryptocurrencies?`
  String get quizzCreationAddQuestionAnswerPlaceholder {
    return Intl.message(
      'What is one of the key features of cryptocurrencies?',
      name: 'quizzCreationAddQuestionAnswerPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `Generate new question`
  String get quizzCreationGenerateQuestionHeading {
    return Intl.message(
      'Generate new question',
      name: 'quizzCreationGenerateQuestionHeading',
      desc: '',
      args: [],
    );
  }

  /// `Prompt`
  String get quizzCreationGenerateQuestionPromptLabel {
    return Intl.message(
      'Prompt',
      name: 'quizzCreationGenerateQuestionPromptLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter prompt for AI to generate question`
  String get quizzCreationGenerateQuestionPromptHint {
    return Intl.message(
      'Enter prompt for AI to generate question',
      name: 'quizzCreationGenerateQuestionPromptHint',
      desc: '',
      args: [],
    );
  }

  /// `Generate`
  String get quizzCreationGenerateQuestionGenerateButton {
    return Intl.message(
      'Generate',
      name: 'quizzCreationGenerateQuestionGenerateButton',
      desc: '',
      args: [],
    );
  }

  /// `Success!`
  String get quizzCreationSuccessHeading {
    return Intl.message(
      'Success!',
      name: 'quizzCreationSuccessHeading',
      desc: '',
      args: [],
    );
  }

  /// `You succesfully created your quizz. You can now share it with others.`
  String get quizzCreationSuccessSubheading {
    return Intl.message(
      'You succesfully created your quizz. You can now share it with others.',
      name: 'quizzCreationSuccessSubheading',
      desc: '',
      args: [],
    );
  }

  /// `Share with others!`
  String get quizzCreationSuccessShareButton {
    return Intl.message(
      'Share with others!',
      name: 'quizzCreationSuccessShareButton',
      desc: '',
      args: [],
    );
  }

  /// `Back to dashboard`
  String get quizzCreationSuccessBackButton {
    return Intl.message(
      'Back to dashboard',
      name: 'quizzCreationSuccessBackButton',
      desc: '',
      args: [],
    );
  }

  /// `Quizzes`
  String get dashboardTopHeading {
    return Intl.message(
      'Quizzes',
      name: 'dashboardTopHeading',
      desc: '',
      args: [],
    );
  }

  /// `Here, you can effortlessly list, delete, edit and create new exams.`
  String get dashboardSubheading {
    return Intl.message(
      'Here, you can effortlessly list, delete, edit and create new exams.',
      name: 'dashboardSubheading',
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
      Locale.fromSubtags(languageCode: 'pl'),
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
