Pod::Spec.new do |s|
  s.name         = "MidtransModule"
  s.version      = "1.0.0"
  s.summary      = "MidtransModule"
  s.homepage     = "fputra.web.id"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "Firdaus Ekaputra" => "dev.fputra@gmail.com" }
  s.platform     = :ios, "9.0"
  s.source       = { :git => "https://github.com/aldente05/react-native-payment-gateway.git", :tag => "master" }
  s.source_files  = "ios/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  s.dependency "MidtransCoreKit"
  s.dependency "MidtransKit"

end
