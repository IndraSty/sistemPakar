import 'package:flutter/material.dart';

class CobaPartII extends StatefulWidget {
  const CobaPartII({Key? key}) : super(key: key);

  @override
  State<CobaPartII> createState() => _CobaPartIIState();
}

class _CobaPartIIState extends State<CobaPartII> {
  bool isChecked = false;
  bool isExpanded = false;
  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkbox with Radio'),
      ),
      body: ListView(
        children: [
          ExpansionTile(
            title: const Text('Checkbox Item'),
            trailing: Checkbox(
              value: isChecked,
              onChanged: (value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            children: [
              Column(
                children: [
                  RadioListTile(
                    title: const Text('Option 1'),
                    value: 1,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value as int;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Option 2'),
                    value: 2,
                    groupValue: selectedOption,
                    onChanged: (value) {
                      setState(() {
                        selectedOption = value as int;
                      });
                    },
                  ),
                ],
              ),
            ],
            onExpansionChanged: (value) {
              setState(() {
                isExpanded = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
