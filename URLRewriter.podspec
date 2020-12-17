Pod::Spec.new do |s|
  s.name             = 'URLRewriter'
  s.version          = '1.0.1'
  s.summary          = 'Rewrite the specified URL to a locally supported URL through dynamically configured rules'

  s.description      = <<-DESC
  Rewrite the specified URL to a locally supported URL through dynamically configured rules.
  The rule is a set of regular matching string and target string. You can dynamically add or modify
                       DESC

  s.homepage         = 'https://github.com/chinabrant/URLRewriter'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'chinabrant' => 'sjwu1234@gmail.com' }
  s.source           = { :git => 'https://github.com/chinabrant/URLRewriter.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.swift_version = '4.0'

  s.source_files = 'URLRewriter/Classes/**/*'
  
end
