class Payment {
  Address address;
  UserDetails Details;
  Payment({this.address, this.Details});
}

class UserDetails {
  String Name;
  String Dob;
  String NUmber;
  // int securityCode;
  UserDetails({
    this.Name,
    this.Dob,
    this.NUmber,
  });
}

class Address {
  String postCode;
  String addressLine;
  Address({this.postCode, this.addressLine});
}
