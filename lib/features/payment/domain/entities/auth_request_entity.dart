// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AuthRequestEntity extends Equatable {
    String token;
  Profile profile;
  AuthRequestEntity({
    required this.token,
    required this.profile,
  });

  @override
  List<Object> get props => [token, profile];
}


class Profile extends Equatable {
  int id;
  User user;
  DateTime createdAt;
  bool active;
  String profileType;
  List<String> phones;
  List<String> companyEmails;
  String companyName;
  String state;
  String country;
  String city;
  String postalCode;
  String street;
  bool emailNotification;
  dynamic orderRetrievalEndpoint;
  dynamic deliveryUpdateEndpoint;
  dynamic logoUrl;
  bool isMobadra;
  String sector;
  int activationMethod;
  int signedUpThrough;
  int failedAttempts;
  List<dynamic> customExportColumns;
  List<dynamic> serverIp;
  dynamic username;
  String primaryPhoneNumber;
  bool primaryPhoneVerified;
  bool isTempPassword;
  DateTime otpSentAt;
  String otpSentTo;
  DateTime otpValidatedAt;
  dynamic awbBanner;
  dynamic emailBanner;
  dynamic identificationNumber;
  String deliveryStatusCallback;
  dynamic merchantExternalLink;
  int merchantStatus;
  bool deactivatedByBank;
  dynamic bankDeactivationReason;
  int bankMerchantStatus;
  dynamic nationalId;
  dynamic superAgent;
  dynamic walletLimitProfile;
  dynamic address;
  dynamic commercialRegistration;
  dynamic commercialRegistrationArea;
  dynamic distributorCode;
  dynamic distributorBranchCode;
  bool allowTerminalOrderId;
  bool allowEncryptionBypass;
  dynamic walletPhoneNumber;
  int suspicious;
  dynamic latitude;
  dynamic longitude;
  BabkStaffs bankStaffs;
  dynamic bankRejectionReason;
  bool bankReceivedDocuments;
  int bankMerchantDigitalStatus;
  dynamic bankDigitalRejectionReason;
  bool filledBusinessData;
  String dayStartTime;
  dynamic dayEndTime;
  bool withholdTransfers;
  String smsSenderName;
  dynamic withholdTransfersReason;
  dynamic withholdTransfersNotes;
  bool canBillDepositWithCard;
  bool canTopupMerchants;
  dynamic topupTransferId;
  bool referralEligible;
  bool paymobAppMerchant;
  dynamic settlementFrequency;
  dynamic dayOfTheWeek;
  dynamic dayOfTheMonth;
  bool allowTransactionNotifications;
  bool allowTransferNotifications;
  int sallefnyAmountWhole;
  int sallefnyFeesWhole;
  dynamic paymobAppFirstLogin;
  dynamic paymobAppLastActivity;
  dynamic acqPartner;
  String salesOwner;
  dynamic dom;
  dynamic bankRelated;
  List<dynamic> permissions;
  Profile({
    required this.id,
    required this.user,
    required this.createdAt,
    required this.active,
    required this.profileType,
    required this.phones,
    required this.companyEmails,
    required this.companyName,
    required this.state,
    required this.country,
    required this.city,
    required this.postalCode,
    required this.street,
    required this.emailNotification,
    required this.orderRetrievalEndpoint,
    required this.deliveryUpdateEndpoint,
    required this.logoUrl,
    required this.isMobadra,
    required this.sector,
    required this.activationMethod,
    required this.signedUpThrough,
    required this.failedAttempts,
    required this.customExportColumns,
    required this.serverIp,
    required this.username,
    required this.primaryPhoneNumber,
    required this.primaryPhoneVerified,
    required this.isTempPassword,
    required this.otpSentAt,
    required this.otpSentTo,
    required this.otpValidatedAt,
    required this.awbBanner,
    required this.emailBanner,
    required this.identificationNumber,
    required this.deliveryStatusCallback,
    required this.merchantExternalLink,
    required this.merchantStatus,
    required this.deactivatedByBank,
    required this.bankDeactivationReason,
    required this.bankMerchantStatus,
    required this.nationalId,
    required this.superAgent,
    required this.walletLimitProfile,
    required this.address,
    required this.commercialRegistration,
    required this.commercialRegistrationArea,
    required this.distributorCode,
    required this.distributorBranchCode,
    required this.allowTerminalOrderId,
    required this.allowEncryptionBypass,
    required this.walletPhoneNumber,
    required this.suspicious,
    required this.latitude,
    required this.longitude,
    required this.bankStaffs,
    required this.bankRejectionReason,
    required this.bankReceivedDocuments,
    required this.bankMerchantDigitalStatus,
    required this.bankDigitalRejectionReason,
    required this.filledBusinessData,
    required this.dayStartTime,
    required this.dayEndTime,
    required this.withholdTransfers,
    required this.smsSenderName,
    required this.withholdTransfersReason,
    required this.withholdTransfersNotes,
    required this.canBillDepositWithCard,
    required this.canTopupMerchants,
    required this.topupTransferId,
    required this.referralEligible,
    required this.paymobAppMerchant,
    required this.settlementFrequency,
    required this.dayOfTheWeek,
    required this.dayOfTheMonth,
    required this.allowTransactionNotifications,
    required this.allowTransferNotifications,
    required this.sallefnyAmountWhole,
    required this.sallefnyFeesWhole,
    required this.paymobAppFirstLogin,
    required this.paymobAppLastActivity,
    required this.acqPartner,
    required this.salesOwner,
    required this.dom,
    required this.bankRelated,
    required this.permissions,
  });


  @override
  List<Object> get props {
    return [
      id,
      user,
      createdAt,
      active,
      profileType,
      phones,
      companyEmails,
      companyName,
      state,
      country,
      city,
      postalCode,
      street,
      emailNotification,
      orderRetrievalEndpoint,
      deliveryUpdateEndpoint,
      logoUrl,
      isMobadra,
      sector,
      activationMethod,
      signedUpThrough,
      failedAttempts,
      customExportColumns,
      serverIp,
      username,
      primaryPhoneNumber,
      primaryPhoneVerified,
      isTempPassword,
      otpSentAt,
      otpSentTo,
      otpValidatedAt,
      awbBanner,
      emailBanner,
      identificationNumber,
      deliveryStatusCallback,
      merchantExternalLink,
      merchantStatus,
      deactivatedByBank,
      bankDeactivationReason,
      bankMerchantStatus,
      nationalId,
      superAgent,
      walletLimitProfile,
      address,
      commercialRegistration,
      commercialRegistrationArea,
      distributorCode,
      distributorBranchCode,
      allowTerminalOrderId,
      allowEncryptionBypass,
      walletPhoneNumber,
      suspicious,
      latitude,
      longitude,
      bankStaffs,
      bankRejectionReason,
      bankReceivedDocuments,
      bankMerchantDigitalStatus,
      bankDigitalRejectionReason,
      filledBusinessData,
      dayStartTime,
      dayEndTime,
      withholdTransfers,
      smsSenderName,
      withholdTransfersReason,
      withholdTransfersNotes,
      canBillDepositWithCard,
      canTopupMerchants,
      topupTransferId,
      referralEligible,
      paymobAppMerchant,
      settlementFrequency,
      dayOfTheWeek,
      dayOfTheMonth,
      allowTransactionNotifications,
      allowTransferNotifications,
      sallefnyAmountWhole,
      sallefnyFeesWhole,
      paymobAppFirstLogin,
      paymobAppLastActivity,
      acqPartner,
      salesOwner,
      dom,
      bankRelated,
      permissions,
    ];
  }
}
class BabkStaffs extends Equatable{
  @override

  List<Object?> get props => [];

}
class User extends Equatable {
    int id;
  String username;
  String firstName;
  String lastName;
  DateTime dateJoined;
  String email;
  bool isActive;
  bool isStaff;
  bool isSuperuser;
  dynamic lastLogin;
  List<dynamic> groups;
  List<int> userPermissions;
  User({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.dateJoined,
    required this.email,
    required this.isActive,
    required this.isStaff,
    required this.isSuperuser,
    required this.lastLogin,
    required this.groups,
    required this.userPermissions,
  });

  @override
  List<Object> get props {
    return [
      id,
      username,
      firstName,
      lastName,
      dateJoined,
      email,
      isActive,
      isStaff,
      isSuperuser,
      lastLogin,
      groups,
      userPermissions,
    ];
  }
}
