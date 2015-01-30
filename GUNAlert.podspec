#
# Be sure to run `pod lib lint GUNAlert.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "GUNAlert"
  s.version          = "0.1.0"
  s.summary          = "GUNAlert is a simple wrapper around UIAlertView and UIAlertController"
  s.description      = <<-DESC
                       For applications that need to keep backward compatibility with iOS versions < 8. It is designed as a simple drop in solution for most common use cases.
                       DESC
  s.homepage         = "https://github.com/gunpowderlabs/GUNAlert"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Michał Taszycki" => "michal@gunpowderlabs.com" }
  s.source           = { :git => "https://github.com/gunpowderlabs/GUNAlert.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/mehowte'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resource_bundles = {
    'GUNAlert' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
