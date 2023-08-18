class Transaction {
  final int id;
  final DateTime Date;
  final String Total;
  final String PaymentStatus;
  final String Username;
  final String UserProfile;

  Transaction({
    required this.id,
    required this.Date,
    required this.Total,
    required this.PaymentStatus,
    required this.Username,
    required this.UserProfile,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
        // userId: json['userId'],
        id: json['id'],
        Date: json['Date'],
        Total: json['Total'],
        PaymentStatus: json['PaymentStatus'],
        Username: json["username"],
        UserProfile: json["userprofile"]);
  }
  Map<String, dynamic> transactionToMap(Transaction transaction) {
    return {
      'id': transaction.id,
      'Date': transaction.Date.toIso8601String(),
      'Total': transaction.Total,
      'PaymentStatus': transaction.PaymentStatus,
      'Username': transaction.Username,
      'UserProfile': transaction.UserProfile,
    };
  }
}
