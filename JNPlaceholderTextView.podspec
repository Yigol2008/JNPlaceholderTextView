Pod::Spec.new do |s|
  s.name          = "JNPlaceholderTextView"
  s.version       = "1.0"
  s.platform      = :ios, "8.0"
  s.license       = "MIT"
  s.requires_arc  = true
  s.author        = { "Yigol" => "yigol2008@163.com" }

  s.summary       = "带placeholder的TextView"
  s.description   = "基于UITextView，增加placeholder功能，增加限制text的输入字数功能"

  s.homepage      = "https://github.com/Yigol2008/JNPlaceholderTextView"
  s.source        = { :git => "http://github.com/Yigol2008/JNPlaceholderTextView.git", :tag => "#{s.version.to_s}" }
  s.source_files  = "JNPlaceholderTextView/*.{h,m}"


