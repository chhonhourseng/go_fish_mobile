class {{name.pascalCase()}}Request {

  {{name.pascalCase()}}Request({
    required this.id,
  });

  final String id;

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}