import 'dart:async';

import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(guide());
}

class guide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>with AutomaticKeepAliveClientMixin<MyHomePage> {
  int position = 1 ;

  final key = UniqueKey();

  doneLoading(String A) {
    setState(() {
      position = 0;
    });
  }

  startLoading(String A){
    setState(() {
      position = 1;
    });
  }
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {

    return DoubleBack(
      onFirstBackPress: (context) {
        // you can use your custom here
        // change this with your custom action
        final snackBar =
        SnackBar(content: Text('Press back again to exit'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // ---
      },
      child:     RelativeBuilder(builder: (context, height, width, sy, sx) {
        return Scaffold(
          appBar: AppBar(toolbarHeight: 100,
            title: Padding(
                padding: EdgeInsets.fromLTRB(10, 120, 40, 70),
                child: Text('Guide', style: GoogleFonts.openSans(
                    fontSize: sy(27),
                    fontWeight: FontWeight.bold,
                    color: Colors.white),)),
            backgroundColor: Color(0xff0b102d),
            elevation: 0,),

          backgroundColor: Color(0xff0b102d),
          body: IndexedStack(
              index: position,
              children: [
                Builder(builder: (BuildContext context) {
                  return Container(
                    height: 930,
                    child: WebView(
                      key: key,
                      initialUrl: 'https://www.geico.com/living/driving/cycle/motorcycle-safety-guide/',
                      javascriptMode: JavascriptMode.unrestricted,
                      onWebViewCreated: (WebViewController webViewController) {
                        _webViewController = webViewController;
                      },
                      onProgress: (int progress) {

                      },
                      javascriptChannels: <JavascriptChannel>{
                        _toasterJavascriptChannel(context),
                      },

                      onPageStarted: (value) {
                        setState(() {
                          position = 1;
                        });
                      },

                      navigationDelegate: (NavigationRequest request) {
                        if (request.url.startsWith(
                            'https://www.youtube.com/')) {
                          print('blocking navigation to $request}');
                          return NavigationDecision.prevent;
                        }
                        print('allowing navigation to $request');
                        return NavigationDecision.navigate;
                      },
                      onPageFinished: (value) {
                        setState(() {
                          position = 0;
                        });


                        _webViewController
                            .evaluateJavascript("javascript:(function() { " +

                            "document.getElementsByClassName('bottom-bar')[0].style.display='none'; " +
                            "document.getElementsByClassName('share-icons-bottom')[0].style.display='none'; " +
                            "document.getElementsByClassName('entry-comments')[0].style.display='none'; " +
                            "document.getElementsByClassName('                  bg-color--foggy')[0].style.display='none'; " +
                            "document.getElementsByTagName('h1')[0].style.display='none'; " +
                            "document.getElementsByClassName('social_icon')[0].style.display='none'; " +

                            "document.getElementsByTagName('header')[0].style.display='none'; " +
                            "document.getElementsByClassName('driver_sec')[0].style.background='rgb(11 16 45)'; " +
                            "document.getElementsByClassName('                  riding_tips')[0].style.background='rgb(11 16 45)'; " +
                            "document.getElementsByTagName('body')[0].style.background='rgb(11 16 45)'; " +

                            "})()")
                            .then((value) =>
                            debugPrint('Page finished loading Javascript'))
                            .catchError((onError) => debugPrint('$onError'));
                      },
                      gestureNavigationEnabled: true,
                    ),

                  );
                }),
                Center(

                  child: Container(
                    child: GlowingProgressIndicator(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                        child: Container(height: 250,
                            width: 250,
                            child: Image.asset('lib/assets/Kabuto.png')),
                      ),
                    ),
                  ),
                )
              ]),
        );
      }),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}