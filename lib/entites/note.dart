
class Welcome {
    Welcome({
        required this.name,
        required this.age,
        required this.car,
    });

    String name;
    int age;
    dynamic car;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        name: json["name"],
        age: json["age"],
        car: json["car"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "age": age,
        "car": car,
    };
}
