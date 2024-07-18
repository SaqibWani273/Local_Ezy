import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String? errMsg;
  const ErrorScreen({super.key, this.errMsg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline_rounded,
              color: Colors.redAccent, size: 60.0),
          const SizedBox(height: 20.0),
          Text(
            ' Something went wrong!',
            style: TextStyle(fontSize: 20.0, color: Colors.redAccent),
          ),
          if (errMsg != null) ...[
            // Show category name if provided
            const SizedBox(height: 10.0),
            Text(
              errMsg!,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ],
      ),
    );
  }
}
