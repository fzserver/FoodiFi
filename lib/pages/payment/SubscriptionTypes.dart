class SubscriptionTypes {
  int subscriptionId;
  String subscriptionType;
  String subscriptionPrice;

  SubscriptionTypes(
      {this.subscriptionId, this.subscriptionType, this.subscriptionPrice});

  static List<SubscriptionTypes> nList = [
    SubscriptionTypes(
      subscriptionId: 1,
      subscriptionType: "3-Days Subscription",
      subscriptionPrice: "49/meal",
    ),
    SubscriptionTypes(
      subscriptionId: 2,
      subscriptionType: "7-Days Subscription",
      subscriptionPrice: "49/meal",
    ),
    SubscriptionTypes(
      subscriptionId: 3,
      subscriptionType: "14-Days Subscription",
      subscriptionPrice: "49/meal",
    ),
    SubscriptionTypes(
      subscriptionId: 4,
      subscriptionType: "28-Days Subscription",
      subscriptionPrice: "49/meal | 2 MealBox Free",
    ),
  ];
}
