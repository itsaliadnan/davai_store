///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsAr with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsAr({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ar,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ar>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsAr _root = this; // ignore: unused_field

	@override 
	TranslationsAr $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsAr(meta: meta ?? this.$meta);

	// Translations
	@override late final _Translations$home$ar home = _Translations$home$ar._(_root);
	@override late final _Translations$searchBar$ar searchBar = _Translations$searchBar$ar._(_root);
	@override late final _Translations$erorrs$ar erorrs = _Translations$erorrs$ar._(_root);
	@override late final _Translations$auth$ar auth = _Translations$auth$ar._(_root);
	@override late final _Translations$orders$ar orders = _Translations$orders$ar._(_root);
	@override late final _Translations$profile$ar profile = _Translations$profile$ar._(_root);
	@override late final _Translations$changePassword$ar changePassword = _Translations$changePassword$ar._(_root);
	@override late final _Translations$otp$ar otp = _Translations$otp$ar._(_root);
	@override late final _Translations$newPassword$ar newPassword = _Translations$newPassword$ar._(_root);
	@override late final _Translations$products$ar products = _Translations$products$ar._(_root);
	@override late final _Translations$category$ar category = _Translations$category$ar._(_root);
}

// Path: home
class _Translations$home$ar implements Translations$home$en {
	_Translations$home$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get davaiStore => 'متجر دافاي';
	@override String get products => 'المنتجات';
	@override String get categories => 'الفئات';
	@override String get allProducts => 'جميع المنتجات';
	@override String get bestSellers => 'الأكثر مبيعًا';
	@override String get newArrivals => 'الوافدون الجدد';
	@override String get shoes => 'أحذية';
	@override String get bags => 'حقائب';
	@override String get hats => 'قبعات';
	@override String get watches => 'ساعات';
	@override String get showAll => 'عرض الجميع';
	@override String get notifications => ' الإشعارات';
	@override String get shopNow => 'تسوق الان';
	@override String get newCollection => 'تشكيلات جديدة';
	@override String get discounts => 'خصومات';
	@override String get noImagesToDisplay => 'لا توجد صور لعرضها';
	@override String get all => 'الكل';
	@override String get unread => 'غير المقروءة';
	@override String get noNotifications => 'لا يوجد اشعارات';
	@override String get yourNewNotificationsWillAppearHere => ' ستظهر إشعاراتك الجديدة هنا';
	@override String get unableToLoadNotifications => 'تعذر تحميل الإشعارات';
	@override String get retry => 'إعادة المحاولة';
	@override String get anErrorOccurred => 'حدث خطأ';
}

// Path: searchBar
class _Translations$searchBar$ar implements Translations$searchBar$en {
	_Translations$searchBar$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get searchProduct => 'ابحث عن منتج';
}

// Path: erorrs
class _Translations$erorrs$ar implements Translations$erorrs$en {
	_Translations$erorrs$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get noProductsFound => 'لم يتم العثور على منتجات';
	@override String get tryAgain => 'حاول مجددا';
}

// Path: auth
class _Translations$auth$ar implements Translations$auth$en {
	_Translations$auth$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get davaiStore => 'Davai Store';
	@override String get enterYourEmail => 'أدخل بريدك الإلكتروني';
	@override String get enterYourPassword => 'أدخل كلمة المرور الخاصة بك';
	@override String get login => 'تسجيل الدخول';
	@override String get pleaseFillInAllFields => 'يرجى ملء جميع الحقول';
	@override String get invalidEmailFormat => 'تنسيق البريد الإلكتروني غير صالح';
	@override String get loginSuccessful => 'تم تسجيل الدخول بنجاح';
	@override String get loginFailed => 'فشل تسجيل الدخول';
	@override String get loginWithGoogle => 'تسجيل الدخول باستخدام جوجل';
	@override String get dontHaveAnAccount => 'ليس لديك  حساب؟';
	@override String get signUp => 'إنشاء حساب';
	@override String get fillThisFormToCreateAnAccount => 'املأ هذا النموذج لإنشاء حساب';
	@override String get pleaseFillAllTextFields => 'يرجى ملء جميع الحقول النصية';
	@override String get enterYourFullName => 'أدخل اسمك الكامل';
	@override String get confirmYourPassword => 'تأكيد كلمة المرور الخاصة بك';
	@override String get pleaseSelectAProfilePicture => 'يرجى اختيار صورة ملف شخصي';
	@override String get signUpSuccessful => 'تم إنشاء الحساب بنجاح';
	@override String get signUpFailed => 'فشل إنشاء الحساب';
	@override String get alreadyHaveAnAccount => 'هل لديك حساب بالفعل?';
	@override String get signupWithGoogle => 'إنشاء حساب باستخدام جوجل';
	@override String get forgetPassword => 'نسيت كلمة المرور؟';
	@override String get wrongPassOrEmail => 'البريد الإلكتروني أو كلمة المرور خاطئة';
	@override String get loginTitle => 'تسجيل الدخول\nإلى حسابك';
	@override String get isLoggedIn => 'هل تم تسجيل الدخول؟';
	@override String get userId => 'معرف المستخدم';
	@override String get welcome => 'مرحبا';
	@override String get toYourAccount => 'الى حسابك';
	@override String get firstName => 'الاسم الاول';
	@override String get familyName => 'اسم العائلة';
	@override String get email => 'البريد الإلكتروني';
	@override String get password => 'كلمة المرور';
	@override String get otpVerified => 'تم التحقق من OTP';
	@override String get otp => ' otp ';
	@override String get fillAllFields => 'املأ جميع الحقول';
	@override String get passwordsDoNotMatch => 'كلمتا المرور غير متطابقتين';
	@override String get passwordUpdatedSuccessfully => 'تم تحديث كلمة المرور بنجاح';
	@override String get otpSentToYourEmail => 'تم ارسال رمز التحقق الى بريدك الالكتروني';
}

// Path: orders
class _Translations$orders$ar implements Translations$orders$en {
	_Translations$orders$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get myOrders => 'طلباتي';
	@override String get noOrdersFound => 'لم يتم العثور على طلبات';
	@override String get orderDetails => 'تفاصيل الطلب';
	@override String get totalAmount => 'المبلغ الإجمالي';
	@override String get orderStatus => 'حالة الطلب';
	@override String get pending => 'قيد الانتظار';
	@override String get shipped => 'تم الشحن';
	@override String get delivered => 'تم التسليم';
	@override String get cancelled => 'تم الإلغاء';
}

// Path: profile
class _Translations$profile$ar implements Translations$profile$en {
	_Translations$profile$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get myAccount => 'حسابي';
	@override String get profile => 'الملف الشخصي';
	@override String get editProfile => 'تعديل الملف الشخصي';
	@override String get secureYourAccount => 'تأمين حسابك';
	@override String get fullName => 'الاسم الكامل';
	@override String get email => 'البريد الإلكتروني';
	@override String get phoneNumber => 'رقم الهاتف';
	@override String get address => 'العنوان';
	@override String get saveChanges => 'حفظ التغييرات';
	@override String get logout => 'تسجيل الخروج';
	@override String get settings => 'الإعدادات';
	@override String get language => 'اللغة';
	@override String get theme => ' المظهر';
	@override String get selectMode => 'اختر الوضع';
	@override String get notifications => 'الإشعارات';
	@override String get privacyAndSecurity => 'الخصوصية والأمان';
	@override String get helpAndSupport => 'المساعدة والدعم';
	@override String get about => 'حول';
	@override String get selectLanguage => 'اختر اللغة';
	@override String get english => 'الإنجليزية';
	@override String get arabic => 'العربية';
	@override String get enableNotifications => 'تمكين الإشعارات';
	@override String get disableNotifications => 'تعطيل الإشعارات';
	@override String get light => 'فاتح';
	@override String get dark => 'داكن';
	@override String get system => 'النظام';
	@override String get more => 'المزيد';
	@override String get prefrences => ' التفضيلات';
	@override String get security => 'الامان';
	@override String get account => 'الحساب';
	@override String get changePassword => 'تغيير كلمة المرور';
	@override String get currentPassword => 'كلمة المرور الحالية';
	@override String get newPassword => 'كلمة المرور الجديدة';
	@override String get confirmNewPassword => 'تأكيد كلمة المرور الجديدة';
	@override String get passwordChangedSuccessfully => 'تم تغيير كلمة المرور بنجاح';
	@override String get passwordChangeFailed => 'فشل تغيير كلمة المرور';
	@override String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';
	@override String get pleaseFillAllFields => 'يرجى ملء جميع الحقول';
	@override String get invalidCurrentPassword => 'كلمة المرور الحالية غير صحيحة';
	@override String get passwordRequirements => 'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل، بما في ذلك حرف كبير وحرف صغير ورقم ورمز خاص';
	@override String get forgotPassword => 'نسيت كلمة المرور؟';
	@override String get resetPassword => 'إعادة تعيين كلمة المرور';
	@override String get holdToLogout => 'اضغط  باستمرار لتسجيل الخروج';
	@override String get keepHolding => 'استمر في الضغط';
	@override String get emailHasBeenCopied => 'تم نسخ الإيميل';
	@override String get needHelp => 'تحتاج مساعدة ؟';
	@override String get contactUsAndWeWillGetBackToYou => 'راسلنا وسوف نرد عليك بأقرب وقت';
	@override String get davaiAbout => ' Davai هي منصة تسوق لاكتشاف منتجات الإضاءة والديكور والهدايا وغيرها';
	@override String get aboutDavaiTitle => 'نبذة عن  Davai';
	@override String get yourHomeYourStyle => 'منزلك، أسلوبك';
	@override String get davai => 'Davai';
	@override String get rateTheApp => ' قيم التطبيق';
	@override String get support => 'الدعم';
	@override String get editName => 'تعديل الاسم';
	@override String get enterName => 'أدخل الاسم';
	@override String get cancel => 'إلغاء';
	@override String get save => 'حفظ';
	@override String get chooseLanguage => 'اختر اللغة';
	@override String get search => 'البحث';
}

// Path: changePassword
class _Translations$changePassword$ar implements Translations$changePassword$en {
	_Translations$changePassword$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get changePassword => 'تغيير كلمة المرور';
	@override String get forgotPassword => 'نسيت كلمة المرور';
	@override String get currentPassword => 'كلمة المرور الحالية';
	@override String get newPassword => 'كلمة المرور الجديدة';
	@override String get confirmNewPassword => 'تأكيد كلمة المرور الجديدة';
	@override String get saveChanges => 'حفظ التغييرات';
	@override String get passwordChangedSuccessfully => 'تم تغيير كلمة المرور بنجاح';
	@override String get passwordChangeFailed => 'فشل تغيير كلمة المرور';
	@override String get passwordsDoNotMatch => 'كلمات المرور غير متطابقة';
	@override String get pleaseFillAllFields => 'يرجى ملء جميع الحقول';
	@override String get invalidCurrentPassword => 'كلمة المرور الحالية غير صحيحة';
	@override String get passwordRequirements => 'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل، بما في ذلك حرف كبير وحرف صغير ورقم ورمز خاص';
	@override String get updatePassword => '  تحديث كلمة المرور';
	@override String get forgotPasswordHint => 'رجاءًأدخل عنوان بريدك الإلكتروني لتلقي رمز التحقق';
	@override String get emailHint => 'عنوان البريد الإلكتروني';
	@override String get send => 'أرسال';
}

// Path: otp
class _Translations$otp$ar implements Translations$otp$en {
	_Translations$otp$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get verifyEmail => 'أكد بريدك الالكتروني';
	@override String get otpHint => 'رجاءً ادخل الرمز المرسل الى بريدك الالكتروني';
	@override String get verify => 'تحقّق';
}

// Path: newPassword
class _Translations$newPassword$ar implements Translations$newPassword$en {
	_Translations$newPassword$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get newPassword => 'كلمة المرور الجديدة';
	@override String get newPasswordHint => 'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمة المرور المستخدمة سابقاً';
	@override String get save => ' حفظ';
}

// Path: products
class _Translations$products$ar implements Translations$products$en {
	_Translations$products$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get addToCart => 'اضف الى السلة';
	@override String get newest => ' الاحدث';
	@override String get priceLowtoHigh => 'السعر: من الأقل إلى الأعلى';
	@override String get priceHightoLow => 'السعر: من الأقل إلى الأعلى';
	@override String get mostPopular => 'الأكثر شعبية';
	@override String get sortBy => 'ترتيب حسب';
	@override String get noProducts => 'لا توجد منتجات';
	@override String get allProducts => 'جميع المنتجات';
	@override String get description => 'الوصف';
	@override String get noDescriptionAvailable => 'لا يوجد وصف متاح';
	@override String get hide => 'إخفاء';
	@override String get readMore => 'قراءة المزيد';
	@override String get quantity => ' الكمية';
	@override String get cart => ' السلة';
	@override String get noFavoritesYet => 'لا توجد منتجات مفضلة حتى الآن';
	@override String get favorites => 'المفضلة';
	@override String get products => 'المنتجات';
}

// Path: category
class _Translations$category$ar implements Translations$category$en {
	_Translations$category$ar._(this._root);

	final TranslationsAr _root; // ignore: unused_field

	// Translations
	@override String get browseBy => 'تصفح حسب';
	@override String get category => 'الفئة';
	@override String get noCategories => ' لا يوجد فئات';
	@override String get mostProducts => ' الاكثر منتجات';
}

/// The flat map containing all translations for locale <ar>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsAr {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'home.davaiStore' => 'متجر دافاي',
			'home.products' => 'المنتجات',
			'home.categories' => 'الفئات',
			'home.allProducts' => 'جميع المنتجات',
			'home.bestSellers' => 'الأكثر مبيعًا',
			'home.newArrivals' => 'الوافدون الجدد',
			'home.shoes' => 'أحذية',
			'home.bags' => 'حقائب',
			'home.hats' => 'قبعات',
			'home.watches' => 'ساعات',
			'home.showAll' => 'عرض الجميع',
			'home.notifications' => ' الإشعارات',
			'home.shopNow' => 'تسوق الان',
			'home.newCollection' => 'تشكيلات جديدة',
			'home.discounts' => 'خصومات',
			'home.noImagesToDisplay' => 'لا توجد صور لعرضها',
			'home.all' => 'الكل',
			'home.unread' => 'غير المقروءة',
			'home.noNotifications' => 'لا يوجد اشعارات',
			'home.yourNewNotificationsWillAppearHere' => ' ستظهر إشعاراتك الجديدة هنا',
			'home.unableToLoadNotifications' => 'تعذر تحميل الإشعارات',
			'home.retry' => 'إعادة المحاولة',
			'home.anErrorOccurred' => 'حدث خطأ',
			'searchBar.searchProduct' => 'ابحث عن منتج',
			'erorrs.noProductsFound' => 'لم يتم العثور على منتجات',
			'erorrs.tryAgain' => 'حاول مجددا',
			'auth.davaiStore' => 'Davai Store',
			'auth.enterYourEmail' => 'أدخل بريدك الإلكتروني',
			'auth.enterYourPassword' => 'أدخل كلمة المرور الخاصة بك',
			'auth.login' => 'تسجيل الدخول',
			'auth.pleaseFillInAllFields' => 'يرجى ملء جميع الحقول',
			'auth.invalidEmailFormat' => 'تنسيق البريد الإلكتروني غير صالح',
			'auth.loginSuccessful' => 'تم تسجيل الدخول بنجاح',
			'auth.loginFailed' => 'فشل تسجيل الدخول',
			'auth.loginWithGoogle' => 'تسجيل الدخول باستخدام جوجل',
			'auth.dontHaveAnAccount' => 'ليس لديك  حساب؟',
			'auth.signUp' => 'إنشاء حساب',
			'auth.fillThisFormToCreateAnAccount' => 'املأ هذا النموذج لإنشاء حساب',
			'auth.pleaseFillAllTextFields' => 'يرجى ملء جميع الحقول النصية',
			'auth.enterYourFullName' => 'أدخل اسمك الكامل',
			'auth.confirmYourPassword' => 'تأكيد كلمة المرور الخاصة بك',
			'auth.pleaseSelectAProfilePicture' => 'يرجى اختيار صورة ملف شخصي',
			'auth.signUpSuccessful' => 'تم إنشاء الحساب بنجاح',
			'auth.signUpFailed' => 'فشل إنشاء الحساب',
			'auth.alreadyHaveAnAccount' => 'هل لديك حساب بالفعل?',
			'auth.signupWithGoogle' => 'إنشاء حساب باستخدام جوجل',
			'auth.forgetPassword' => 'نسيت كلمة المرور؟',
			'auth.wrongPassOrEmail' => 'البريد الإلكتروني أو كلمة المرور خاطئة',
			'auth.loginTitle' => 'تسجيل الدخول\nإلى حسابك',
			'auth.isLoggedIn' => 'هل تم تسجيل الدخول؟',
			'auth.userId' => 'معرف المستخدم',
			'auth.welcome' => 'مرحبا',
			'auth.toYourAccount' => 'الى حسابك',
			'auth.firstName' => 'الاسم الاول',
			'auth.familyName' => 'اسم العائلة',
			'auth.email' => 'البريد الإلكتروني',
			'auth.password' => 'كلمة المرور',
			'auth.otpVerified' => 'تم التحقق من OTP',
			'auth.otp' => ' otp ',
			'auth.fillAllFields' => 'املأ جميع الحقول',
			'auth.passwordsDoNotMatch' => 'كلمتا المرور غير متطابقتين',
			'auth.passwordUpdatedSuccessfully' => 'تم تحديث كلمة المرور بنجاح',
			'auth.otpSentToYourEmail' => 'تم ارسال رمز التحقق الى بريدك الالكتروني',
			'orders.myOrders' => 'طلباتي',
			'orders.noOrdersFound' => 'لم يتم العثور على طلبات',
			'orders.orderDetails' => 'تفاصيل الطلب',
			'orders.totalAmount' => 'المبلغ الإجمالي',
			'orders.orderStatus' => 'حالة الطلب',
			'orders.pending' => 'قيد الانتظار',
			'orders.shipped' => 'تم الشحن',
			'orders.delivered' => 'تم التسليم',
			'orders.cancelled' => 'تم الإلغاء',
			'profile.myAccount' => 'حسابي',
			'profile.profile' => 'الملف الشخصي',
			'profile.editProfile' => 'تعديل الملف الشخصي',
			'profile.secureYourAccount' => 'تأمين حسابك',
			'profile.fullName' => 'الاسم الكامل',
			'profile.email' => 'البريد الإلكتروني',
			'profile.phoneNumber' => 'رقم الهاتف',
			'profile.address' => 'العنوان',
			'profile.saveChanges' => 'حفظ التغييرات',
			'profile.logout' => 'تسجيل الخروج',
			'profile.settings' => 'الإعدادات',
			'profile.language' => 'اللغة',
			'profile.theme' => ' المظهر',
			'profile.selectMode' => 'اختر الوضع',
			'profile.notifications' => 'الإشعارات',
			'profile.privacyAndSecurity' => 'الخصوصية والأمان',
			'profile.helpAndSupport' => 'المساعدة والدعم',
			'profile.about' => 'حول',
			'profile.selectLanguage' => 'اختر اللغة',
			'profile.english' => 'الإنجليزية',
			'profile.arabic' => 'العربية',
			'profile.enableNotifications' => 'تمكين الإشعارات',
			'profile.disableNotifications' => 'تعطيل الإشعارات',
			'profile.light' => 'فاتح',
			'profile.dark' => 'داكن',
			'profile.system' => 'النظام',
			'profile.more' => 'المزيد',
			'profile.prefrences' => ' التفضيلات',
			'profile.security' => 'الامان',
			'profile.account' => 'الحساب',
			'profile.changePassword' => 'تغيير كلمة المرور',
			'profile.currentPassword' => 'كلمة المرور الحالية',
			'profile.newPassword' => 'كلمة المرور الجديدة',
			'profile.confirmNewPassword' => 'تأكيد كلمة المرور الجديدة',
			'profile.passwordChangedSuccessfully' => 'تم تغيير كلمة المرور بنجاح',
			'profile.passwordChangeFailed' => 'فشل تغيير كلمة المرور',
			'profile.passwordsDoNotMatch' => 'كلمات المرور غير متطابقة',
			'profile.pleaseFillAllFields' => 'يرجى ملء جميع الحقول',
			'profile.invalidCurrentPassword' => 'كلمة المرور الحالية غير صحيحة',
			'profile.passwordRequirements' => 'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل، بما في ذلك حرف كبير وحرف صغير ورقم ورمز خاص',
			'profile.forgotPassword' => 'نسيت كلمة المرور؟',
			'profile.resetPassword' => 'إعادة تعيين كلمة المرور',
			'profile.holdToLogout' => 'اضغط  باستمرار لتسجيل الخروج',
			'profile.keepHolding' => 'استمر في الضغط',
			'profile.emailHasBeenCopied' => 'تم نسخ الإيميل',
			'profile.needHelp' => 'تحتاج مساعدة ؟',
			'profile.contactUsAndWeWillGetBackToYou' => 'راسلنا وسوف نرد عليك بأقرب وقت',
			'profile.davaiAbout' => ' Davai هي منصة تسوق لاكتشاف منتجات الإضاءة والديكور والهدايا وغيرها',
			'profile.aboutDavaiTitle' => 'نبذة عن  Davai',
			'profile.yourHomeYourStyle' => 'منزلك، أسلوبك',
			'profile.davai' => 'Davai',
			'profile.rateTheApp' => ' قيم التطبيق',
			'profile.support' => 'الدعم',
			'profile.editName' => 'تعديل الاسم',
			'profile.enterName' => 'أدخل الاسم',
			'profile.cancel' => 'إلغاء',
			'profile.save' => 'حفظ',
			'profile.chooseLanguage' => 'اختر اللغة',
			'profile.search' => 'البحث',
			'changePassword.changePassword' => 'تغيير كلمة المرور',
			'changePassword.forgotPassword' => 'نسيت كلمة المرور',
			'changePassword.currentPassword' => 'كلمة المرور الحالية',
			'changePassword.newPassword' => 'كلمة المرور الجديدة',
			'changePassword.confirmNewPassword' => 'تأكيد كلمة المرور الجديدة',
			'changePassword.saveChanges' => 'حفظ التغييرات',
			'changePassword.passwordChangedSuccessfully' => 'تم تغيير كلمة المرور بنجاح',
			'changePassword.passwordChangeFailed' => 'فشل تغيير كلمة المرور',
			'changePassword.passwordsDoNotMatch' => 'كلمات المرور غير متطابقة',
			'changePassword.pleaseFillAllFields' => 'يرجى ملء جميع الحقول',
			'changePassword.invalidCurrentPassword' => 'كلمة المرور الحالية غير صحيحة',
			'changePassword.passwordRequirements' => 'يجب أن تحتوي كلمة المرور على 8 أحرف على الأقل، بما في ذلك حرف كبير وحرف صغير ورقم ورمز خاص',
			'changePassword.updatePassword' => '  تحديث كلمة المرور',
			'changePassword.forgotPasswordHint' => 'رجاءًأدخل عنوان بريدك الإلكتروني لتلقي رمز التحقق',
			'changePassword.emailHint' => 'عنوان البريد الإلكتروني',
			'changePassword.send' => 'أرسال',
			'otp.verifyEmail' => 'أكد بريدك الالكتروني',
			'otp.otpHint' => 'رجاءً ادخل الرمز المرسل الى بريدك الالكتروني',
			'otp.verify' => 'تحقّق',
			'newPassword.newPassword' => 'كلمة المرور الجديدة',
			'newPassword.newPasswordHint' => 'يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمة المرور المستخدمة سابقاً',
			'newPassword.save' => ' حفظ',
			'products.addToCart' => 'اضف الى السلة',
			'products.newest' => ' الاحدث',
			'products.priceLowtoHigh' => 'السعر: من الأقل إلى الأعلى',
			'products.priceHightoLow' => 'السعر: من الأقل إلى الأعلى',
			'products.mostPopular' => 'الأكثر شعبية',
			'products.sortBy' => 'ترتيب حسب',
			'products.noProducts' => 'لا توجد منتجات',
			'products.allProducts' => 'جميع المنتجات',
			'products.description' => 'الوصف',
			'products.noDescriptionAvailable' => 'لا يوجد وصف متاح',
			'products.hide' => 'إخفاء',
			'products.readMore' => 'قراءة المزيد',
			'products.quantity' => ' الكمية',
			'products.cart' => ' السلة',
			'products.noFavoritesYet' => 'لا توجد منتجات مفضلة حتى الآن',
			'products.favorites' => 'المفضلة',
			'products.products' => 'المنتجات',
			'category.browseBy' => 'تصفح حسب',
			'category.category' => 'الفئة',
			'category.noCategories' => ' لا يوجد فئات',
			'category.mostProducts' => ' الاكثر منتجات',
			_ => null,
		};
	}
}
