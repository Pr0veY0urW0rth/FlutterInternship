import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
        title: IconButton(
          onPressed: () => context.go(AppRouter.textsListPath),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                header,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              const Gap(10),
              Text(
                text,
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
