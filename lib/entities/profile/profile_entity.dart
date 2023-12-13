/// Класс пользователя в профиле
class ProfileEntity {
  final String name;
  final String phoneNumber;
  final String? avatarUri;
  final DateTime? birthday;
  final String? address;
  final String? facebook;
  final String? instagram;
  final String email;

  ProfileEntity({
    required this.name,
    required this.phoneNumber,
    this.avatarUri,
    this.birthday,
    this.address,
    this.facebook,
    this.instagram,
    required this.email,
  });

  ProfileEntity copyWith({
    String? name,
    String? phoneNumber,
    String? avatarUri,
    DateTime? birthday,
    String? address,
    String? facebook,
    String? instagram,
    String? email,
  }) {
    return ProfileEntity(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      avatarUri: avatarUri ?? this.avatarUri,
      birthday: birthday ?? this.birthday,
      address: address ?? this.address,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      email: email ?? this.email,
    );
  }
}
