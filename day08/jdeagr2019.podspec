#
# Be sure to run `pod lib lint jdeagr2019.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'jdeagr2019'
  s.version          = '0.1.0'
  s.summary          = 'Custom cocoapod pod jdeagr2019.'
  
  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  
  s.description      = <<-DESC
  'First attempt at creating own personal cocoapod pod.'
  DESC
  
  s.homepage         = 'https://github.com/jde-agr/jdeagr2019'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jde-agr' => 'jde-agr@student.wethinkcode.co.za' }
  s.source           = { :git => 'https://github.com/jde-agr/jde-agr2019.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  
  s.ios.deployment_target = '13.1'
  s.source_files = 'Source/**/*.swift', 'Source/**/*.xcdatamodeld'
  s.swift_version = '5.0'
  s.platforms = {
    "ios": "13.1"
  }
  
  #  s.source_files = 'jde-agr2019/Classes/**/*'
  
  # s.resource_bundles = {
  #   'jde-agr2019' => ['jde-agr2019/Assets/*.png']
  # }
  
  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'CoreData'
  s.requires_arc = true
end
