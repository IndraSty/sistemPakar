class CFUser{
  String? id;
  String? cfuser;
  double? cf;

  CFUser({
    this.id,
    this.cfuser,
    this.cf,
  });
}

final List<CFUser> cfUser = [
  CFUser(
    id: 'U1',
    cfuser: 'Tidak Yakin',
    cf: 0.2,
  ),
  CFUser(
    id: 'U2',
    cfuser: 'Ragu-ragu',
    cf: 0.5,
  ),
  CFUser(
    id: 'U3',
    cfuser: 'Yakin',
    cf: 1
  )
];