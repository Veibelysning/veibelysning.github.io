require 'rake'
require "rubygems"
require "tmpdir"
require 'html-proofer'

desc 'Preview the site with Jekyll'
task :preview do
  sh "bundle exec jekyll serve --watch --baseurl '' --config _config.yml,_config-dev.yml --limit_posts 1 --incremental"
end

desc 'View the site with Jekyll'
task :view do
  sh "bundle exec jekyll serve --watch --baseurl '' --config _config.yml,_config-dev.yml --incremental"
end

desc "Clean site"
task :clean do
  sh "bundle exec jekyll clean"
end

desc "Build site"
task :build do
  sh "bundle exec jekyll build --baseurl '' --config _config.yml"
end

desc "Test site locally"
task :test do
  run_tests
end

desc "Test site in ci environment"
task :ci => [:build] do
  run_tests
end

desc "Profile site"
task :profile do
  sh "bundle exec jekyll build --baseurl '' --config _config.yml,_config-dev.yml --profile"
end

def run_tests()
  sh "bundle exec jekyll doctor"
  options = { 
    :assume_extension => true, 
    :check_favicon => true, 
    :check_opengraph => true,
    :check_html => true,
    :check_img_http => true,
    :only_4xx => true,
    :http_status_ignore => [ 403 ],
    :file_ignore => ['./_site/google31ba0ee2d29138f7.html'],
    :cache => { :timeframe => '12h' },
    :parallel => { :in_processes => 8 }
  }
  HTMLProofer.check_directory("./_site", options).run
end