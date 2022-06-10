import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';



void main() => runApp(
    MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home:MyApp())
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : 'GI-log',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}


class _MyCustomFormState extends State<MyCustomForm> {

  String _url = '';
  String https = 'https://';
  //textfield data 받아오기
  TextEditingController _textStream = TextEditingController();

  void _printTextEdit(){
    //컨트롤러의 text 프로퍼티로 연결된 textfield에 입력된 값을 얻는다.
    print('text : ${_textStream.text}');
  }



  @override
  void initState(){
    super.initState();
    //addListener로 상태를 모니터링
    _textStream.addListener(_printTextEdit);
  }

  @override
  void dispose(){
    //화면에서 종료될 때 반드시 위젯 트리에서 컨트롤러 해제
    _textStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GI-log'),
        centerTitle: true,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.home),
              title:Text('기-록은 어떤 서비스인가요?'),
              onTap: () async {
                const url= 'https://aspiring-fountain-cad.notion.site/8b54b902c4514ba5ab5844d186b6906f';
                if (await canLaunch(url)) {
                  launch(url);
                } else {
                  // ignore: avoid_print
                  print("Can't launch $url");
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title:Text('기-록 서비스 신청하기'),
              onTap: () async {
                const url= 'https://forms.gle/XmCHj6M7YpyBeVhQ6';
                if (await canLaunch(url)) {
                  launch(url);
                } else {
                  // ignore: avoid_print
                  print("Can't launch $url");
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer),
              title:Text('카카오톡 플러스 친구 바로가기'),
              onTap: () async{
                const url= 'http://pf.kakao.com/_tXvrb';
                if (await canLaunch(url)) {
                  launch(url);
                } else {
                  // ignore: avoid_print
                  print("Can't launch $url");
                }
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding : const EdgeInsets.all(15.0),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child : SingleChildScrollView(
            child : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/pens.jpeg", width:400),
                TextField(
                  onChanged: (text){
                    setState(() {
                      _url = text;
                    });
                  },
                decoration: InputDecoration(
                    labelText: '기록상자 코드를 입력해주세요.',
                    hintText: '카카오톡 채널로 기록상자 코드를 받아보세요!',
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(width: 1, color: Colors.black),
                    ),
                  ),
                ),

                ElevatedButton(
                    onPressed: () async{
                    if (await canLaunch(https+_url)) {
                      launch(https+_url);
                    } else {
                      // ignore: avoid_print
                      print("Can't launch $https+_url");
                    }
                  }, child: const Text('나의 기록상자 열어보기',),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
