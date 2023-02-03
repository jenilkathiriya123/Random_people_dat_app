class Rendomdata {
  final String gender;
  final String title;
  final int age;
  final String Phone;
  final String first;
  final String last;
  final String country;
  final String city;
  final String photo;

  Rendomdata({
    required this.gender,
    required this.title,
    required this.age,
    required this.first,
    required this.last,
    required this.country,
    required this.photo,
    required this.Phone,
    required this.city,
  });

  factory Rendomdata.fromMap ({required Map data}){
    return Rendomdata(
      gender: data['results'][0]['gender'],
      title: data['results'][0]['name']['title'],
      age: data['results'][0]['registered']['age'],
      first:data['results'][0]['name']['first'],
      last: data['results'][0]['name']['last'],
      country: data['results'][0]['location']['country'],
      photo: data['results'][0]['picture']['large'],
      Phone: data['results'][0]['phone'],
      city:data['results'][0]["location"]["city"],
    );
  }
}
