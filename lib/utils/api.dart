class apiData {
  static const baseUrl = "http://localhost:3000/api/v1";
  static String getImagePath(String path) =>
      "http://localhost:3000/images/${path}";
}
