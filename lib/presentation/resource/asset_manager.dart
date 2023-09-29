class AssetManager {
  AssetManager._();
  //PNG
  static const emptyData = 'assets/images/png/empty_icon.png';
  static const errorImage = 'assets/images/png/empty_image.png';
  static const errorAvatar = 'assets/images/png/empty_avatar.png';

  //SVG
  
  ////////////////////////////////////////////////////////////
  static String svg(asset) => 'assets/images/svg/$asset.svg';
  static String png(asset) => 'assets/images/png/$asset.png';
}
