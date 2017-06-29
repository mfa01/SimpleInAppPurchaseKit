SimpleInAppPurchaseKit
============

SimpleInAppPurchaseKit to buy and restore apple in app purchases easily,
so just add this pods to your project and start using it in a seconds,
you can do buy,get price and restore actions


Add this line in your pod file
  pod 'SimpleInAppPurchaseKit'


In your .h file 

1-add SimpleInAppPurchaseKit header
#import "SimpleInAppPurchaseKit.h"

2-Also add this to delegates
 <SimpleInAppPurchaseKitDelegate>

For example 
@interface testViewController : UIViewController<SimpleInAppPurchaseKitDelegate>

3-Define in the class
SimpleInAppPurchaseKit* inapps;




in .m file

Define the class before using it

inapps=[[SimpleInAppPurchaseKit alloc]init];


to buy product
[inapps purchaseProductWithID:@"com.company.app.example1" ShowInView:self];


to restore old purchases

[inapps restoreAllProductsAndShowInView:self];


to get product price
[inapps getPriceForProduct:@"com.company.app.exmaple1" ShowInView:self];



Add Callbacks

-(void)inappControllerSuccesfullyPurchasedProduct:(NSString*)productID{
}
-(void)inappControllerSuccesfullyRestoredProduct:(NSMutableArray*)products{
}
-(void)inappControllerFaildToPurchase{
}




for any support please contact me
mfa01@yahoo.com
