import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


class ChapaWebView extends StatefulWidget {
  final String url;
  final String fallBackNamedUrl;
  final String transactionReference;
  final String amountPaid;

  const ChapaWebView({
    Key? key,
    required this.url,
    required this.fallBackNamedUrl,
    required this.transactionReference,
    required this.amountPaid,
  }) : super(key: key);

  @override
  State<ChapaWebView> createState() => _ChapaWebViewState();
}

class _ChapaWebViewState extends State<ChapaWebView> {
  late InAppWebViewController webViewController;
  String url = "";
  double progress = 0;
  StreamSubscription<ConnectivityResult>? connection;
  bool isOffline = false;

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  void checkConnectivity() {
    connection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          isOffline = true;
        });
        showErrorToast('No internet connection');
        exitPaymentPage('No internet connection');
      } else {
        setState(() {
          isOffline = false;
        });
      }
    } as void Function(List<ConnectivityResult> event)?) as StreamSubscription<ConnectivityResult>?;
  }

  void showErrorToast(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void exitPaymentPage(String message) {
    Navigator.pushNamed(
      context,
      widget.fallBackNamedUrl,
      arguments: {
        'message': message,
        'transactionReference': widget.transactionReference,
        'paidAmount': widget.amountPaid,
      },
    );
  }

  @override
  void dispose() {
    connection?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapa Payment'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri(Uri.parse(widget.url).toString())),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onLoadStop: (controller, url) async {
                if (url.toString().contains('success')) {
                  exitPaymentPage('Payment Successful');
                } else if (url.toString().contains('failure')) {
                  exitPaymentPage('Payment Failed');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => MyHomePage(),
      '/chapa_webview': (context) => const ChapaWebView(
        url: 'https://chapa.co/pay',
        fallBackNamedUrl: '/fallback',
        transactionReference: 'TX123456789',
        amountPaid: '100.00',
      ),
      '/fallback': (context) => FallBackPage(),
    },
  ));
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapa Payment Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/chapa_webview',
            );
          },
          child: const Text('Pay with Chapa'),
        ),
      ),
    );
  }
}

class FallBackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Status'),
      ),
      body: Center(
        child: Text(arguments['message']),
      ),
    );
  }
}
