import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

class HeadphoneWidget extends StatelessWidget {
  const HeadphoneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          // width: MediaQuery.sizeOf(context).width * 0.7,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(50),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  "assets/headphone.png",
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red.shade400,
                ),
                child: const Text(
                  "Status",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ).hide,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  "Headphone name",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Text(
                "product type",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Text(
                "\$00.00",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.orange.shade100,
            ),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Icon(
                  Icons.star,
                  color: Colors.orange.shade300,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "0.0",
                  style: TextStyle(
                    color: Colors.orange.shade300,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ).hide,
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.all(16),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.orange.shade400,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
