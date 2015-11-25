Pod::Spec.new do |s|
  s.name             = "AUModalController"
  s.version          = "0.1.0"
  s.summary          = "A simple way to create custom iOS alert views or popups."
  s.description      = "A simple way to create custom iOS alert views or popups.
                       Works on iphones and ipads with iOS 7.0 and above. 
                       See the example project to learn how to create and
                       present your own modal view."

  s.homepage         = "https://github.com/appunite/AUModalController"
  s.license          = 'MIT'
  s.author           = { "Hubert Drąg" => "hubert.drag@appunite.com" }
  s.source           = { :git => "https://github.com/appunite/AUModalController.git", :tag => s.version.to_s }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'AUModalController' => ['Pod/Assets/*.png']
  }
  end
