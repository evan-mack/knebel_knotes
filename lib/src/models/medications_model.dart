// To parse this JSON data, do
//
//     final medications = medicationsFromJson(jsonString);

import 'dart:convert';

List<Medications> medicationsFromJson(String str) => List<Medications>.from(
    json.decode(str).map((x) => Medications.fromJson(x)));

String medicationsToJson(List<Medications> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medications {
  String id;
  String cat;
  String subCat;
  String medName;
  String indicationsComment;
  String frequency;
  String doseInit;
  String doseInitComment;
  String doseRange;
  String doseRangeComment;
  String maxDose;
  String maxDoseForKids;
  String blackBoxWarning;
  String misc;
  String equiv;
  String amphWorkUp;
  String mphWorkUp;

  Medications(
      {this.id,
      this.cat,
      this.subCat,
      this.medName,
      this.indicationsComment,
      this.frequency,
      this.doseInit,
      this.doseInitComment,
      this.doseRange,
      this.doseRangeComment,
      this.maxDose,
      this.maxDoseForKids,
      this.blackBoxWarning,
      this.misc,
      this.equiv,
      this.amphWorkUp,
      this.mphWorkUp});

  factory Medications.fromJson(Map<String, dynamic> json) => Medications(
      id: json["id"],
      cat: json["cat"],
      subCat: json["subCat"],
      medName: json["medName"],
      indicationsComment: json["indicationsComment"],
      frequency: json["frequency"],
      doseInit: json["doseInit"],
      doseInitComment: json["doseInitComment"],
      doseRange: json["doseRange"],
      doseRangeComment: json["doseRangeComment"],
      maxDose: json["maxDose"],
      maxDoseForKids: json["maxDoseForKids"],
      blackBoxWarning: json["blackBoxWarning"],
      misc: json["misc"],
      equiv: json["equiv"],
      amphWorkUp: json["amphWorkUp"],
      mphWorkUp: json["mphWorkUp"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat": cat,
        "subCat": subCat,
        "medName": medName,
        "indicationsComment": indicationsComment,
        "frequency": frequency,
        "doseInit": doseInit,
        "doseInitComment": doseInitComment,
        "doseRange": doseRange,
        "doseRangeComment": doseRangeComment,
        "maxDose": maxDose,
        "maxDoseForKids": maxDoseForKids,
        "blackBoxWarning": blackBoxWarning,
        "misc": misc,
        "equiv": equiv,
        "amphWorkUp": amphWorkUp,
        "mphWorkUp": mphWorkUp
      };
}
