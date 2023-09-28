import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shimmer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  bool loading = true;
  Widget? loadingWidget;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          loading = false;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (loadingWidget == null) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          loadingWidget =
              const ShoeWidget().redacted(context: context, redact: true);
        });
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redacted'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (loading)
              GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return loadingWidget;
                },
                itemCount: 5,
              )
            else
              GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 24,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return const ShoeWidget();
                },
                itemCount: 20,
              ),
          ],
        ),
      ),
    );
  }
}

class ShoeWidget extends StatelessWidget {
  const ShoeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade200,
            ),
            child: Image.asset("assets/shoe.png"),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "\$180.99",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.red.shade300,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.star,
              color: Colors.red.shade300,
            ),
            const Text(
              "4.1",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          "Nike ACG Mountain",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
