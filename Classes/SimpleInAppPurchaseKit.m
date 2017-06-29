

#import "SimpleInAppPurchaseKit.h"
@interface SimpleInAppPurchaseKit ()
@end
@implementation SimpleInAppPurchaseKit
- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (void) purchaseProductWithID:(NSString *)productId ShowInView:(UIViewController*)parentView
{
    if ([SKPaymentQueue canMakePayments])
    {
        SKProductsRequest* request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:productId]];
        requestedProduct=productId;
        request.delegate = self;
        [request start];
        parentViewToShowWaitngIn=parentView;
        [self showWatingView];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                            initWithTitle:[plistContent objectForKey:@"FaildMessageCantMakePurchaseTitle"]
                            message:[plistContent objectForKey:@"FaildMessageCantMakePurchaseText"]
                            delegate:nil
                            cancelButtonTitle:nil
                            otherButtonTitles:[plistContent objectForKey:@"FaildMessageCantMakePurchaseOkBtn"], nil];
        [alert show];
    }
}
-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    SKProduct *validProduct = nil;
    int count = (int)[response.products count];
    if (count>0)
    {
        validProduct = [response.products objectAtIndex:0];
        if(!priceRequested)
        {
            SKPayment *payment = [SKPayment paymentWithProduct:validProduct];
            [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
            [[SKPaymentQueue defaultQueue] addPayment:payment];
        }
    }
    else
    {
        if(!priceRequested)
        {
            UIAlertView *alert = [[UIAlertView alloc]
                                  initWithTitle:[plistContent objectForKey:@"FaildMessageNoAvailableProductTitle"]
                                  message:[plistContent objectForKey:@"FaildMessageNoAvailableProductText"]
                                  delegate:nil
                                  cancelButtonTitle:nil
                                  otherButtonTitles:[plistContent objectForKey:@"FaildMessageNoAvailableProductOkBtn"], nil];
            [alert show];
            [self hideWatingView];
        }
    }
    priceRequested=false;
}
-(void)restoreAllProductsAndShowInView:(UIViewController*)parentView
{
    if([self canMakePurchases])
    {
        parentViewToShowWaitngIn=parentView;
        [self showWatingView];
        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
        [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:[plistContent objectForKey:@"FaildMessageCantRestoreTitle"]
                              message:[plistContent objectForKey:@"FaildMessageCantRestoreText"]
                              delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:[plistContent objectForKey:@"FaildMessageCantRestoreOkBtn"], nil];
        [alert show];
    }
}
- (void) paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchasing:
                [self purchasingTransaction:transaction];
                break;
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:queue.transactions :transaction];
                break;
            default:
                break;
        }
    }
}
-(void)initWatingView
{
    float screenW=[[UIScreen mainScreen] bounds].size.width;
    float screenH=[[UIScreen mainScreen] bounds].size.height;
    waitingView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, screenW, screenH)];
    //[waitingView setAlpha:.5];
    [waitingView setBackgroundColor:[UIColor blackColor]];
    [waitingView setBackgroundColor:[UIColor colorWithRed:.1 green:.1 blue:.1 alpha:.75]];
    indicator=[[UIActivityIndicatorView alloc]init];
    [indicator setCenter:waitingView.center];
    [waitingView addSubview:indicator];
    
    closeWaitingView=[UIButton buttonWithType:UIButtonTypeCustom];
    if(screenH==768||screenW==768)
        [closeWaitingView setFrame:CGRectMake(0, 0, 80, 80)];
    else [closeWaitingView setFrame:CGRectMake(0, 0, 40, 40)];
    [closeWaitingView setImage:[UIImage imageNamed:@"xScroll.png"] forState:UIControlStateNormal];
    [waitingView addSubview:closeWaitingView];
    if(screenH==768||screenW==768)
        [closeWaitingView setCenter:CGPointMake(screenW*.95, 45)];
    else [closeWaitingView setCenter:CGPointMake(screenW*.92, 25)];
    [closeWaitingView addTarget:self action:@selector(hideWatingView) forControlEvents:UIControlEventTouchUpInside];
    
    [waitingView setAutoresizesSubviews:1];
    [waitingView setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth];
    [indicator setAutoresizesSubviews:1];
    [indicator setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin];
    
    [closeWaitingView setAutoresizesSubviews:1];
    [closeWaitingView setAutoresizingMask:UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin];
}
-(void)showWatingView
{
    float screenW=[[UIScreen mainScreen] bounds].size.width;
    float screenH=[[UIScreen mainScreen] bounds].size.height;
    if(UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))
    {
        if(screenH>screenW){
            float var=screenH;
            screenH=screenW;
            screenW=var;
        }
    }
    [waitingView setFrame:CGRectMake(0, 0,screenW , screenH)];
    if(screenH==768||screenW==768)
        [closeWaitingView setCenter:CGPointMake(screenW*.95, 45)];
    else [closeWaitingView setCenter:CGPointMake(screenW*.92, 25)];
    [indicator setCenter:waitingView.center];
    [indicator startAnimating];
    [parentViewToShowWaitngIn.view addSubview:waitingView];
}
-(void)hideWatingView
{
    [indicator stopAnimating];
    [waitingView removeFromSuperview];
}

- (void) purchasingTransaction:(SKPaymentTransaction *)transaction
{
    
}
// called when the transaction was successful
- (void) completeTransaction:(SKPaymentTransaction *)transaction
{
    [self provideContent:transaction.payment.productIdentifier];
    [self finishTransaction:transaction wasSuccessful:YES];
}

- (void) provideContent:(NSString *)productId
{
    if([_delegate respondsToSelector:@selector(inappControllerSuccesfullyPurchasedProduct:)])
    {
        [_delegate inappControllerSuccesfullyPurchasedProduct:productId];
    }
}
// called when a transaction has been restored and and successfully completed
- (void) restoreTransaction:(NSArray *)transactions :(SKPaymentTransaction*)transaction
{
    NSMutableArray* array=[[NSMutableArray alloc]init];
    for (SKPaymentTransaction *transaction in transactions)
    {
        NSString *productID = transaction.payment.productIdentifier;
        //NSLog(@"SKPaymentTransactionStateRestored %@",productID);
        [array addObject:productID];
    }
    if([_delegate respondsToSelector:@selector(inappControllerSuccesfullyRestoredProduct:)])
    {
        [_delegate inappControllerSuccesfullyRestoredProduct:array];
    }
    [self finishTransaction:transaction wasSuccessful:YES];
}
// called when a transaction has failed
- (void) failedTransaction:(SKPaymentTransaction *)transaction
{
    if (transaction.error.code != SKErrorPaymentCancelled)
    {
        [self finishTransaction:transaction wasSuccessful:NO];
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:[plistContent objectForKey:@"FaildMessageTransactionTitle"]
                              message:[plistContent objectForKey:@"FaildMessageTransactionText"]
                              delegate:nil
                              cancelButtonTitle:nil
                              otherButtonTitles:[plistContent objectForKey:@"FaildMessageTransactionOkBtn"], nil];
        [alert show];
    }
    else
    {
        //NSLog(@"canceled");
        [self hideWatingView];
        // this is fine, the user just cancelled, so don’t notify
        [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    }
}

//to save certain product
-(void)saveProduct:(NSString*)prodID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:prodID forKey:prodID];
    [defaults synchronize];
}
//to check if certain product is purchased
-(bool)isProductPurchased:(NSString*)prodID
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString* str= [defaults objectForKey:prodID];
    if([str isEqualToString:prodID])
        return true;
    return false;
}

////////OK
//
// removes the transaction from the queue and posts a notification with the transaction result
//
- (void) finishTransaction:(SKPaymentTransaction *)transaction wasSuccessful:(BOOL)wasSuccessful
{
    [self hideWatingView];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    if(!wasSuccessful||1==1)
    {
        if([_delegate respondsToSelector:@selector(inappControllerFaildToPurchase)])
        {
            @try {
                [_delegate inappControllerFaildToPurchase];
            }
            @catch (NSException *exception) {
                
            }
        }
    }
}
-(void)request:(SKRequest*)request didFailWithError:(NSError *)error
{
    NSLog(@"Failed to connect with error: %@", [error localizedDescription]);
}
-(void)requestDidFinish:(SKRequest *)request
{
}
//check if user can make purchase
-(BOOL) canMakePurchases
{
	BOOL canPurchase = [SKPaymentQueue canMakePayments];
    return canPurchase;
}
//restore product price, after you purchase/restore an app
-(NSString*)getProductPriceAfterPurchase
{
    return productPrice;
}
-(void)getPriceForProduct:(NSString *)productId ShowInView:(UIViewController*)parentView
{
    if(!priceRequested)
    {
        priceRequested=true;
        SKProductsRequest* request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithObject:productId]];
        requestedProduct=productId;
        request.delegate = self;
        [request start];
        parentViewToShowWaitngIn=parentView;
    }
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];if (self) {}
    [self initWatingView];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"InAppsController" ofType:@"plist"];
    plistContent = [[NSDictionary alloc] initWithContentsOfFile:path];
    return self;
}
-(UIView*)getWaitingView
{
    return waitingView;
}
@end
