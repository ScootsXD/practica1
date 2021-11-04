import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:practica/src/models/image_model.dart';
import 'package:unsplash_client/unsplash_client.dart';

class ApiImages
{
  Future<List<Photo>> getRandomImages() async
  {
    final client = UnsplashClient(
      settings: ClientSettings(
        credentials: AppCredentials(
          accessKey: '8Ru_a78gdmoaLcakTbU7LxLdsGXwEI9jSP0dVpN_g4I',
          secretKey: 'D0UrDiBBCHYjGZHcQQsrmHKS7eSK0lW1WWVCaBg5dTI',
        )
      ),
    );

    final images = await client.photos.random(count: 15).goAndGet();

    return images;
  }
}