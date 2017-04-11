#
# Be sure to run `pod lib lint PodAsset.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PodAsset"
  s.version          = "0.16.0"
  s.summary          = "Unable to find cocoapod resources? Here is the solution!"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
                       It is a very frustrating experience to locate the resources (assets) provided by the third-party pods.
                       PodAsset provides a simple way to load the resources. 
                       And debugging tools if you cannot locate the correct bundles.
                       DESC

  s.homepage         = "https://github.com/haifengkao/PodAsset"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Hai Feng Kao" => "haifeng@cocoaspice.in" }
  s.source           = { :git => "https://github.com/haifengkao/PodAsset.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target     = "7.0"
  s.osx.deployment_target     = "10.12"
  s.tvos.deployment_target    = "10.1"
  s.watchos.deployment_target = "3.1"

  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  #s.resource_bundles = {
    #'PodAsset' => ['Pod/Assets/*.png']
  #}

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
