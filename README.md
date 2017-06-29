<p class="p1"><strong>SimpleInAppPurchaseKit</strong></p>
<p class="p2">============</p>
<p class="p3">&nbsp;</p>
<p class="p2">SimpleInAppPurchaseKit to buy and restore apple in app purchases easily,</p>
<p class="p2">so just add this pods to your project and start using it in a seconds,</p>
<p class="p2">you can do buy, get price and restore actions</p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p4"><strong>Add this line in your pod file</strong></p>
<p class="p2"><em><span class="Apple-converted-space">&nbsp; </span>pod 'SimpleInAppPurchaseKit'</em></p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p4"><strong>In your .h file</strong></p>
<p class="p3">&nbsp;</p>
<p class="p2">1-add SimpleInAppPurchaseKit header</p>
<p class="p5"><span class="s2"><em>#import </em></span><span class="s3"><em>"SimpleInAppPurchaseKit.h"</em></span></p>
<p class="p3">&nbsp;</p>
<p class="p2">2-Also add this to delegates</p>
<p class="p6"><span class="s4"><em>&lt;</em></span><span class="s3"><em>SimpleInAppPurchaseKitDelegate</em></span><span class="s4"><em>&gt;</em></span></p>
<p class="p3">&nbsp;</p>
<p class="p2">For example</p>
<p class="p6"><span class="s5"><em>@interface</em></span><span class="s4"><em> testViewController : </em></span><span class="s6"><em>UIViewController</em></span><span class="s4"><em>&lt;</em></span><span class="s3"><em>SimpleInAppPurchaseKitDelegate</em></span><span class="s4"><em>&gt;</em></span></p>
<p class="p3">&nbsp;</p>
<p class="p2">3-Define in the class</p>
<p class="p6"><span class="s3"><em>SimpleInAppPurchaseKit</em></span><span class="s4"><em>* inapps;</em></span></p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p4"><strong>in .m file</strong></p>
<p class="p3">&nbsp;</p>
<p class="p2">Define the class before using it</p>
<p class="p6"><span class="s3"><em>inapps</em></span><span class="s4"><em>=[[</em></span><span class="s3"><em>SimpleInAppPurchaseKit</em></span> <span class="s7"><em>alloc</em></span><span class="s4"><em>]</em></span><span class="s7"><em>init</em></span><span class="s4"><em>];</em></span></p>
<p class="p6"><span class="s3"><em>inapps</em></span><span class="s4"><em>.</em></span><span class="s3"><em>delegate</em></span><span class="s4"><em>=</em></span><span class="s5"><em>self</em></span><span class="s4"><em>;</em></span></p>
<p class="p3">&nbsp;</p>
<p class="p2"><strong>to buy product</strong></p>
<p class="p7"><span class="s4"><em>[</em></span><span class="s8"><em>inapps</em></span> <span class="s3"><em>purchaseProductWithID</em></span><span class="s4"><em>:</em></span><span class="s9"><em>@"com.company.app.exmaple1"</em></span> <span class="s3"><em>ShowInView</em></span><span class="s4"><em>:</em></span><span class="s5"><em>self</em></span><span class="s4"><em>];</em></span></p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p2"><strong>to restore old purchases</strong></p>
<p class="p3">&nbsp;</p>
<p class="p7"><span class="s4"><em>[</em></span><span class="s8"><em>inapps</em></span> <span class="s3"><em>restoreAllProductsAndShowInView</em></span><span class="s4"><em>:</em></span><span class="s5"><em>self</em></span><span class="s4"><em>];</em></span></p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p2"><strong>to get product price</strong></p>
<p class="p7"><span class="s4"><em>[</em></span><span class="s8"><em>inapps</em></span> <span class="s3"><em>getPriceForProduct</em></span><span class="s4"><em>:</em></span><span class="s9"><em>@"com.company.app.exmaple1"</em></span> <span class="s3"><em>ShowInView</em></span><span class="s4"><em>:</em></span><span class="s5"><em>self</em></span><span class="s4"><em>];</em></span></p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p4"><strong>Add Callbacks</strong></p>
<p class="p3">&nbsp;</p>
<p class="p8"><span class="s3"><em>-(</em></span><span class="s5"><em>void</em></span><span class="s3"><em>)inappControllerSuccesfullyPurchasedProduct:(</em></span><span class="s6"><em>NSString</em></span><span class="s3"><em>*)productID{</em></span></p>
<p class="p8"><span class="s3"><em>}</em></span></p>
<p class="p8"><span class="s3"><em>-(</em></span><span class="s5"><em>void</em></span><span class="s3"><em>)inappControllerSuccesfullyRestoredProduct:(</em></span><span class="s6"><em>NSMutableArray</em></span><span class="s3"><em>*)products{</em></span></p>
<p class="p8"><span class="s3"><em>}</em></span></p>
<p class="p8"><span class="s3"><em>-(</em></span><span class="s5"><em>void</em></span><span class="s3"><em>)inappControllerFaildToPurchase{</em></span></p>
<p class="p8"><span class="s3"><em>}</em></span></p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p4"><strong>Available Methods</strong></p>
<p class="p3">&nbsp;</p>
<p class="p9"><span class="s3"><em>-(</em></span><span class="s5"><em>BOOL</em></span><span class="s3"><em>)canMakePurchases;</em></span></p>
<p class="p9"><span class="s3"><em>-(</em></span><span class="s5"><em>void</em></span><span class="s3"><em>)saveProduct:(</em></span><span class="s6"><em>NSString</em></span><span class="s3"><em>*)prodID;</em></span></p>
<p class="p9"><span class="s3"><em>-(</em></span><span class="s5"><em>bool</em></span><span class="s3"><em>)isProductPurchased:(</em></span><span class="s6"><em>NSString</em></span><span class="s3"><em>*)prodID;</em></span></p>
<p class="p9"><span class="s3"><em>-(</em></span><span class="s5"><em>void</em></span><span class="s3"><em>)getPriceForProduct:(</em></span><span class="s6"><em>NSString</em></span><span class="s3"><em> *)productId ShowInView:(</em></span><span class="s6"><em>UIViewController</em></span><span class="s3"><em>*)parentView;</em></span></p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p2"><strong>for any support please contact me</strong></p>
<p class="p2"><strong>mfa01@yahoo.com</strong></p>
