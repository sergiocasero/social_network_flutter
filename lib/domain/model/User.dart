class User {
    String description;
    String id;
    String name;
    String password;
    String pictureUrl;
    String website;

    User({this.description, this.id, this.name, this.password, this.pictureUrl, this.website});

    factory User.fromJson(Map<String, dynamic> json) {
        return User(
            description: json['description'], 
            id: json['id'], 
            name: json['name'], 
            password: json['password'], 
            pictureUrl: json['pictureUrl'], 
            website: json['website'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['description'] = this.description;
        data['id'] = this.id;
        data['name'] = this.name;
        data['password'] = this.password;
        data['pictureUrl'] = this.pictureUrl;
        data['website'] = this.website;
        return data;
    }
}