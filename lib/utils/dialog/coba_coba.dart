import 'package:flutter/material.dart';

class CobaCoba extends StatefulWidget {
  const CobaCoba({super.key});

  @override
  State<CobaCoba> createState() => _CobaCobaState();
}

class _CobaCobaState extends State<CobaCoba> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Studi Kasus Certainly Factor'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Hitung Tingkat Keyakinan'),
            onPressed: () {
              // Memanggil fungsi untuk menghitung tingkat keyakinan
              double cfFinal = calculateCFHypothesis();

              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Tingkat Keyakinan'),
                    content: Text('CF Final: $cfFinal'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  double calculateCFHypothesis() {
    List<double> CFValues = [
       0.3,
       0.8,
       0.9,
       0.6,
       0.7,
       0.6,
    ]; 
    double CFHypothesis =
        1; 
    double CFEvidence = CFValues.reduce(
        (minValue, value) => minValue < value ? minValue : value);
    double CFFinal = CFEvidence * CFHypothesis;
    return CFFinal;
  }
}
