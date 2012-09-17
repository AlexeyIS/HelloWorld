require 'frank-cucumber'

ENV['TESTING_ENV'] ||= 'command_line'
environment = ENV['TESTING_ENV']

if environment == 'command_line'
 BASE_DIR = "~/Library/Developer/Xcode/DerivedData/HelloWorld-gzdtfhuqgbfdwgdrhqmfamwcjoko"
 APP_BUNDLE_PATH =  "#{BASE_DIR}Build/Products/Debug-iphonesimulator/HelloWorld_Frankified.app"
 APP_DIR = "#{BASE_DIR}Build/Intermediates/HelloWorld.build/Debug-iphonesimulator/HelloWorld_Frankified.build"
elsif environment == 'jenkins'
 BASE_DIR = "~/.jenkins/jobs/HelloWorldUI/workspace/"
 APP_BUNDLE_PATH =  "#{BASE_DIR}build/Debug-iphonesimulator/HelloWorld_Frankified.app"
 APP_DIR = "#{BASE_DIR}build/HelloWorld.build/Debug_iphonesimulator/HelloWorld_Frankified.build"
end

#### Common ####
SDK_DIR = "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator5.1.sdk"
APP_BINARY = "#{APP_BUNDLE_PATH}/HelloWorld_Frankified"
USER_DIR = "iPhone Simulator/User"
PREF_DIR = "#{USER_DIR}/Library/Preferences"



# UIQuery is deprecated. Please use the shelley selector engine. 
Frank::Cucumber::FrankHelper.use_shelley_from_now_on

# TODO: set this constant to the full path for your Frankified target's app bundle.
# See the "Given I launch the app" step definition in launch_steps.rb for more details
# APP_BUNDLE_PATH = File.expand_path( '../../../frankified_build/Frankified.app', __FILE__ )

