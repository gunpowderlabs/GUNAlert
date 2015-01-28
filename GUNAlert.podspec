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
  s.summary          = "A short description of GUNAlert."
  s.description      = <<-DESC
                       An optional longer description of GUNAlert

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/<GITHUB_USERNAME>/GUNAlert"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Michał Taszycki" => "michal.taszycki@getbase.com" }
  s.source           = { :git => "https://github.com/<GITHUB_USERNAME>/GUNAlert.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

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
