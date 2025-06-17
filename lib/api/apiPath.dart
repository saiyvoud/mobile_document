const baseUrl = "http://192.168.1.2:3000/api";

class ApiPath {
  static String login = "${baseUrl}/user/login";
  static String register = "${baseUrl}/user/register";
  static String forgot = "${baseUrl}/user/forgot";
  static String getDocumentIn = "${baseUrl}/document_in/selAll";
  static String getDocumentOut = "${baseUrl}/document_out/selAll";
  static String searchIn = "${baseUrl}/document_in/search?search=";
  static String searchOut = "${baseUrl}/document_out/search?search=";
}
