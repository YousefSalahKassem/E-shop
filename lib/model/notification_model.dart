class NotificationsModel{
 late String image,title,description;

 NotificationsModel({required this.image,required this.title,required this.description});

 NotificationsModel.fromJson(Map<dynamic, dynamic> map) {
   if (map.isEmpty) {
     return;
   }
   image = map['image'];
   title = map['title'];
   description = map['description'];
 }
 toJson() {
   return {
     'image': image,
     'title':title,
     'description':description
   };
 }
}