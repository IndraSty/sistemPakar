class DataPenyakit {
  final String id;
  final String namaPenyakit;
  final String deskripsiPenyakit;
  final String penyebabPenyakit;
  final String pengobatanPenyakit;

  DataPenyakit({
    required this.id,
    required this.namaPenyakit,
    required this.deskripsiPenyakit,
    required this.penyebabPenyakit,
    required this.pengobatanPenyakit,
  });

  factory DataPenyakit.fromJson(Map<String, dynamic> json) => DataPenyakit(
        id: json["id"],
        namaPenyakit: json["namaPenyakit"],
        deskripsiPenyakit: json["deskripsiPenyakit"],
        penyebabPenyakit: json["penyebabPenyakit"],
        pengobatanPenyakit:
            json["pengobatanPenyakit"],
      );

  Map<String, dynamic> toJson() => {
    "id": id,
    "namaPenyakit": namaPenyakit,
    "deskripsiPenyakit": deskripsiPenyakit,
    "penyebabPenyakit": penyebabPenyakit,
    "pengobatanPenyakit": pengobatanPenyakit
  };
}

final List<DataPenyakit> daftarPenyakit = [
  DataPenyakit(
    id: 'P01',
    namaPenyakit: 'Diare',
    deskripsiPenyakit:
        'Diare adalah penyakit yang membuat penderitanya menjadi sering buang air besar dengan kondisi tinja yang encer atau berair. Diare umumnya terjadi akibat mengonsumsi makanan dan minuman yang terkontaminasi virus, bakteri, atau parasit. Diare biasanya berlangsung tidak lebih dari 14 hari (diare akut). Namun, pada sebagian kasus, diare dapat berlanjut hingga lebih dari 14 hari (diare kronis).',
    penyebabPenyakit:
        'Gejala diare yang utama adalah buang air besar dengan tinja yang encer, yang bisa mengandung lendir atau darah. Gejala lain yang sering dialami oleh penderita diare adalah: ',
    pengobatanPenyakit:
        'Pengobatan utama diare adalah untuk mencegah dehidrasi. Penderita dapat meminum oralit, sup encer, dan air putih, untuk mengganti cairan tubuh yang hilang akibat diare. Selain itu, konsumsi makanan lunak dan tidak pedas, suplemen probiotik, dan obat antidiare yang bisa didapatkan di apotek, juga disarankan untuk mempercepat pemulihan diare. Pada bayi yang masih menyusu, pemberian ASI tetap dilakukan meskipun bayi diare. Pada kondisi yang lebih serius, dokter akan memberikan obat-obatan, seperti: Obat antibiotik Obat pereda nyeri Obat yang dapat memperlambat gerakan usus',
  ),
];
