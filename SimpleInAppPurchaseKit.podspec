Pod::Spec.new do |s|
  s.name         = "SimpleInAppPurchaseKit"
  s.version      = "0.0.1"
  s.summary      = "CWDropDownMenu is a block based UIButton subclass that uses UIActionSheet to present a drop down menu."

  s.homepage     = "https://github.com/mfa01/SimpleInAppPurchaseKit"
  s.license      = { :type => "MIT", :file => 'LICENSE' }
  s.author       = { "MAbed" => "mfa01@yahoo.com" }
  s.platform     = :ios, '8.0'
s.source       = { :git => "https://github.com/mfa01/SimpleInAppPurchaseKit.git", :commit => "aca5edf3b1d3bb4045a04140fed786ea4034860d" }

  s.source_files  = 'Classes/CWDropDownMenu.{h,m}'
  s.frameworks   = "UIKit"
  s.requires_arc = true

end
