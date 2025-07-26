class RegisteredUser {
  final String? fullName;
  final String? email;
  final String? mobile;
  final String? jobTitle;
  final String? company;
  final String? registrationId;

  RegisteredUser(
      {this.fullName,
      this.email,
      this.company,
      this.jobTitle,
      this.registrationId,
      this.mobile});

  factory RegisteredUser.fromJson(Map<String, dynamic> json) {
    return RegisteredUser(
      registrationId: json['registrationID'] ?? "",
      fullName: json['fullName'] ?? "",
      email: json['email'] ?? "",
      jobTitle: json['jobTitle'] ?? "",
      mobile: json['mobile'] ?? "",
      company: json['company'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'registration_id': registrationId,
      'full_name': fullName,
      'email': email,
      'job_title': jobTitle,
      'mobile': mobile,
      'company': company
    };
  }
}
