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
<p class="p5"><span class="s2">#import </span><span class="s3">"SimpleInAppPurchaseKit.h"</span></p>
<p class="p3">&nbsp;</p>
<p class="p2">2-Also add this to delegates</p>
<p class="p6"><span class="s4">&lt;</span><span class="s3">SimpleInAppPurchaseKitDelegate</span><span class="s4">&gt;</span></p>
<p class="p3">&nbsp;</p>
<p class="p2">For example</p>
<p class="p6"><span class="s5">@interface</span><span class="s4"> testViewController : </span><span class="s6">UIViewController</span><span class="s4">&lt;</span><span class="s3">SimpleInAppPurchaseKitDelegate</span><span class="s4">&gt;</span></p>
<p class="p3">&nbsp;</p>
<p class="p2">3-Define in the class</p>
<p class="p6"><span class="s3">SimpleInAppPurchaseKit</span><span class="s4">* inapps;</span></p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p4"><strong>in .m file</strong></p>
<p class="p3">&nbsp;</p>
<p class="p2">Define the class before using it</p>
<p class="p6"><span class="s3">inapps</span><span class="s4">=[[</span><span class="s3">SimpleInAppPurchaseKit</span> <span class="s7">alloc</span><span class="s4">]</span><span class="s7">init</span><span class="s4">];</span></p>
<p class="p6"><span class="s3">inapps</span><span class="s4">.</span><span class="s3">delegate</span><span class="s4">=</span><span class="s5">self</span><span class="s4">;</span></p>
<p class="p3">&nbsp;</p>
<p class="p2"><strong>to buy product</strong></p>
<p class="p7"><span class="s4">[</span><span class="s8">inapps</span> <span class="s3">purchaseProductWithID</span><span class="s4">:</span><span class="s9">@"com.company.app.exmaple1"</span> <span class="s3">ShowInView</span><span class="s4">:</span><span class="s5">self</span><span class="s4">];</span></p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p2"><strong>to restore old purchases</strong></p>
<p class="p3">&nbsp;</p>
<p class="p7"><span class="s4">[</span><span class="s8">inapps</span> <span class="s3">restoreAllProductsAndShowInView</span><span class="s4">:</span><span class="s5">self</span><span class="s4">];</span></p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p2"><strong>to get product price</strong></p>
<p class="p7"><span class="s4">[</span><span class="s8">inapps</span> <span class="s3">getPriceForProduct</span><span class="s4">:</span><span class="s9">@"com.company.app.exmaple1"</span> <span class="s3">ShowInView</span><span class="s4">:</span><span class="s5">self</span><span class="s4">];</span></p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p3">&nbsp;</p>
<p class="p4"><strong>Add Callbacks</strong></p>
<p class="p3">&nbsp;</p>
<p class="p8"><span class="s3">-(</span><span class="s5">void</span><span class="s3">)inappControllerSuccesfullyPurchasedProduct:(</span><span class="s6">NSString</span><span class="s3">*)productID{</span></p>
<p class="p8"><span class="s3">}</span></p>
<p class="p8"><span class="s3">-(</span><span class="s5">void</span><span class="s3">)inappControllerSuccesfullyRestoredProduct:(</span><span class="s6">NSMutableArray</span><span class="s3">*)products{</span></p>
<p class="p8"><span class="s3">}</span></p>
<p class="p8"><span class="s3">-(</span><span class="s5">void</span><span class="s3">)inappControllerFaildToPurchase{</span></p>
<p class="p8"><span class="s3">}</span></p>
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
