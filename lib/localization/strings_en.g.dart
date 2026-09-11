///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$home$en home = Translations$home$en._(_root);
	late final Translations$auth$en auth = Translations$auth$en._(_root);
	late final Translations$orders$en orders = Translations$orders$en._(_root);
	late final Translations$profile$en profile = Translations$profile$en._(_root);
	late final Translations$changePassword$en changePassword = Translations$changePassword$en._(_root);
	late final Translations$otp$en otp = Translations$otp$en._(_root);
	late final Translations$newPassword$en newPassword = Translations$newPassword$en._(_root);
}

// Path: home
class Translations$home$en {
	Translations$home$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Davai Store'
	String get davaiStore => 'Davai Store';

	/// en: 'Search Product'
	String get searchProduct => 'Search Product';

	/// en: 'Products'
	String get products => 'Products';

	/// en: 'Categories'
	String get categories => 'Categories';

	/// en: 'No products found'
	String get noProductsFound => 'No products found';

	/// en: 'All Products'
	String get allProducts => 'All Products';

	/// en: 'Best Sellers'
	String get bestSellers => 'Best Sellers';

	/// en: 'New Arrivals'
	String get newArrivals => 'New Arrivals';

	/// en: 'Shoes'
	String get shoes => 'Shoes';

	/// en: 'Bags'
	String get bags => 'Bags';

	/// en: 'Hats'
	String get hats => 'Hats';

	/// en: 'Watches'
	String get watches => 'Watches';

	/// en: 'Show All'
	String get showAll => 'Show All';

	/// en: ' Notifications'
	String get notifications => ' Notifications';
}

// Path: auth
class Translations$auth$en {
	Translations$auth$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Davai Store'
	String get davaiStore => 'Davai Store';

	/// en: 'Enter your email'
	String get enterYourEmail => 'Enter your email';

	/// en: 'Enter your password'
	String get enterYourPassword => 'Enter your password';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Please fill in all fields'
	String get pleaseFillInAllFields => 'Please fill in all fields';

	/// en: 'Invalid email format'
	String get invalidEmailFormat => 'Invalid email format';

	/// en: 'Login successful'
	String get loginSuccessful => 'Login successful';

	/// en: 'Login failed'
	String get loginFailed => 'Login failed';

	/// en: 'Login with Google'
	String get loginWithGoogle => 'Login with Google';

	/// en: 'Don't have an account?'
	String get dontHaveAnAccount => 'Don\'t have an account?';

	/// en: 'Fill this form to create an account'
	String get fillThisFormToCreateAnAccount => 'Fill this form to create an account';

	/// en: 'Sign Up'
	String get signUp => 'Sign Up';

	/// en: 'Enter your full name'
	String get enterYourFullName => 'Enter your full name';

	/// en: 'Confirm your password'
	String get confirmYourPassword => 'Confirm your password';

	/// en: 'Please fill all Text fields'
	String get pleaseFillAllTextFields => 'Please fill all Text fields';

	/// en: 'Please select a profile picture'
	String get pleaseSelectAProfilePicture => 'Please select a profile picture';

	/// en: 'Sign up successful'
	String get signUpSuccessful => 'Sign up successful';

	/// en: 'Sign up failed'
	String get signUpFailed => 'Sign up failed';

	/// en: 'Already have an account?'
	String get alreadyHaveAnAccount => 'Already have an account?';

	/// en: 'Sign up with Google'
	String get signupWithGoogle => 'Sign up with Google';

	/// en: 'Forgot Password?'
	String get forgetPassword => 'Forgot Password?';

	/// en: 'Wrong email or password'
	String get wrongPassOrEmail => 'Wrong email or password';

	/// en: 'Login To Your Account'
	String get loginTitle => 'Login\nTo Your Account';

	/// en: 'Is Logged In'
	String get isLoggedIn => 'Is Logged In';

	/// en: 'User ID'
	String get userId => 'User ID';

	/// en: 'Welcome'
	String get welcome => 'Welcome';

	/// en: 'to your account'
	String get toYourAccount => 'to your account';

	/// en: 'First Name'
	String get firstName => 'First Name';

	/// en: 'Famaily Name'
	String get familyName => 'Famaily Name';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Password'
	String get password => 'Password';
}

// Path: orders
class Translations$orders$en {
	Translations$orders$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'My Orders'
	String get myOrders => 'My Orders';

	/// en: 'No orders found'
	String get noOrdersFound => 'No orders found';

	/// en: 'Order Details'
	String get orderDetails => 'Order Details';

	/// en: 'Total Amount'
	String get totalAmount => 'Total Amount';

	/// en: 'Order Status'
	String get orderStatus => 'Order Status';

	/// en: 'Pending'
	String get pending => 'Pending';

	/// en: 'Shipped'
	String get shipped => 'Shipped';

	/// en: 'Delivered'
	String get delivered => 'Delivered';

	/// en: 'Cancelled'
	String get cancelled => 'Cancelled';
}

// Path: profile
class Translations$profile$en {
	Translations$profile$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'My Account'
	String get myAccount => 'My Account';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Edit Profile'
	String get editProfile => 'Edit Profile';

	/// en: 'Secure your account'
	String get secureYourAccount => 'Secure your account';

	/// en: 'Full Name'
	String get fullName => 'Full Name';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'Phone Number'
	String get phoneNumber => 'Phone Number';

	/// en: 'Address'
	String get address => 'Address';

	/// en: 'Save Changes'
	String get saveChanges => 'Save Changes';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'Select Mode'
	String get selectMode => 'Select Mode';

	/// en: 'Notifications'
	String get notifications => 'Notifications';

	/// en: 'Privacy & Security'
	String get privacyAndSecurity => 'Privacy & Security';

	/// en: 'Help & Support'
	String get helpAndSupport => 'Help & Support';

	/// en: 'About'
	String get about => 'About';

	/// en: 'Select Language'
	String get selectLanguage => 'Select Language';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Arabic'
	String get arabic => 'Arabic';

	/// en: 'Enable Notifications'
	String get enableNotifications => 'Enable Notifications';

	/// en: 'Disable Notifications'
	String get disableNotifications => 'Disable Notifications';

	/// en: 'Light'
	String get light => 'Light';

	/// en: 'Dark'
	String get dark => 'Dark';

	/// en: 'System'
	String get system => 'System';

	/// en: 'More'
	String get more => 'More';

	/// en: 'Prefrences'
	String get prefrences => 'Prefrences';

	/// en: 'security'
	String get security => 'security';

	/// en: 'account'
	String get account => 'account';

	/// en: 'Change Password'
	String get changePassword => 'Change Password';

	/// en: 'Current Password'
	String get currentPassword => 'Current Password';

	/// en: 'New Password'
	String get newPassword => 'New Password';

	/// en: 'Confirm New Password'
	String get confirmNewPassword => 'Confirm New Password';

	/// en: 'Password changed successfully'
	String get passwordChangedSuccessfully => 'Password changed successfully';

	/// en: 'Password change failed'
	String get passwordChangeFailed => 'Password change failed';

	/// en: 'Passwords do not match'
	String get passwordsDoNotMatch => 'Passwords do not match';

	/// en: 'Please fill all fields'
	String get pleaseFillAllFields => 'Please fill all fields';

	/// en: 'Invalid current password'
	String get invalidCurrentPassword => 'Invalid current password';

	/// en: 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.'
	String get passwordRequirements => 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.';

	/// en: 'Forgot Password?'
	String get forgotPassword => 'Forgot Password?';

	/// en: 'Reset Password'
	String get resetPassword => 'Reset Password';
}

// Path: changePassword
class Translations$changePassword$en {
	Translations$changePassword$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Change Password'
	String get changePassword => 'Change Password';

	/// en: 'Forgot Password'
	String get forgotPassword => 'Forgot Password';

	/// en: 'Current Password'
	String get currentPassword => 'Current Password';

	/// en: 'New Password'
	String get newPassword => 'New Password';

	/// en: 'Confirm New Password'
	String get confirmNewPassword => 'Confirm New Password';

	/// en: 'Save Changes'
	String get saveChanges => 'Save Changes';

	/// en: 'Password changed successfully'
	String get passwordChangedSuccessfully => 'Password changed successfully';

	/// en: 'Password change failed'
	String get passwordChangeFailed => 'Password change failed';

	/// en: 'Passwords do not match'
	String get passwordsDoNotMatch => 'Passwords do not match';

	/// en: 'Please fill all fields'
	String get pleaseFillAllFields => 'Please fill all fields';

	/// en: 'Invalid current password'
	String get invalidCurrentPassword => 'Invalid current password';

	/// en: 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.'
	String get passwordRequirements => 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.';

	/// en: 'Update Password'
	String get updatePassword => 'Update Password';

	/// en: 'Please Enter Your Email Address To Receive Verification Code.'
	String get forgotPasswordHint => 'Please Enter Your Email Address To Receive Verification Code.';

	/// en: 'Email Address'
	String get emailHint => 'Email Address';

	/// en: 'Send'
	String get send => 'Send';
}

// Path: otp
class Translations$otp$en {
	Translations$otp$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Verify Your Email'
	String get verifyEmail => 'Verify Your Email';

	/// en: 'Please Enter The Code Sent To Your Email'
	String get otpHint => 'Please Enter The Code Sent To Your Email';

	/// en: 'Verify'
	String get verify => 'Verify';
}

// Path: newPassword
class Translations$newPassword$en {
	Translations$newPassword$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'New Password'
	String get newPassword => 'New Password';

	/// en: 'Your New Password Must Be Different From Previously Used Password'
	String get newPasswordHint => 'Your New Password Must Be Different From  Previously Used Password';

	/// en: ' Save'
	String get save => ' Save';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'home.davaiStore' => 'Davai Store',
			'home.searchProduct' => 'Search Product',
			'home.products' => 'Products',
			'home.categories' => 'Categories',
			'home.noProductsFound' => 'No products found',
			'home.allProducts' => 'All Products',
			'home.bestSellers' => 'Best Sellers',
			'home.newArrivals' => 'New Arrivals',
			'home.shoes' => 'Shoes',
			'home.bags' => 'Bags',
			'home.hats' => 'Hats',
			'home.watches' => 'Watches',
			'home.showAll' => 'Show All',
			'home.notifications' => ' Notifications',
			'auth.davaiStore' => 'Davai Store',
			'auth.enterYourEmail' => 'Enter your email',
			'auth.enterYourPassword' => 'Enter your password',
			'auth.login' => 'Login',
			'auth.pleaseFillInAllFields' => 'Please fill in all fields',
			'auth.invalidEmailFormat' => 'Invalid email format',
			'auth.loginSuccessful' => 'Login successful',
			'auth.loginFailed' => 'Login failed',
			'auth.loginWithGoogle' => 'Login with Google',
			'auth.dontHaveAnAccount' => 'Don\'t have an account?',
			'auth.fillThisFormToCreateAnAccount' => 'Fill this form to create an account',
			'auth.signUp' => 'Sign Up',
			'auth.enterYourFullName' => 'Enter your full name',
			'auth.confirmYourPassword' => 'Confirm your password',
			'auth.pleaseFillAllTextFields' => 'Please fill all Text fields',
			'auth.pleaseSelectAProfilePicture' => 'Please select a profile picture',
			'auth.signUpSuccessful' => 'Sign up successful',
			'auth.signUpFailed' => 'Sign up failed',
			'auth.alreadyHaveAnAccount' => 'Already have an account?',
			'auth.signupWithGoogle' => 'Sign up with Google',
			'auth.forgetPassword' => 'Forgot Password?',
			'auth.wrongPassOrEmail' => 'Wrong email or password',
			'auth.loginTitle' => 'Login\nTo Your Account',
			'auth.isLoggedIn' => 'Is Logged In',
			'auth.userId' => 'User ID',
			'auth.welcome' => 'Welcome',
			'auth.toYourAccount' => 'to your account',
			'auth.firstName' => 'First Name',
			'auth.familyName' => 'Famaily Name',
			'auth.email' => 'Email',
			'auth.password' => 'Password',
			'orders.myOrders' => 'My Orders',
			'orders.noOrdersFound' => 'No orders found',
			'orders.orderDetails' => 'Order Details',
			'orders.totalAmount' => 'Total Amount',
			'orders.orderStatus' => 'Order Status',
			'orders.pending' => 'Pending',
			'orders.shipped' => 'Shipped',
			'orders.delivered' => 'Delivered',
			'orders.cancelled' => 'Cancelled',
			'profile.myAccount' => 'My Account',
			'profile.profile' => 'Profile',
			'profile.editProfile' => 'Edit Profile',
			'profile.secureYourAccount' => 'Secure your account',
			'profile.fullName' => 'Full Name',
			'profile.email' => 'Email',
			'profile.phoneNumber' => 'Phone Number',
			'profile.address' => 'Address',
			'profile.saveChanges' => 'Save Changes',
			'profile.logout' => 'Logout',
			'profile.settings' => 'Settings',
			'profile.language' => 'Language',
			'profile.theme' => 'Theme',
			'profile.selectMode' => 'Select Mode',
			'profile.notifications' => 'Notifications',
			'profile.privacyAndSecurity' => 'Privacy & Security',
			'profile.helpAndSupport' => 'Help & Support',
			'profile.about' => 'About',
			'profile.selectLanguage' => 'Select Language',
			'profile.english' => 'English',
			'profile.arabic' => 'Arabic',
			'profile.enableNotifications' => 'Enable Notifications',
			'profile.disableNotifications' => 'Disable Notifications',
			'profile.light' => 'Light',
			'profile.dark' => 'Dark',
			'profile.system' => 'System',
			'profile.more' => 'More',
			'profile.prefrences' => 'Prefrences',
			'profile.security' => 'security',
			'profile.account' => 'account',
			'profile.changePassword' => 'Change Password',
			'profile.currentPassword' => 'Current Password',
			'profile.newPassword' => 'New Password',
			'profile.confirmNewPassword' => 'Confirm New Password',
			'profile.passwordChangedSuccessfully' => 'Password changed successfully',
			'profile.passwordChangeFailed' => 'Password change failed',
			'profile.passwordsDoNotMatch' => 'Passwords do not match',
			'profile.pleaseFillAllFields' => 'Please fill all fields',
			'profile.invalidCurrentPassword' => 'Invalid current password',
			'profile.passwordRequirements' => 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.',
			'profile.forgotPassword' => 'Forgot Password?',
			'profile.resetPassword' => 'Reset Password',
			'changePassword.changePassword' => 'Change Password',
			'changePassword.forgotPassword' => 'Forgot Password',
			'changePassword.currentPassword' => 'Current Password',
			'changePassword.newPassword' => 'New Password',
			'changePassword.confirmNewPassword' => 'Confirm New Password',
			'changePassword.saveChanges' => 'Save Changes',
			'changePassword.passwordChangedSuccessfully' => 'Password changed successfully',
			'changePassword.passwordChangeFailed' => 'Password change failed',
			'changePassword.passwordsDoNotMatch' => 'Passwords do not match',
			'changePassword.pleaseFillAllFields' => 'Please fill all fields',
			'changePassword.invalidCurrentPassword' => 'Invalid current password',
			'changePassword.passwordRequirements' => 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character.',
			'changePassword.updatePassword' => 'Update Password',
			'changePassword.forgotPasswordHint' => 'Please Enter Your Email Address To Receive Verification Code.',
			'changePassword.emailHint' => 'Email Address',
			'changePassword.send' => 'Send',
			'otp.verifyEmail' => 'Verify Your Email',
			'otp.otpHint' => 'Please Enter The Code Sent To Your Email',
			'otp.verify' => 'Verify',
			'newPassword.newPassword' => 'New Password',
			'newPassword.newPasswordHint' => 'Your New Password Must Be Different From  Previously Used Password',
			'newPassword.save' => ' Save',
			_ => null,
		};
	}
}
