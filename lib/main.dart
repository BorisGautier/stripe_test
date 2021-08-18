import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey =
      "pk_test_51Hz8DrKqbsAb3BxIDo03QTfJ0qMC65Bm0rZhBljZiAwo99R3g1Hn9axsNF35IWxlQ4sJUZs0nkJqLs4xTt4t7v4r00X8gBU0UD";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CardField(
            onCardChanged: (card) {
              print(card);
            },
          ),
          TextButton(
            onPressed: () async {
              // create payment method
              final paymentMethod = await Stripe.instance
                  .createPaymentMethod(PaymentMethodParams.card());
            },
            child: Text('pay'),
          )
        ],
      ),
    );
  }
}
