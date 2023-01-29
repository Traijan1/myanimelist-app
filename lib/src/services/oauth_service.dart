import 'dart:convert';

import 'package:myanimelist/src/url_builder.dart';
import 'package:http/http.dart' as http;
import 'package:pkce/pkce.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'myanimelist_service.dart';
import '../constants.dart';

class OAuthService {
  static String authUrl = "https://myanimelist.net/v1/oauth2/authorize";
  static String tokenUrl = "https://myanimelist.net/v1/oauth2/token";

  static final tokenEndpoint = Uri.parse(tokenUrl);
  static String codeVerifier = "";
  static String _refreshToken = "";

  static String getAuthorizationUrl() {
    final pkcePair = PkcePair.generate(length: 96);
    codeVerifier = pkcePair.codeVerifier;

    OAuthUrlBuilder builder = OAuthUrlBuilder()
        .withUrl(authUrl)
        .withClientId(clientId)
        .withCodeChallenge(codeVerifier)
        .withResponseType("code");

    return builder.toString();
  }

  static Future<bool> getToken(String url) async {
    Uri uri = Uri.parse(url);

    if (uri.queryParameters["code"] == null) {
      return false;
    }

    String code = uri.queryParameters["code"]!;

    OAuthUrlBuilder builder = OAuthUrlBuilder()
        .withGrantType("authorization_code")
        .withClientId(clientId)
        .withCode(code)
        .withCodeVerifier(codeVerifier);

    var response = await http.post(tokenEndpoint,
        body: builder.toString(), headers: {"Content-Type": 'application/x-www-form-urlencoded'});

    var body = jsonDecode(response.body);

    await MyAnimeListService.initService(body["access_token"], tokenType: body["token_type"]);
    saveTokens(response.body);

    return true;
  }

  static Future<void> refreshToken() async {
    OAuthUrlBuilder builder = OAuthUrlBuilder()
        .withClientId(clientId)
        .withGrantType("refresh_token")
        .withRefreshToken(_refreshToken);

    var response = await http.post(tokenEndpoint,
        body: builder.toString(), headers: {"Content-Type": 'application/x-www-form-urlencoded'});

    saveTokens(response.body);
    var body = jsonDecode(response.body);

    await MyAnimeListService.initService(body["access_token"]);
  }

  static Future<void> checkLogIn() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getString("access_token") != null) {
      String accessToken = prefs.getString("access_token")!;
      String tokenType = prefs.getString("token_type")!;
      _refreshToken = prefs.getString("refresh_token")!;

      await MyAnimeListService.initService(accessToken, tokenType: tokenType);
    }

    // await refreshToken();
    // Token Refreshen, wenn veraltet bei Startup
    // Wenn Refresh Token zu alt ist, OAuth2 neu starten
  }

  static Future<void> saveTokens(String json) async {
    var body = jsonDecode(json);

    final prefs = await SharedPreferences.getInstance();
    prefs.setString("access_token", body["access_token"]);
    prefs.setString("token_type", body["token_type"]);
    prefs.setString("refresh_token", body["refresh_token"]);
  }
}
