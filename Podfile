source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

target 'RicosCafe' do

    pod 'Unbox'
    pod 'ChameleonFramework/Swift', :git => 'https://github.com/ViccAlexander/Chameleon.git'
    pod 'Tiguer', :git => 'https://github.com/bmctigue/Tiguer.git'

    target 'RicosCafeTests' do
        inherit! :search_paths
    end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |configuration|
      configuration.build_settings['CLANG_ENABLE_CODE_COVERAGE'] = 'NO'
      configuration.build_settings['SWIFT_EXEC'] = '$(SRCROOT)/SWIFT_EXEC-no-coverage'
    end
  end
end
