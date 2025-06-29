class AccountResponse {
  final String uid;
  final String email;
  final String? name;
  final String? topic;

  AccountResponse({
    required this.uid,
    required this.email,
    this.name,
    this.topic,
  });

  factory AccountResponse.fromMap(Map<String, dynamic> map) {
    return AccountResponse(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      name: map['name'],
      topic: map['topic'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'topic': topic,
    };
  }
}
