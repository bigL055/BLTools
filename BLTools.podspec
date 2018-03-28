Pod::Spec.new do |s|
s.name             = 'BLTools'
s.version          = '0.2.0'
s.summary          = '一些小工具类'


s.homepage         = 'https://github.com/linhay/BLTools'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'linhay' => 'linhan.linhey@outlook.com' }
s.source = { :git => 'https://github.com/linhay/BLTools.git', :tag => s.version.to_s }

s.ios.deployment_target = '8.0'

s.source_files = ["Sources/*/**","Sources/*/*/**","Sources/**"]

s.public_header_files = ["Sources/BLTools.h"]
s.frameworks = ['Foundation']
s.requires_arc = true
s.dependency 'YYCache'
s.dependency 'AnyFormatProtocol'
s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }

end
