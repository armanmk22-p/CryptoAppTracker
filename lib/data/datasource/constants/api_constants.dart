class ApiConstants {
  ApiConstants._();

  //baseUrl
  static const String baseUrl = 'https://api.coingecko.com/api/v3/coins';

  //connection
  static const Duration receiveTimeout = Duration(seconds: 15000);
  static const Duration connectionTimeout = Duration(seconds: 15000);

  //coinList
  //static const String coinList = '/list';
  //https://api.coingecko.com/api/v3/coins/markets?vs_currency=idr&order=market_cap_desc&per_page=100&page=1&sparkline=false
  static const String coinList = '/markets?vs_currency=idr&order=market_cap_desc&per_page=100&page=1&sparkline=false';

  //https://api.coingecko.com/api/v3/coins/bitcoin/market_chart?vs_currency=idr&days=15
  static String marketChart(String coinName,String day) => '/$coinName/market_chart?vs_currency=idr&days=$day';

  //search
  //https://api.coingecko.com/api/v3/search?query=name
 // static String searchCoin(var name) => "/search?query=$name";
  //final Response response = await dioClient.get(ApiConstants.searchCoin('tehran'));
}

