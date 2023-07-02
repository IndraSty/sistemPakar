import 'dart:convert';

Rule ruleFromJson(String str) => Rule.fromJson(json.decode(str));

String ruleToJson(Rule data) => json.encode(data.toJson());

class Rule {
  String? id;
  String? name;
  List<Kondisi>? kondisi;
  String? result;
  double? cf;

  Rule({
    this.id,
    this.name,
    this.kondisi,
    this.result,
    this.cf,
  });

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
        id: json["id"],
        name: json["name"],
        kondisi: json["kondisi"],
        result: json["result"],
        cf: json["cf"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "kondisi": kondisi,
        "result": result,
        "cf": cf,
      };
}

class Kondisi {
  final String gejala;
  final double bobot;

  Kondisi({required this.gejala, required this.bobot});
}

final List<String> gejala = [
  "Batuk",
  "Kram Perut",
  "Lesu",
  "Perut Kembung",
  "Muntah",
  "Dada Terasa Sakit",
  "Nafas Berbunyi (Mengi)",
  "Gatal-gatal pada anus",
  "BAB Cair",
  "Sesak Nafas",
  "Gelisah atau Tidak Nyaman Saat Tidur",
  "BAB Cair Lebih Dari 3x Sehari",
  "Anak Tampak Kurus",
  "Sering Sakit Perut",
];

final List<Rule> rules = [
  Rule(
    id: "1A",
    name: "Aturan 1",
    kondisi: [
      Kondisi(gejala: 'Lesu', bobot: 0.4),
      Kondisi(gejala: 'Perut Kembung', bobot: 0.6),
      Kondisi(gejala: 'Kram Perut', bobot: 0.7),
      Kondisi(gejala: 'BAB Cair', bobot: 0.6),
      Kondisi(gejala: 'Sering Sakit Perut', bobot: 0.9),
      Kondisi(gejala: 'BAB Cair Lebih Dari 3x Sehari', bobot: 0.8),
      Kondisi(gejala: 'Gelisah atau Tidak Nyaman Saat Tidur', bobot: 0.3)
    ],
    cf: 0.9,
    result: "Diare",
  ),
  Rule(
    id: "2",
    name: "Aturan 2",
    kondisi: [
      Kondisi(gejala: 'Batuk', bobot: 0.7),
      Kondisi(gejala: 'Lesu', bobot: 0.6),
      Kondisi(gejala: 'Gelisah atau Tidak Nyaman Saat Tidur', bobot: 0.3),
      Kondisi(gejala: 'Dada Terasa Sakit', bobot: 0.7),
      Kondisi(gejala: 'Nafas Berbunyi (Mengi)', bobot: 0.8),
      Kondisi(gejala: 'Sesak Nafas', bobot: 0.9),
    ],
    result: "Asma",
  ),
  Rule(
    id: "3",
    name: "Aturan 3",
    kondisi: [
      Kondisi(gejala: 'Lesu', bobot: 0.5),
      Kondisi(gejala: 'Gelisah atau Tidak Nyaman Saat Tidur', bobot: 0.4),
      Kondisi(gejala: 'Perut Kembung', bobot: 0.9),
      Kondisi(gejala: 'Muntah', bobot: 0.4),
      Kondisi(gejala: 'Gatal-gatal pada anus', bobot: 0.6),
      Kondisi(gejala: 'Anak Tampak Kurus', bobot: 0.8),
    ],
    result: "Cacingan",
  ),
];
