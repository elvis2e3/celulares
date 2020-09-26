class Celulares {
    List<Celular> celulares;
    bool ok;

    Celulares({this.celulares, this.ok});

    factory Celulares.fromJson(Map<String, dynamic> json) {
        return Celulares(
            celulares: json['celulares'] != null ? (json['celulares'] as List).map((i) => Celular.fromJson(i)).toList() : null,
            ok: json['ok'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ok'] = this.ok;
        if (this.celulares != null) {
            data['celulares'] = this.celulares.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Celular {
    int id;
    String marca;
    String modelo;

    Celular({this.id, this.marca, this.modelo});

    factory Celular.fromJson(Map<String, dynamic> json) {
        return Celular(
            id: json['id'],
            marca: json['marca'],
            modelo: json['modelo'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['marca'] = this.marca;
        data['modelo'] = this.modelo;
        return data;
    }
}