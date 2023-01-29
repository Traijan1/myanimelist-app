class OAuthUrlBuilder {
  String? url;
  String? responseType;
  String? clientId;
  String? codeChallenge;
  String? code;
  String? grantType;
  String? codeVerifier;
  String? refreshToken;

  OAuthUrlBuilder withUrl(String url) {
    this.url = url;
    return this;
  }

  OAuthUrlBuilder withResponseType(String type) {
    responseType = type;
    return this;
  }

  OAuthUrlBuilder withClientId(String id) {
    clientId = id;
    return this;
  }

  OAuthUrlBuilder withCodeChallenge(String challenge) {
    codeChallenge = challenge;
    return this;
  }

  OAuthUrlBuilder withCode(String code) {
    this.code = code;
    return this;
  }

  OAuthUrlBuilder withGrantType(String type) {
    grantType = type;
    return this;
  }

  OAuthUrlBuilder withCodeVerifier(String verifier) {
    codeVerifier = verifier;
    return this;
  }

  OAuthUrlBuilder withRefreshToken(String token) {
    refreshToken = token;
    return this;
  }

  @override
  String toString() {
    String cache = "";

    if (url != null) {
      cache += '$url?';
    }

    if (responseType != null) {
      cache += 'response_type=$responseType&';
    }

    if (codeChallenge != null) {
      cache += 'code_challenge=$codeChallenge&';
    }

    if (code != null) {
      cache += 'code=$code&';
    }

    if (clientId != null) {
      cache += 'client_id=$clientId&';
    }

    if (grantType != null) {
      cache += 'grant_type=$grantType&';
    }

    if (codeVerifier != null) {
      cache += 'code_verifier=$codeVerifier&';
    }

    if (refreshToken != null) {
      cache += 'refresh_token=$refreshToken&';
    }

    return cache.substring(0, cache.length - 1);
  }
}
