import 'package:social_network_flutter/datasource/local/Local.dart';
import 'package:social_network_flutter/datasource/remote/Remote.dart';
import 'package:social_network_flutter/repository/Repository.dart';

class SocialRepository extends Repository {
  final Local local;

  final Remote remote;

  SocialRepository(this.local, this.remote);

  @override
  Future<bool> isUserAuth() {
    return local.isUserAuth();
  }
}