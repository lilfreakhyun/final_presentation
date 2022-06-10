import 'package:flutterfire_ui/i10n.dart';

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => '이메일 입력';

  @override
  String get passwordInputLabel => '비밀번호 입력';

  @override
  String get confirmPasswordInputLabel => '비밀번호 재입력';

  @override
  String get signInActionText => '로그인';

  @override
  String get signInText => '로그인';

  @override
  String get registerHintText => '아직 계정이 없으신가요?';

  @override
  String get signInHintText => '이미 계정이 있으신가요?';

  @override
  String get registerText => '가입하기';

  @override
  String get registerActionText => '가입하기';

  @override
  String get wrongOrNoPasswordErrorText => '비밀번호가 일치하지 않습니다. \n비밀번호 찾기를 통해 재설정 하실 수 있습니다!';

  @override
  String get userNotFoundErrorText => '등록된 사용자가 아닙니다. \n가입시 입력한 이메일을 입력해주세요!';

  @override
  String get forgotPasswordButtonLabel => '비밀번호 찾기';

  @override
  String get forgotPasswordHintText => '가입 시 입력한 이메일을 입력해주세요!\n비밀번호 재설정 링크를 보내드릴게요!';

  @override
  String get forgotPasswordViewTitle => '비밀번호 찾기';

  @override
  String get resetPasswordButtonLabel => '비밀번호 재설정하기';

  @override
  String get goBackButtonLabel => '뒤로가기';

  @override
  String get isNotAValidEmailErrorText => '이메일 형식으로 입력해주세요! '; //둘다인듯?

  @override
  String get passwordResetEmailSentText => '이메일을 확인해주세요! \n비밀번호 재설정을 위한 링크가 전송되었습니다!';

  @override
  String get confirmPasswordDoesNotMatchErrorText => '재입력한 비밀번호가 일치하지 않습니다';

  @override
  String get emailIsRequiredErrorText => '이메일 형식으로 입력해주세요';

  @override
  String get passwordIsRequiredErrorText => '비밀번호를 입력해주세요';

  @override
  String get confirmPasswordIsRequiredErrorText  => '비밀번호는 6글자 이상을 입력해주세요';

  @override
  String get signInWithPhoneButtonText  => '핸드폰으로 로그인하기';

//phone 라벨은 고쳐야함
//@override
//String get ??? => '이미 존재하는 계정입니다';
}
