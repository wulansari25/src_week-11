import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'geolocation.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LocationSecreen(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = ''; 
  String totalResult = ''; 
  bool isLoading = false; 
  

  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw ('Something terrible happened');
  }

  void handleReturnError() {
    returnError()
        .then((value) {
          setState(() {
            result = 'Success';
          });
        })
        .catchError((onError) {
          setState(() {
            result = onError.toString();
          });
        })
        .whenComplete(() => print('Complete'));
  }

  Future handleError() async {
    try {
      await returnError();
    }
    catch (error) {
      setState(() {
        result = error.toString();
      });
    }
    finally {
      print('complete');
    }
  }

  void returnFG() {
    setState(() {
      isLoading = true;
    });

    FutureGroup<int> futureGroup = FutureGroup<int>();
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());
    futureGroup.close();

    futureGroup.future.then((List<int> value) {
      int total = value.fold(0, (prev, element) => prev + element);
      setState(() {
        result = total.toString();
        isLoading = false; 
      });
    }).catchError((error) {
      setState(() {
        result = 'An error occurred: $error';
        isLoading = false; 
      });
    });
  }

  void returnWithFutureWait() {
    setState(() {
      isLoading = true; 
    });

    final futures = Future.wait<int>([
      returnOneAsync(),
      returnTwoAsync(),
      returnThreeAsync(),
    ]);

    futures.then((List<int> value) {
      int total = value.fold(0, (prev, element) => prev + element);
      setState(() {
        result = total.toString();
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        result = 'An error occurred: $error';
        isLoading = false; 
      });
    });
  }

  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: () {
                handleReturnError();
              },
            ),
            const SizedBox(height: 20),
            isLoading
                ? const CircularProgressIndicator() 
                : Text(
                    result, 
                    style: const TextStyle(fontSize: 24),
                  ),
          ],
        ),
      ),
    );
  }
}
