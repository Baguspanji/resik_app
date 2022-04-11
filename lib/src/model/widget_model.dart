class DateModel {
  final String day;
  final String date;
  final List<String>? notif;

  DateModel(this.day, this.date, {this.notif});
}

class ProfileItemModel {
  final String title;
  final String icon;
  final String? subTitle;

  ProfileItemModel(this.title, this.icon, {this.subTitle});
}

class NavModel {
  final String title;
  final String svgVisible;
  final String svgInvisible;

  NavModel(this.svgVisible, this.svgInvisible, this.title);
}

class NotifNavModel {
  final String title;
  final List<ProfileItemModel>? items;

  NotifNavModel(this.title, {this.items});
}
