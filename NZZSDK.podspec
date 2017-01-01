#
#  Be sure to run `pod spec lint NZZSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name             = "NZSDK"
  s.version          = "0.0.1"
  s.summary          = "私人使用"
  s.description      = "私人工具库"
  s.homepage         = "https://github.com/ai966669/NZSDK.git"
  s.license          = 'MIT'
  s.author           = { "nzz" => "578172874@qq.com" }
  s.source           = { :git => "https://github.com/ai966669/NZSDK.git", :tag => s.version.to_s }
  s.platform     		 = :ios, '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/NZSDK/**/*'
    
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'
  # s.dependency "JSONKit", "~> 1.4"	#依赖关系，该项目所依赖的其他库，如果有多个可以写多个 s.dependency
end
