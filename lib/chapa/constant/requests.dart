import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:virtual_shop/chapa/constant/url.dart';
import '../chapawebview.dart';
import '../model/data.dart';

Future<String> intilizeMyPayment(
  BuildContext context,
  String authorization,
  String email,
  String phone,
  String amount,
  String currency,
  String firstName,
  String lastName,
  String transactionReference,
  String customTitle,
  String customDescription,
  String fallBackNamedRoute,
) async {
  final http.Response response = await http.post(
    Uri.parse(ChapaUrl.baseUrl),
    headers: {
      'Authorization': 'Bearer $authorization',
    },
    body: {
      'phone_number': phone,
      'amount': amount,
      'currency': currency.toUpperCase(),
      'first_name': firstName,
      'last_name': lastName,
      'tx_ref': transactionReference,
      'customization[title]': customTitle,
      'customization[description]': customDescription
    },
  );
  var jsonResponse = json.decode(response.body);
  if (response.statusCode == 400) {
    showToast(jsonResponse);
  } else if (response.statusCode == 200) {
    ResponseData res = ResponseData.fromJson(jsonResponse);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ChapaWebView(
                url: res.data.checkoutUrl.toString(),
                fallBackNamedUrl: fallBackNamedRoute,
                transactionReference: transactionReference,
                amountPaid: amount,
              )),
    );

    return res.data.checkoutUrl.toString();
  }

  return '';
}

Future<bool?> showToast(jsonResponse) {
  return Fluttertoast.showToast(
      msg: jsonResponse['message'],
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}