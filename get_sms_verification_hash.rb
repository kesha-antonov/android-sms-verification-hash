#!/usr/bin/ruby
require 'slop'
require 'fileutils'

class Mobiapp
  def retrieve_hash(package: nil, alias: nil, keystore_path: nil, storepass: nil)
    unless File.exists?(keystore_path)
      p "File or link doesn't exist: #{keystore_path}"
      return
    end

    cert = `keytool -list -rfc -keystore #{keystore_path} #{storepass ? '-storepass ' + storepass : ''  } | sed  -e '1,/BEGIN/d' | sed -e '/END/,$d' | tr -d '[:space:]' | base64 --decode | xxd -p | tr -d '[:space:]'`
    input = "#{package} #{cert}"
    output = `printf "#{input}" | shasum -a 256 | cut -c1-64`.strip
    output = `printf #{output} | cut -c1-18`.strip
    base64output = `printf #{output} | xxd -r -p | base64 | cut -c1-11`.strip

    $stdout.puts("\n\n")
    $stdout.puts("Your hash for verification sms: #{base64output}")
  end
end

opts = Slop.parse do |o|
  o.string '-p', '--package', 'package name', required: true
  o.string '-a', '--alias', 'alias', required: true
  o.string '-k', '--keystore', 'path to key of app: *.keystore', required: true
  o.string '-pass', '--storepass', 'password to key'
end

Mobiapp.new.retrieve_hash(
  package: opts[:package],
  alias: opts[:alias],
  keystore_path: opts[:keystore],
  storepass: opts[:storepass],
)
