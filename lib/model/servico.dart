// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Servico {
  int id;
  String nome;
  String descricao;
  String categoria;
  Servico({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.categoria,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'descricao': descricao,
      'categoria': categoria,
    };
  }

  factory Servico.fromMap(Map<String, dynamic> map) {
    return Servico(
      id: map['id'] as int,
      nome: map['nome'] as String,
      descricao: map['descricao'] as String,
      categoria: map['categoria'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Servico.fromJson(String source) =>
      Servico.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Servico(id: $id, nome: $nome, descricao: $descricao, categoria: $categoria)';
  }

  @override
  bool operator ==(covariant Servico other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.nome == nome &&
        other.descricao == descricao &&
        other.categoria == categoria;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        nome.hashCode ^
        descricao.hashCode ^
        categoria.hashCode;
  }
}
