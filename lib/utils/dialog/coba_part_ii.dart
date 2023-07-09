import 'package:flutter/material.dart';

class CobaPartII extends StatefulWidget {
  const CobaPartII({Key? key}) : super(key: key);

  @override
  State<CobaPartII> createState() => _CobaPartIIState();
}

class _CobaPartIIState extends State<CobaPartII> {
  bool isChecked = false;
  int? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contoh Widget Flutter'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
                if (!isChecked) {
                  selectedValue = null;
                }
              });
            },
          ),
          if (isChecked)
            Column(
              children: [
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    const Text('Tidak Yakin'),
                    Radio<int>(
                      value: 2,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    const Text('Ragu-ragu'),
                    Radio<int>(
                      value: 3,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    const Text('Yakin'),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}
