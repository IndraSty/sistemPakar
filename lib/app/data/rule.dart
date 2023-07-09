
import 'cf_user.dart';


class Kondisi {
  final String gejala;
  final double bobot;
  final String id;
  final List<CFUser> userCf;

  Kondisi({required this.gejala, required this.bobot, required this.id, required this.userCf});
}

class Rule {
  final String id;
  final String name;
  final List<Kondisi> kondisi;
  final String result;

  Rule({required this.id, required this.name, required this.kondisi, required this.result});
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

List<Rule> rules = [
     Rule(
    id: "1A",
    name: "Aturan 1",
    kondisi: [
      Kondisi(
        gejala: 'Lesu',
        bobot: 0.4,
        id: 'J03',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Perut Kembung',
        bobot: 0.6,
        id: 'J04',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Kram Perut',
        bobot: 0.7,
        id: 'J02',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'BAB Cair',
        bobot: 0.6,
        id: 'J09',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Sering Sakit Perut',
        bobot: 0.9,
        id: 'J14',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'BAB Cair Lebih Dari 3x Sehari',
        bobot: 0.8,
        id: 'J12',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Gelisah atau Tidak Nyaman Saat Tidur',
        bobot: 0.3,
        id: 'J11',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      )
    ],
    result: "Diare",
  ),
     Rule(
    id: "2",
    name: "Aturan 2",
    kondisi: [
      Kondisi(
        gejala: 'Batuk',
        bobot: 0.4,
        id: 'J01',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Lesu',
        bobot: 0.2,
        id: 'J03',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Gelisah atau Tidak Nyaman Saat Tidur',
        bobot: 0.2,
        id: 'J11',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Dada Terasa Sakit',
        bobot: 0.3,
        id: 'J06',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Nafas Berbunyi (Mengi)',
        bobot: 0.7,
        id: 'J07',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Sesak Nafas',
        bobot: 0.6,
        id: 'J10',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
    ],
    result: "Asma",
  ),
  Rule(
    id: "3",
    name: "Aturan 3",
    kondisi: [
      Kondisi(
        gejala: 'Lesu',
        bobot: 0.5,
        id: 'J03',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Gelisah atau Tidak Nyaman Saat Tidur',
        bobot: 0.4,
        id: 'J11',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Perut Kembung',
        bobot: 0.9,
        id: 'J04',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Muntah',
        bobot: 0.4,
        id: 'J05',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Gatal-gatal pada anus',
        bobot: 0.6,
        id: 'J08',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
      Kondisi(
        gejala: 'Anak Tampak Kurus',
        bobot: 0.8,
        id: 'J13',
        userCf: [
          CFUser(
            id: 'U1',
            title: 'Tidak Yakin',
            cf: 0.1,
          ),
          CFUser(
            id: 'U2',
            title: 'Ragu-ragu',
            cf: 0.5,
          ),
          CFUser(
            id: 'U3',
            title: 'Yakin',
            cf: 1,
          )
        ],
      ),
    ],
    result: "Cacingan",
  ),
  ];