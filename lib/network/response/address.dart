class Address {
  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode});

  String street;
  String suite;
  String city;
  String zipcode;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode']);

  Map<String, dynamic> toJson() => {
    "street": street,
    "suite": suite,
    "city": city,
    "zipcode": zipcode
  };
}
