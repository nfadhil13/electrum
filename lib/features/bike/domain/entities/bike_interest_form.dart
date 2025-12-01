class BikeInterestFormEntity {
  final String bikeId;
  DateTime? preferredStartDate;
  String? pickUpArea;
  String? contact;
  String? additionalNotes;

  BikeInterestFormEntity({
    required this.bikeId,
    this.preferredStartDate,
    this.pickUpArea,
    this.contact,
    this.additionalNotes,
  });
}
