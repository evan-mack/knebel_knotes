import '../providers/db_provider2.dart';
import 'package:dio/dio.dart';
import '../models/medications_model.dart';

class MedicationApiProvider {
  Future<List<Medications>> getAllMedications() async {
    var url = "http://evansmackinnon.ca/api/api.php";
    Response response = await Dio().get(url);
    
    return (response.data as List).map((medication){
      print('Inserting $medication');
      DBProvider.db.createMedication(Medications.fromJson(medication));
    }).toList();
  
  
  }
}