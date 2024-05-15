class ApiLinks {
  // for getting all the governorates
  static String allGovsApi = "app_gov";

  // customer registeration form
  static String submitCusRegForm = "https://aman-iraq.com/api/cus-request-api";

  static const String _server = "https://system.aman-iraq.com/api";

  static String medicalRequestForm = "$_server/admin-medi-api";

  static String bankRequestForm = "$_server/admin-bank-api";

  static String lawRequestForm = "$_server/law-req-api";

  //status
  static String getLawClaimsStatus = "$_server/law-req-status";
  static String getBankServiceStatus = "$_server/bank-req-status";
  static String getMedicalServiceStatus = "$_server/medical-req-status";
}
