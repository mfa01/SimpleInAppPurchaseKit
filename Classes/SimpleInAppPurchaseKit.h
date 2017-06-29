//
//  InAppsController.h
//
//  Created by bee101games on 5/22/13.
//
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>
#import "SKProduct+priceAsString.h"
@protocol SimpleInAppPurchaseKitDelegate<NSObject>
@optional
-(void)inappControllerSuccesfullyPurchasedProduct:(NSString*)productID;
-(void)inappControllerSuccesfullyRestoredProduct:(NSMutableArray*)products;
-(void)inappControllerFaildToPurchase;
@end
@interface SimpleInAppPurchaseKit : UIViewController<SKPaymentTransactionObserver,SKProductsRequestDelegate,SKPaymentTransactionObserver>
{
    UIView* waitingView;
    UIActivityIndicatorView* indicator;
    UIViewController* parentViewToShowWaitngIn;

    NSString* productPrice;
    NSDictionary* plistContent;
    NSString* requestedProduct;
    bool priceRequested;
    UIButton* closeWaitingView;
}
-(void)purchaseProductWithID:(NSString *)productId ShowInView:(UIViewController*)parentView;
-(void)restoreAllProductsAndShowInView:(UIViewController*)parentView;
-(BOOL)canMakePurchases;
-(NSString*)getProductPriceAfterPurchase;

-(void)saveProduct:(NSString*)prodID;
-(bool)isProductPurchased:(NSString*)prodID;
-(void)getPriceForProduct:(NSString *)productId ShowInView:(UIViewController*)parentView;
-(UIView*)getWaitingView;

@property(nonatomic,retain)id<SimpleInAppPurchaseKitDelegate> delegate;
@end



