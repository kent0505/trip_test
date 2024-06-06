import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<TextEditingController> controllers = [];

  int textFieldCount = 1;

  void getValues() {
    for (var controller in controllers) {
      print(controller.text);
    }
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < textFieldCount; i++) {
      controllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (textFieldCount <= 10) {
                      textFieldCount++;
                      controllers.add(TextEditingController());
                    }
                  });
                },
                child: const Text('Add'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (textFieldCount >= 1) {
                      textFieldCount--;
                      controllers.removeLast();
                    }
                  });
                },
                child: const Text('Remove'),
              ),
              ElevatedButton(
                onPressed: getValues,
                child: const Text('Get values'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: textFieldCount,
              itemBuilder: (context, index) {
                return TextField(controller: controllers[index]);
              },
            ),
          )
        ],
      ),
    );
  }
}
