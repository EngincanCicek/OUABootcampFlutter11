import 'package:muse/models/tag.dart';

import 'image.dart';

class Post {
  final String postId;
  final String title;
  final String description;
  final Tag tagId;
  final String storageId;
  final String? youtubeVideoLink;
  final int likeCount;
  final Image image;

  Post({
    required this.postId,
    required this.title,
    required this.description,
    required this.tagId,
    required this.storageId,
    this.youtubeVideoLink,
    required this.likeCount,
    required this.image,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    // Validate required fields
    if (json['postId'] == null ||
        json['title'] == null ||
        json['description'] == null ||
        json['tagId'] == null ||
        json['storageId'] == null ||
        json['likeCount'] == null ||
        json['image'] == null) {
      throw ArgumentError('Missing required fields in JSON');
    }

    // Handle nested object (Tag)
    final tag = Tag.fromJson(json['tagId'] as Map<String, dynamic>);

    // Handle potential nested object (Image) - Assuming Image has fromJson
    final image = Image.fromJson(json['image'] as Map<String, dynamic>);

    return Post(
      postId: json['postId'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      tagId: tag,
      storageId: json['storageId'] as String,
      youtubeVideoLink: json['youtubeVideoLink'] as String?,
      likeCount: json['likeCount'] as int,
      image: image,
    );
  }

  Map<String, dynamic> toJson() => {
    'postId': postId,
    'title': title,
    'description': description,
    'tagId': tagId.toJson(), // Call toJson on nested Tag
    'storageId': storageId,
    'youtubeVideoLink': youtubeVideoLink,
    'likeCount': likeCount,
    'image': image.toJson(), // Call toJson on nested Image (assuming available)
  };
}
