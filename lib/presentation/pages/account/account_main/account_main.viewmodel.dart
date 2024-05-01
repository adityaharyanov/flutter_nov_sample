import 'package:flutter_nov_trial/presentation/pages/account/account_main/account_main.router.dart';
import 'package:flutter_nov_trial/utils/viewmodel.dart';
import 'package:share_plus/share_plus.dart';

class AccountMainViewModel extends RoutableViewModel<AccountMainRouter> {
  share() {
    Share.share("Ini apps bagus lhoo", subject: "Share");
  }

  openSettings() {
    router.pushSettings();
  }
}
