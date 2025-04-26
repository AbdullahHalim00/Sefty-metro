class ApiContest {
  //https://accept.paymob.com/api/auth/tokens
  static const String baseUrl = 'https://accept.paymob.com/api';
  static const String paymentApiKey
  = "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2libUZ0WlNJNkltbHVhWFJwWVd3aUxDSndjbTltYVd4bFgzQnJJam8zTURBMk1USjkuMDdNUWE0RXN1cllscmZwbFh2WnJOSG5UYW1YTllfS1FoOUU0cloyVU1GZGxRZE82LTg3RzhFTGdldFR5cm9QZU9OYUdwM29zZjhtSEZIX3lpWXFSLUE=";
  static const String getAuthToken = '/auth/tokens';
  static const getOrderId = '/ecommerce/orders';
  static String paymentFirstToken = '';
  static String paymentOrderId = '';

  static const getPaymentRequest = '/acceptance/payment_keys';
  static const getRefCode = '/acceptance/payments/pay';
  static String visaUrl =
      '$baseUrl/acceptance/iframes/733671?payment_token=$finalToken';


  static String finalToken = '';

  static const String integrationIdCard = '3408779';
  static const String integrationIdKiosk = '3466443';

  static String refCode = '';
}

class AppImages {
  static const String refCodeImage =
      "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static const String visaImage =
      "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}
