import 'package:flutter/cupertino.dart';

class SoilMarker extends StatelessWidget {
  final String Texture;
  final String cultureApte;
  final String culture_inapte;
  final String latitude;
  final String longitude;
  final String niveau_de_fertilite;
  final String numero_des_profil;
  final String type_de_sol;
  const SoilMarker(
      {Key? key,
      required this.Texture,
      required this.cultureApte,
      required this.culture_inapte,
      required this.latitude,
      required this.longitude,
      required this.niveau_de_fertilite,
      required this.numero_des_profil,
      required this.type_de_sol})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(

    );
  }
}
