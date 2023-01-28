import 'package:cloud_firestore/cloud_firestore.dart';

class UserAccount {
  String? email;
  final String? bio;
  final DateTime? date_of_birth;
  final String? experinces;
  final String? name;
  final String? phone;
  final String? photo;
  final int? user_type;
  final String? work_pos;
  final int? friends;
  final int? projects;
  final int? trainings;

  UserAccount({
    this.email = '',
    required this.bio,
    required this.date_of_birth,
    required this.experinces,
    required this.name,
    required this.phone,
    required this.photo,
    required this.user_type,
    required this.work_pos,
    required this.friends,
    required this.projects,
    required this.trainings,
  });
  Map<String, dynamic> toJson() => {
        'id': email,
        'Bio': bio,
        'DateOfBirth': date_of_birth,
        'Experinces': experinces,
        'Name': name,
        'Phone': phone,
        'Picture': photo,
        'UserType': user_type,
        'WorkPosition': work_pos,
        'Friends': 0,
        'WorkedProjects': 0,
        'Trainings': 0,
      };

  static UserAccount fromJson(Map<String, dynamic> json) => UserAccount(
        email: json['email'],
        date_of_birth: (json['DateOfBirth'] as Timestamp).toDate(),
        bio: json['Bio'],
        experinces: json['Experinces'],
        name: json['Name'],
        photo: json['Picture'],
        phone: json['Phone'],
        user_type: json['UserType'],
        work_pos: json['WorkPosition'],
        friends: json['Friends'],
        projects: json['WorkedProjects'],
        trainings: json['Trainings'],
      );
}
