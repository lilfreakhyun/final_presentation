import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:gilog_notion/labelOverrides.dart';
import 'package:gilog_notion/gilogpage.dart';
import 'package:flutterfire_ui/i10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        FlutterFireUILocalizations.withDefaultOverrides(const LabelOverrides()),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        FlutterFireUILocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.yellow, backgroundColor: Colors.white),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //비로그인 상태일때
          if (!snapshot.hasData) {
            return SignInScreen(
              // showAuthActionSwitch: false,
              headerBuilder: (context, constraints, _) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset("assets/penswhite.png"),
                  ),
                );
              },
              subtitleBuilder: (context, action) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    action == AuthAction.signIn
                        ? '만나서 반가워요 기로기! 3초 회원가입으로 \n소중한 일상을 함께 기-록해봐요!'
                        : '비밀번호는 6글자 이상으로 설정해주세요! \n\n회원가입 진행 중 어려움이 있으시다면 \n기-록 카카오톡 채널로 문의해주세요 :) ',
                  ),
                );
              },

              providerConfigs: [
                EmailProviderConfiguration(),
              ],
            );
            //로그인 상태일때
          } else {
            return MyCustomForm();
          }
        });
  }
}
