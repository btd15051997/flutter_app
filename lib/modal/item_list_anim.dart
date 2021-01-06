

class AnimationItemList {
  String title;
  String imageUrl;
  AnimationItemList({this.title,this.imageUrl});

  static createListItem(){
    List<AnimationItemList> list = List<AnimationItemList>();
    list.add(AnimationItemList(title: "Transform_Translation",imageUrl: "assets/images/send.png"));
    list.add(AnimationItemList(title: "Delayed_Animation",imageUrl: "assets/images/send.png"));
    list.add(AnimationItemList(title: "Parenting_Animations",imageUrl: "assets/images/send.png"));
    return list;
  }
}

