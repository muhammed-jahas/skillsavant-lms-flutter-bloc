class CourseModel {
  final int id;
  final String instructorFirstName;
  final String instructorLastName;
  final bool isFavourite;
  final String duration;
  final String title;
  final String subtitle;
  final String description;
  final String price;
  final String level;
  final bool isApproved;
  final bool unlisted;
  final String coverImage;
  final String createdAt;
  final String updatedAt;
  final Instructor instructor;
  final Subcategory subcategory;
  final List<Tag> tags;

  CourseModel({
    required this.id,
    required this.instructorFirstName,
    required this.instructorLastName,
    required this.isFavourite,
    required this.duration,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
    required this.level,
    required this.isApproved,
    required this.unlisted,
    required this.coverImage,
    required this.createdAt,
    required this.updatedAt,
    required this.instructor,
    required this.subcategory,
    required this.tags,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      id: json['id'],
      instructorFirstName: json['instructor_first_name'],
      instructorLastName: json['instructor_last_name'],
      isFavourite: json['is_favourite'],
      duration: json['duration'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      price: json['price'],
      level: json['level'],
      isApproved: json['is_approved'],
      unlisted: json['unlisted'],
      coverImage: json['cover_image'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      instructor: Instructor.fromJson(json['instructor']),
      subcategory: Subcategory.fromJson(json['subcategory']),
      tags: List<Tag>.from(
          (json['tags'] as List).map((tag) => Tag.fromJson(tag),),),
    );
  }
}

class Instructor {
  final int id;
  final String bio;
  final String skill;
  final String profilePhoto;
  final String wallet;
  final int user;

  Instructor({
    required this.id,
    required this.bio,
    required this.skill,
    required this.profilePhoto,
    required this.wallet,
    required this.user,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      bio: json['bio'],
      skill: json['skill'],
      profilePhoto: json['profile_photo'],
      wallet: json['wallet'],
      user: json['user'],
    );
  }
}

class Subcategory {
  final int id;
  final String name;
  final String createdAt;
  final int category;

  Subcategory({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.category,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      category: json['category'],
    );
  }
}

class Tag {
  final int id;
  final String name;
  final String createdAt;
  final int subcategory;

  Tag({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.subcategory,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
      subcategory: json['subcategory'],
    );
  }
}
