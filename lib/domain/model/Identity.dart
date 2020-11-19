class Identity {
    String id;
    String pass;

    Identity({this.id, this.pass});

    factory Identity.fromJson(Map<String, dynamic> json) {
        return Identity(
            id: json['id'], 
            pass: json['pass'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['pass'] = this.pass;
        return data;
    }
}