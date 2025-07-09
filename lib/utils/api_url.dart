class ApiUrl {
  //BASE URl
  static String baseUrl = "https://backend.coqui.codesorbit.net/api";
  //static String baseUrl = "https://644a-182-180-54-193.ngrok-free.app/api";

  //AUTHENTICATION
  static String registerUrl = "$baseUrl/user/signup";
  static String signInUrl = "$baseUrl/user/signin";
  static String onBoardUrl = "$baseUrl/user/on_board";
  static String forgotPasswordUrl = "$baseUrl/user/forgot-password";

  //PROFILE
  static String getProfileUrl = "$baseUrl/user";
  static String updateProfileUrl = "$baseUrl/user/update";

  //CUSTOMER
  static String customerListUrl = "$baseUrl/customer/userId/";
  static String customerDetailUrl = "$baseUrl/customer/";
  static String customerAddUrl = "$baseUrl/customer/";
  static String customerUpdateUrl = "$baseUrl/customer/";
  static String customerDeleteUrl = "$baseUrl/customer/";

  //Taxes
  static String taxListUrl = "$baseUrl/tax/";
  static String taxDetailUrl = "$baseUrl/tax/";
  static String taxAddUrl = "$baseUrl/tax/";
  static String taxUpdateUrl = "$baseUrl/tax/";
  static String taxDeleteUrl = "$baseUrl/tax/";

  static String activeTaxUrl = "$baseUrl/tax/activeTaxes";
  static String setGrossTaxeUrl = "$baseUrl/user/set_gross";
  static String taxToggleUrl = "$baseUrl/tax/toggle/";

  // Invoice
  static String createInvoiceUrl = "$baseUrl/invoice";
  static String invoicesListUrl = "$baseUrl/invoice/";
  static String shareInvoiceUrl = "$baseUrl/invoice/share";
  static String cancelInvoiceUrl = "$baseUrl/invoice/cancel/";

  // Notification
  static String notificationListUrl = "$baseUrl/notification";

  // Logout
  static String logOutUrl = "$baseUrl/user/signout";

  // Delete Account
  static String deleteAccountUrl = "$baseUrl/user";
}
