import 'dart:convert';

Rule ruleFromJson(String str) => Rule.fromJson(json.decode(str));

String ruleToJson(Rule data) => json.encode(data.toJson());

class Rule {
  String? id;
  String? name;
  List<String>? kondisi;
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
      "Lesu",
      "Perut Kembung",
      "Kram Perut",
      "BAB Cair",
      "Sering Sakit Perut",
      "BAB Cair Lebih Dari 3x Sehari",
      "Gelisah atau Tidak Nyaman Saat Tidur",
    ],
    cf: 0.9,
    result: "Diare",
  ),
  Rule(
    id: "1B",
    name: "Aturan 1",
    kondisi: [
      "Lesu",
      "Perut Kembung",
      "Kram Perut",
    ],
    cf: 0.23,
    result: "Diare",
  ),
  Rule(
    id: "1C",
    name: "Aturan 1",
    kondisi: [
      "Lesu",
      "Perut Kembung",
      "Kram Perut",
      "BAB Cair",
    ],
    cf: 0.5,
    result: "Diare",
  ),
  Rule(
    id: "1D",
    name: "Aturan 1",
    kondisi: [
      "Lesu",
      "Perut Kembung",
      "Kram Perut",
      "BAB Cair",
      "Sering Sakit Perut",
    ],
    cf: 0.7,
    result: "Diare",
  ),
  Rule(
    id: "1E",
    name: "Aturan 1",
    kondisi: [
      "Lesu",
      "Perut Kembung",
      "Kram Perut",
      "BAB Cair",
      "Sering Sakit Perut",
      "BAB Cair Lebih Dari 3x Sehari",
    ],
    cf: 0.8,
    result: "Diare",
  ),
  Rule(
    id: "2",
    name: "Aturan 2",
    kondisi: [
      "Batuk",
      "Lesu",
      "Gelisah atau Tidak Nyaman Saat Tidur",
      "Dada Terasa Sakit",
      "Nafas Berbunyi (Mengi)",
      "Sesak Nafas",
    ],
    result: "Asma",
  ),
  Rule(
    id: "3",
    name: "Aturan 3",
    kondisi: [
      "Lesu",
      "Gelisah atau Tidak Nyaman Saat Tidur",
      "Perut Kembung",
      "Muntah",
      "Gatal-gatal pada anus",
      "Anak Tampak Kurus",
    ],
    result: "Cacingan",
  ),
];
