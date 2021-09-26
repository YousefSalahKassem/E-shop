class VoucherModel{
 late String background,image,name,offer,code,userId,logo,percentage;

 VoucherModel(this.background, this.image, this.name, this.offer, this.code,
      this.userId, this.logo,this.percentage);

 VoucherModel.fromJson(Map<dynamic, dynamic> map) {
   if (map.isEmpty) {
     return;
   }
   image = map['image'];
   background = map['background'];
   name = map['name'];
   offer = map['offer'];
   code = map['code'];
   logo = map['logo'];
   userId = map['userId'];
   percentage = map['percentage'];

 }
 toJson() {
   return {
     'image': image,
     'background':background,
     'name':name,
     'offer':offer,
     'code':code,
     'logo':logo,
     'userId':userId,
     'percentage':percentage
   };
 }
}