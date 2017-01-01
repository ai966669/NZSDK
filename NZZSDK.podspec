#
#  Be sure to run `pod spec lint NZZSDK.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
  s.name             = "NZZAnalysis"
  s.version          = "0.0.1"
  s.summary          = "公司内用"
  s.description      = "公司内用,统计app"
  s.homepage         = "https://github.com/noai966669/NZZAnalysis.git"
  s.license          = 'MIT'
  s.author           = { "ai966669" => "578172874@qq.com" }
  s.source           = { :git => "https://github.com/noai966669/NZZAnalysis.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'
  s.libraries   = 'z'
  vendored_libraries='Pod/libMobClickLibrary.a'
end
