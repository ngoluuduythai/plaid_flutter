import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:plaid_flutter/plaid_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  PlaidLink _plaidLink;
  
  @override
  void initState() {
    super.initState();
  
    _plaidLink = PlaidLink(
      clientName: "CLIENT_NAME",
      publicKey: "PUBLIC_KEY",
      env: EnvOption.sandbox,
      products: <ProductOption>[
        ProductOption.auth,
      ],
      onAccountLinked: (publicToken, metadata) { print("onAccountLinked: $publicToken metadata: $metadata"); },
      onAccountLinkError: (error, metadata) { print("onAccountError: $error metadata: $metadata"); },
      onEvent: (event, metadata) { print("onEvent: $event metadata: $metadata"); },
      onExit: (metadata) { print("onExit: $metadata"); },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: 
        Container(
          color: Colors.lightBlue,
          child:
          Center( 
            child: 
            RaisedButton(
              onPressed: () {
                _plaidLink.open();
              },
              child: Text("Open Plaid Link"),
            ),
          ),
        ),
      ),
    );
  }
}
