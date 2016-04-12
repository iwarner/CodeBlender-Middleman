test.thorrequire 'net/http'
require 'thor/group'
require './lib/daemon'

class Test < Thor
  include Thor::Actions
  include Thor::Daemon

  desc "start", "running test servers"
  def start
    say "Starting servers", :blue
    begin
      Net::HTTP.get_response(URI("http://localhost:4444"))
      Net::HTTP.get_response(URI("http://localhost:27001"))
      say "Test servers are currently running if you experiment some problems, try run `thor test:restart`", :red
    rescue
      tmp_dir = ENV['TMPDIR'] || "~/tmp"
      daemon_command("./selenium/start > #{tmp_dir}/selenium_server.log 2>&1 &", "org.openqa.jetty.jetty.Server")
      say "Selenium server started", :green
      daemon_command("middleman -p 27001 > #{tmp_dir}/middleman.log 2>&1 &", "http://0.0.0.0:27001/__middleman/")
      say "Middleman server started", :green
      say "Check #{tmp_dir}/selenium_server.log and #{tmp_dir}/middleman.log for logs", :green
      say "Run test with thor test:runner", :green
      say "Stops servers with thor test:stop", :green
    end
  end

  desc "runner", "running all test files"
  def runner(files="spec/*.js")
    run "./node_modules/.bin/protractor \
    --seleniumAddress http://localhost:4444/wd/hub \
    --capabilities.browserName chrome \
    --jasmineNodeOpts.defaultTimeoutInterval 30000 \
    --jasmineNodeOpts.showColors true \
    --specs #{files.split(" ").join(",")}"
  end

  desc "stop", "stop test servers"
  def stop
    run "kill $(lsof -ti :4444)"
    run "kill $(lsof -ti :27001)"
  end

  desc "restart", "restart test servers"
  def restart
    invoke :stop
    invoke :start
  end