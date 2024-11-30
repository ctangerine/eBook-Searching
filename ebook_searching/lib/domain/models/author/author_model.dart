import 'package:json_annotation/json_annotation.dart';

part 'author_model.g.dart';

@JsonSerializable()
class AuthorModel {
  static const String example = """
  "name": "<string>",
  "stageName": "<string>",
  "nationality": "<string>",
  "birthDate": "<string>",
  "birthPlace": "<string>",
  "deathDate": "<string>",
  "website": "<string>",
  "description": "<string>",
  "image": "<string>"
  """;

  String name;
  String? stageName;
  String? nationality;
  String? birthDate;
  String? birthPlace;
  String? deathDate;
  String? website;
  String? description;
  String? image;

  AuthorModel({
    required this.name,
    this.stageName,
    this.nationality,
    this.birthDate,
    this.birthPlace,
    this.deathDate,
    this.website,
    this.description,
    this.image
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) => _$AuthorModelFromJson(json);
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'stageName': stageName,
      'nationality': nationality,
      'birthDate': birthDate,
      'birthPlace': birthPlace,
      'deathDate': deathDate,
      'website': website,
      'description': description,
      'image': image,
    };
  }

  // default instance
  static final AuthorModel defaultInstance = AuthorModel(
    name: 'Nguyễn Ngọc Tư',
    stageName: 'Nguyễn Ngọc Tư',
    nationality: 'Việt Nam',
    birthDate: '1/1/1976',
    birthPlace: 'Tân Duyệt, Đầm Dơi, Cà Mau',
    deathDate: 'None',
    website: 'https://www.nguyenngoctu.net',
    description: 'Nguyễn Ngọc Tư (sinh năm 1976 tại xã Tân Duyệt, huyện Đầm Dơi, tỉnh Cà Mau) là một nhà văn, thành viên Hội nhà văn Việt Nam. Năm 2018, cô được trao Giải thưởng Văn học Liberaturpreis 2018 do Litprom (Hiệp hội quảng bá văn học châu Á, châu Phi, Mỹ Latin ở Đức) bình chọn, dựa trên việc xem xét các bản dịch tiếng Đức tác phẩm nổi bật của các tác giả nữ đương đại tiêu biểu trong khu vực. Giải thưởng được trao hàng năm nhằm vinh danh các tác giả nữ đến từ châu Á, Phi, Mỹ Latin, Các tiểu vương quốc Ả Rập thống nhất (UAE) và vùng Caribe.Cô âm thầm đến với Văn học và thật sự tỏa sáng sau khi nhận giải Nhất của cuộc thi Văn học tuổi 20 của Nhà xuất bản trẻ. Nguyễn Ngọc Tư được biết đến với tập truyện mang tên Cánh đồng bất tận. Tập truyện nhận giải thưởng của Hội nhà văn Việt Nam năm 2006 và truyện ngắn cùng tên đã được chuyển thể thành phim điện ảnh năm 2010.',
    image: 'https://scontent.fdad3-1.fna.fbcdn.net/v/t39.30808-6/296815979_618627686292575_6440210201303104248_n.jpg?_nc_cat=1&ccb=1-7&_nc_sid=6ee11a&_nc_ohc=f3rjhUVa51kQ7kNvgG8ZaAn&_nc_zt=23&_nc_ht=scontent.fdad3-1.fna&_nc_gid=AA7HSbSmBQlV8m5kRIykPh5&oh=00_AYA5lFotiivh4MZc7GV3qu6QCesGoXLSWU1hn2s4JbpPBw&oe=674DC97B'
  );
}