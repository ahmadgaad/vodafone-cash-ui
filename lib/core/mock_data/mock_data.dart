import '../../features/home/data/models/balance_model.dart';
import '../../features/home/data/models/promotion_model.dart';
import '../../features/home/data/models/service_card_model.dart';
import '../../features/home/data/models/service_model.dart';
import '../../features/messages/data/models/notification_model.dart';
import '../../features/offers/data/models/offer_model.dart';
import '../../features/profile/data/models/user_profile_model.dart';

class MockData {
  // Simulate network delay
  static Future<void> simulateDelay() async {
    await Future.delayed(
      Duration(milliseconds: 1000 + (DateTime.now().millisecond % 500)),
    );
  }

  // Balance Data
  static BalanceModel getMockBalance() {
    return BalanceModel(
      amount: 572,
      maxAmount: 500,
      unit: 'فليكس',
      daysRemaining: 18,
      lastUpdated: DateTime.now(),
    );
  }

  // Service Cards Data (for carousel)
  static List<ServiceCardModel> getMockServiceCards() {
    final now = DateTime.now();
    return [
      ServiceCardModel(
        type: CardType.balance,
        title: 'فليكس',
        amount: 1572,
        maxAmount: 5000,
        unit: 'فليكس',
        daysRemaining: 18,
        lastUpdated: now,
      ),
      ServiceCardModel(
        type: CardType.internet,
        title: 'الإنترنت',
        amount: 25.5,
        maxAmount: 40,
        unit: 'GB',
        daysRemaining: 18,
        lastUpdated: now,
      ),
      ServiceCardModel(
        type: CardType.homeInternet,
        title: 'الإنترنت المنزلي',
        amount: 450,
        maxAmount: 600,
        unit: 'GB',
        daysRemaining: 12,
        lastUpdated: now,
      ),
    ];
  }

  // Services Data
  static List<ServiceModel> getMockServices() {
    return [
      const ServiceModel(
        id: 'recharge',
        title: 'شحن الرصيد',
        subtitle: '٠.٢ جنيه',
        iconName: 'account_balance_wallet',
        isDark: false,
      ),
      const ServiceModel(
        id: 'online_shop',
        title: 'أونلاين شوب',
        subtitle: 'اكتشف',
        iconName: 'shopping_cart',
        isDark: false,
      ),
      const ServiceModel(
        id: 'movies_music',
        title: 'أفلام وأغاني',
        subtitle: '',
        iconName: 'movie',
        isDark: true,
      ),
      const ServiceModel(
        id: 'vodafone_cash',
        title: 'فودافون كاش',
        subtitle: '',
        iconName: 'payment',
        isDark: true,
      ),
    ];
  }

  // Promotions Data
  static List<PromotionModel> getMockPromotions() {
    return [
      const PromotionModel(
        id: 'promo1',
        title: 'Money Back',
        description: 'ارجعلك ١٠٪ كاش باك على أول عملية دفع بفودافون كاش!',
        ctaText: 'اشترك الآن',
      ),
      const PromotionModel(
        id: 'promo2',
        title: 'Apple Watch Series 11',
        description: 'متـــــاح الان بالتقسيط حتى ١٢ شهر',
        ctaText: 'اطلب الآن',
      ),
      const PromotionModel(
        id: 'promo3',
        title: '٪ خصم ٣٠',
        description: 'على جميع خدمات فودافون',
        ctaText: 'اعرف أكتر',
      ),
      const PromotionModel(
        id: 'promo4',
        title: '٪ خصم ٣٠',
        description: 'على جميع خدمات فودافون',
        ctaText: 'اعرف أكتر',
      ),
      const PromotionModel(
        id: 'promo5',
        title: 'عرض الصيف',
        description: 'ضعف الميجابايتس عند تجديد باقتك قبل نهايتها.',
        ctaText: 'جدد الآن',
      ),
    ];
  }

  // Offers Data
  static List<OfferModel> getMockOffers() {
    return [
      const OfferModel(
        id: 'offer1',
        title: 'عرض تجديد الباقة',
        description: 'جدد باقتك وليك ٦٥.. فليكس بدل ..٥٠ لمدة اسبوع',
        category: 'flex',
        ctaText: 'استمتع بالعرض',
        isFeatured: true,
      ),
      const OfferModel(
        id: 'offer2',
        title: 'زود فليكساتك',
        description: '١٨.. فليكس ...٩٠ فليكس بدل ...٩٠ لمدة شهرين',
        category: 'flex',
        ctaText: 'استمتع بالعرض',
      ),
      const OfferModel(
        id: 'offer3',
        title: 'محتوى ترفيهي',
        description:
            'سلي وقتك! ما تفوتش اشترك بانغو بالي وافرج علي الغاوي علي باقتك',
        category: 'entertainment',
        ctaText: 'اشترك الآن',
      ),
    ];
  }

  // Notifications Data
  static List<NotificationModel> getMockNotifications() {
    final now = DateTime.now();
    return [
      NotificationModel(
        id: 'notif1',
        title: '٣٠٪ فليكسات زيادة',
        description: 'لما تجدد باقتك بفودافون كاش',
        type: 'promo',
        timestamp: now.subtract(const Duration(hours: 2)),
        imageUrl: '',
      ),
      NotificationModel(
        id: 'notif2',
        title: 'لقد استهلكت ٨٠٪ من باقة فليكس',
        description: 'أكتوبر ٢٥, ٢٠٢٥ ١١:٤٧ ص',
        type: 'achievement',
        timestamp: now.subtract(const Duration(hours: 5)),
      ),
      NotificationModel(
        id: 'notif3',
        title: 'خصم خاص لك',
        description: 'احصل على خصم ٢٠٪ على إعادة الشراء',
        type: 'promo',
        timestamp: now.subtract(const Duration(days: 1)),
      ),
    ];
  }

  // User Profile Data
  static UserProfileModel getMockUserProfile() {
    return const UserProfileModel(
      name: 'Ahmed Gad',
      phoneNumber: '01016797297',
      appVersion: '2.05.1.2',
      isLatestVersion: true,
    );
  }

  // More Services Data
  static List<ServiceModel> getMockMoreServices() {
    return [
      const ServiceModel(
        id: 'moneyback',
        title: 'رصيدك معاك Moneyback',
        subtitle: '',
        iconName: 'power_settings_new',
        badge: 'جديد',
      ),
      const ServiceModel(
        id: 'contact',
        title: 'تواصل معنا',
        subtitle: '',
        iconName: 'headset_mic',
      ),
      const ServiceModel(
        id: 'esim',
        title: 'eSIM',
        subtitle: '',
        iconName: 'sim_card',
      ),
      const ServiceModel(
        id: 'wifi_calling',
        title: 'مكالمات الواي فاي',
        subtitle: '',
        iconName: 'wifi_calling',
      ),
      const ServiceModel(
        id: '5g',
        title: 'الجيل الخامس',
        subtitle: '',
        iconName: '5g',
        badge: 'جديد',
      ),
      const ServiceModel(
        id: 'rewards',
        title: 'برنامج شكرا للمكافآت',
        subtitle: '',
        iconName: 'card_giftcard',
      ),
      const ServiceModel(
        id: 'balance_services',
        title: 'خدمات الرصيد',
        subtitle: '',
        iconName: 'account_balance',
      ),
      const ServiceModel(
        id: 'my_devices',
        title: 'أجهزتي',
        subtitle: '',
        iconName: 'devices',
        badge: 'جديد',
      ),
    ];
  }
}
