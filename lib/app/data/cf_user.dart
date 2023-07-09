class CFUser{
  String id;
  String title;
  double cf;

  CFUser({
    required this.id,
    required this.title,
    required this.cf,
  });
}

final List<CFUser> cfUsers = [
  CFUser(
    id: 'U1',
    title: 'Tidak Yakin',
    cf: 0.2,
  ),
  CFUser(
    id: 'U2',
    title: 'Ragu-ragu',
    cf: 0.5,
  ),
  CFUser(
    id: 'U3',
    title: 'Yakin',
    cf: 1
  )
];