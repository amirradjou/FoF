class Contacts{
  int _id;
  String _firstName;
  String _lastName;
  String _cellPhone;
  String _email;
  String _job;
  String _intrests;
  String _cityName;

  Contacts(this._id, this._firstName, this._lastName, this._cellPhone,
      this._email, this._job, this._intrests, this._cityName);

  String get cityName => _cityName;

  String get intrests => _intrests;

  String get job => _job;

  String get email => _email;

  String get cellPhone => _cellPhone;

  String get lastName => _lastName;

  String get firstName => _firstName;

  int get id => _id;
}