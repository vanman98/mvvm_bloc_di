import 'dart:convert';
import 'dart:developer';
import 'dart:math' as Math;
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zalo_flutter/zalo_flutter.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

enum SocialType { facebook, google, zalo, apple }

class LoginSocial {
  LoginSocial._();
  static LoginSocial? _instance;
  factory LoginSocial() {
    _instance ??= LoginSocial();
    return _instance!;
  }

  Future<String?> signIn(SocialType type) async {
    String? accessToken;
    switch (type) {
      case SocialType.google:
        accessToken = await _loginGoogle();
        break;
      case SocialType.facebook:
        accessToken = await _loginFacebook();
        break;
      case SocialType.zalo:
        accessToken = await _loginZalo();
        break;
      case SocialType.apple:
        accessToken = await _loginApple();
        break;
      default:
        break;
    }
    return accessToken;
  }

  Future<String?> _loginGoogle() async {
    final googleLogin = GoogleSignIn(scopes: ["email"]);
    if (await googleLogin.isSignedIn()) await googleLogin.signOut();
    GoogleSignInAccount? result = await googleLogin.signIn();
    final auth = await result?.authentication;
    if (auth != null) {
      log("ACCESSTOKEN GOOGLE :${auth.accessToken}");
      return auth.accessToken;
    }
    return null;
  }

  Future<String?> _loginFacebook() async {
    await FacebookAuth.instance.logOut();
    try {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: ['public_profile', 'email']);
      log("${result.status}");
      switch (result.status) {
        case LoginStatus.success:
          log("ACCESSTOKEN FACEBOOK: ${result.accessToken!.token}");
          return result.accessToken!.token;
        case LoginStatus.cancelled:
          print("LOGINFACEBOOK CANCELLED");
          return null;
        case LoginStatus.failed:
          print("LOGINFACEBOOK FAILED: ${result.message}");
          return null;
        default:
          break;
      }
    } catch (e) {
      log("FACEBOOK ERROR $e");
    }
    return null;
  }

  Future<String?> _loginZalo() async {
    await ZaloFlutter.logout();
    Map<dynamic, dynamic>? data = await ZaloFlutter.login(
      refreshToken: null,
    );
    if (data != null &&
        data['isSuccess'] == true &&
        data['data']['access_token'] != null) {
      // Map<dynamic, dynamic>? profile = await ZaloFlutter.getUserProfile(
      //   accessToken: data['data']['access_token'],
      // );
      log('TOKENZALO: ${data['data']['access_token']}');
      return data['data']['access_token'];
    }
    return null;
  }

  Future<String?> _loginApple() async {
    AuthCredential? authCredential;

    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    final AuthorizationCredentialAppleID credential =
        await SignInWithApple.getAppleIDCredential(scopes: [
      AppleIDAuthorizationScopes.email,
      AppleIDAuthorizationScopes.fullName,
    ], nonce: nonce);
    log("TOKEN APPLE : ${credential.identityToken}");
    return credential.identityToken;
  }

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Math.Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
