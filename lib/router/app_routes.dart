enum Routes {
  main("/"),
  homeMain("/"),
  activityMain("/activities"),
  pocketMain("/pockets"),
  accountMain("/account"),
  createActivity("/activity/create"),
  activityDetail("/activity/detail"),
  categoryList("/categories"),
  pocketList("/pocket/selection"),
  createPocket("/pocket/create"),
  pocketDetail("/pocket/detail"),
  settings("/settings"),
  login("/logins"),
  register("/register"),
  forgotPassword("/forgot-password");

  const Routes(this.path);

  final String path;
}
