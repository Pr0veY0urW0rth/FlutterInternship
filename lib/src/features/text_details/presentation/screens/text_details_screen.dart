import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intership/src/core/router/app_router.dart';

class TextDetailsScreen extends StatelessWidget {
  const TextDetailsScreen(
      {super.key, required this.header, required this.text});

  final String header;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
                onPressed: () => context.go(AppRouter.textsListPath),
                icon: const Icon(Icons.arrow_back_ios_new_outlined)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Text(
                header,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
              ),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 20, fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
