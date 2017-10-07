Encoding.default_external = "UTF-8" if defined?(Encoding)
require 'json'
require 'bundler/gem_tasks'

#def version
#  JSON.load(File.read('jquery-ui/package.json'))['version']
#end

#task :submodule do
#  sh 'git submodule update --init' unless File.exist?('jquery-ui/README.md')
#end

desc "Remove the app directory"
task :clean do
  rm_rf 'app'
  source_dir = 'slick-lightbox'
   %x( cd #{source_dir} && git reset --hard HEAD )
end

desc "Compile and minify the Javascript and CSS assets"
#task :javascripts => :submodule do
task :build_slick_lightbox do
  source_dir = 'slick-lightbox'
  Rake.rake_output_message 'Installing npm dependencies...'
  %x( cd #{source_dir} && npm i )
  Rake.rake_output_message 'Compiling...'
  %x( cd #{source_dir} && gulp build )
end

#desc "Update Jquery::Ui::Rails::JQUERY_UI_VERSION"
#task :version => :submodule do
#  Rake.rake_output_message "Setting Jquery::Ui::Rails::JQUERY_UI_VERSION = \"#{version}\""
#
#  versionRb = 'lib/jquery/ui/rails/version.rb'
#  versionRbSource = File.read(versionRb)
#  versionDefinition = "JQUERY_UI_VERSION = \"#{version}\""
#  versionRbSource.sub! /JQUERY_UI_VERSION = "[^"]*"/, versionDefinition \
#    or fail "Could not find JQUERY_UI_VERSION in #{versionRb}"
#  File.open(versionRb, 'w') do |out|
#    out.write(versionRbSource)
#  end
#end

desc "Move the build assets to the app dir"
task :move_to_app_dir => :build_slick_lightbox do
  Rake.rake_output_message 'Moving built files...' 
  target_dir_js = 'app/assets/javascripts/slick-lightbox'
  target_dir_css = 'app/assets/stylesheets/slick-lightbox'

  mkdir_p target_dir_js
  mkdir_p target_dir_css

  FileUtils.cp(Dir.glob("slick-lightbox/dist/*.js"), target_dir_js)
  FileUtils.cp(Dir.glob("slick-lightbox/dist/*.css"), target_dir_css)
end

desc "Generate root files"
task :generate_root_files => :move_to_app_dir do
  Rake.rake_output_message 'Generating root files...'
  target_js_file='app/assets/javascripts/slick-lightbox.js'
  target_css_file='app/assets/stylesheets/slick-lightbox.css'

  File.open(target_js_file, 'w') do |out|
    out.write('//= require slick-lightbox/slick-lightbox')
  end

  File.open(target_css_file, 'w') do |out|
    out.write('//= require slick-lightbox/slick-lightbox')
  end
end

desc "Clean and then generate everything (default)"
task :assets => [:clean, :generate_root_files]
#task :assets => [:clean, :javascripts, :stylesheets, :images, :version]

task :build => :assets

task :default => :assets
