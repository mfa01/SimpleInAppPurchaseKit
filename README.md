Create Pods

-check pod specs file
pod spec lint SimpleInAppPurchaseKit.podspec
pod lib lint SimpleInAppPurchaseKit.podspec

-Open pods session
pod trunk register mfa01@yahoo.com 'Mohammad Alabed mfa01' --description='Objective C developer'

-Push Pod to cocapods
pod trunk push SimpleInAppPurchaseKit.podspec



GIT
push changes
git add .
git commit -m “Initial Commit2”
git remote add origin https://github.com/mfa01/SimpleInAppPurchaseKit.git
git push -u origin master


Tagging
git tag 0.1.1
git push origin 0.1.0


download git
git pull https://github.com/mfa01/SimpleInAppPurchaseKit
