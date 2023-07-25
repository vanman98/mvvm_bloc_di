class AssetManager {
  AssetManager._();
  //PNG
  static const emptyImage = 'empty_image.png';
  //SVG
  
  ////////////////////////////////////////////////////////////
  static String svg(asset) => 'assets/images/svg/$asset.svg';
  static String png(asset) => 'assets/images/png/$asset.png';
}
