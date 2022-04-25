class Secret {
  final String COMPANY_EMAIL;
  final String PASSWORD;

  Secret({this.COMPANY_EMAIL = "", this.PASSWORD = ""});
  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(COMPANY_EMAIL: jsonMap["COMPANY_EMAIL"], PASSWORD: jsonMap["PASSWORD"]);
  }
}
