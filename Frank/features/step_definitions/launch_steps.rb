require 'fileutils'

ACCESIBILITY_PLIST   = "com.apple.Accessibility.plist"
ACCESIBILITY_CONTENT = <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
<key>ApplicationAccessibilityEnabled</key>
<true/>
</dict>
</plist>
PLIST

Before do
  # check that pwd contains the "build" dir as we are creating
  # items relative to it.
  #Dir["build"].length.should == 1

  # make sure we do start with a clean environment
  FileUtils.remove_dir("#{USER_DIR}",true)

  pwd     = "#{Dir.pwd}"
  prefdir = "#{PREF_DIR}"
  FileUtils.mkdir_p prefdir

  File.open("#{PREF_DIR}/#{ACCESIBILITY_PLIST}", 'w') do |f|
    f <<ACCESIBILITY_CONTENT
  end

  ENV['SDKROOT']               = "#{SDK_DIR}"
  ENV['DYLD_ROOT_PATH']        = "#{SDK_DIR}"
  ENV['IPHONE_SIMULATOR_ROOT'] = "#{SDK_DIR}"
  ENV['TEMP_FILES_DIR']        = "#{APP_DIR}"
  ENV['CFFIXED_USER_HOME']     = "#{pwd}/#{USER_DIR}"
end

After do
  frankly_exit
end

def launch_app_headless
  @apppid = fork do
    exec(APP_BINARY, "-RegisterForSystemEvents")
  end
  wait_for_frank_to_come_up
end

def frankly_exit
  get_to_uispec_server("exit")
  # calling exit in the app will not return any response
  # so we simply catch the error caused by exiting.
  rescue EOFError
end

Given /^I launch the headless app$/ do
  launch_app_headless
end


def app_path
  ENV['APP_BUNDLE_PATH'] || (defined?(APP_BUNDLE_PATH) && APP_BUNDLE_PATH)
end

Given /^I launch the app$/ do
  # latest sdk and iphone by default
  launch_app app_path
end

Given /^I launch the app using iOS (\d\.\d)$/ do |sdk|
  # You can grab a list of the installed SDK with sim_launcher
  # > run sim_launcher from the command line
  # > open a browser to http://localhost:8881/showsdks
  # > use one of the sdk you see in parenthesis (e.g. 4.2)
  launch_app app_path, sdk
end

Given /^I launch the app using iOS (\d\.\d) and the (iphone|ipad) simulator$/ do |sdk, version|
  launch_app app_path, sdk, version
end

Then /^I should see textfield "(.*?)"$/ do |arg1|
    check_element_exists "view marked:'#{arg1}'"

end

Then /^I should see button "(.*?)"$/ do |arg1|
    check_element_exists "view marked:'#{arg1}'"
 
end

When /^I touch "(.*?)" button$/ do |arg1|
    touch("view:'UIButton' marked:#{arg1}")

end

Then /^I should see result "(.*?)" in textfield marked "(.*?)"$/ do |arg1, arg2|
    res = frankly_map("view:'UITextField' marked:'#{arg2}'", 'text').first
    res.should == arg1

end
