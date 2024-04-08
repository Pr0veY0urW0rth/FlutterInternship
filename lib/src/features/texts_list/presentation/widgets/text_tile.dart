import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TextTile extends StatelessWidget {
  const TextTile(
      {super.key, required this.header, required this.text, this.onPressed});
  final String header;
  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: Border.all(
              color: Colors.grey.shade800,
            )),
        child: Column(
          children: [
            Text(header,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            const Gap(5),
            Text(
              text,
              style: const TextStyle(fontSize: 16),
              maxLines: 3,
            )
          ],
        ),
      ),
    );
  }
}
