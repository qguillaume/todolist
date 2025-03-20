class Todo {
  final String id;
  final String title;
  final String description;
  final bool isDone;

  // Constructeur
  Todo({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });

  // Convertir un objet Todo en Map (pour le stockage local)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }

  // Créer un objet Todo à partir d'un Map
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isDone: json['isDone'],
    );
  }
}
