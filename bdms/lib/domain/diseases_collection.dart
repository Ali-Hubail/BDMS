import 'package:bdms/domain/disease.dart';

class DiseasesCollection {
  DiseasesCollection({required this.diseases});

  final List<Disease> diseases;

  void addDisease(Disease disease) {
    diseases.add(disease);
  }

  void removeDisease(Disease disease) {
    diseases.remove(disease);
  }

  List<Disease> get dis => diseases;
}
