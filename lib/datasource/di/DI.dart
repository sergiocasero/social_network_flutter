import 'package:social_network_flutter/datasource/local/PreferencesLocal.dart';
import 'package:social_network_flutter/datasource/remote/NetworkRemote.dart';
import 'package:social_network_flutter/repository/Repository.dart';
import 'package:social_network_flutter/repository/SocialRepository.dart';

class DI {
  static Repository repository = SocialRepository(
    PreferencesLocal(),
    NetworkRemote(),
  );
}
