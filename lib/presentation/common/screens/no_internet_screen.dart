import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NoInternetScreen extends StatefulWidget {
  const NoInternetScreen({super.key});

  @override
  State<NoInternetScreen> createState() => _NoInternetScreenState();
}

class _NoInternetScreenState extends State<NoInternetScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.signal_wifi_connected_no_internet_4_sharp,
              size: 60,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('No Internet Connection'),
            const SizedBox(
              height: 50,
            ),
            TextButton(
                onPressed: () {
                  //  log('treerere');
                  // setState(() {
                  //   retrying = !retrying;
                  // });
                  Future.delayed(
                    const Duration(seconds: 10),
                    () {
                      if (mounted) {
                        // setState(() {
                        //   retrying = !retrying;
                        // });
                      }
                    },
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(
                      Colors.blue.withOpacity(0.4)),
                ),
                child:
                    //  retrying
                    //     ? SizedBox(
                    //         height: 15,
                    //         width: 15,
                    //         child: const CircularProgressIndicator())
                    // :
                    const Text('Retry')),
          ],
        ),
      ),
    );
  }
}
