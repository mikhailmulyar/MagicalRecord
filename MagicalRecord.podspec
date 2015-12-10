Pod::Spec.new do |s|
  s.default_subspec = 'Core'
  s.name     = 'MagicalRecord'
  s.version  = '2.3.0'
  s.license  = 'MIT'
  s.summary  = 'Super Awesome Easy Fetching for Core Data 1!!!11!!!!1!.'
  s.homepage = 'http://github.com/magicalpanda/MagicalRecord'
  s.author   = { 'Saul Mora' => 'saul@magicalpanda.com', 'Tony Arnold' => 'tony@thecocoabots.com' }
  s.source   = { :git => 'https://github.com/magicalpanda/MagicalRecord.git', :tag => "v#{s.version}" }
  s.description  = 'Handy fetching, threading and data import helpers to make Core Data a little easier to use.'
  s.requires_arc = true
  s.ios.deployment_target = '6.1'
  s.osx.deployment_target = '10.8'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  
  s.subspec 'Core' do |sp|
    sp.framework    = 'CoreData'
    sp.header_dir   = 'MagicalRecord'
    sp.source_files = 'MagicalRecord/**/*.{h,m}'
    
    pch_MR = <<-EOS
#ifndef TARGET_OS_IOS
  #define TARGET_OS_IOS TARGET_OS_IPHONE
#endif
#ifndef TARGET_OS_WATCH
  #define TARGET_OS_WATCH 0
#endif
#ifndef TARGET_OS_TV
  #define TARGET_OS_TV 0
#endif
#import <CoreData/CoreData.h>
#import <MagicalRecord/MagicalRecord.h>
EOS
  	s.prefix_header_contents = pch_MR
  end

  s.subspec 'CocoaLumberjack' do |sp|
    sp.dependency 'MagicalRecord/Core'
    sp.dependency 'CocoaLumberjack', '~> 2.2.0'
  end

end
