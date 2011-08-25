#!/usr/bin/env ruby

require 'tempfile'

PREPROC_WORDS = %w[
  assert define elif else endif error ident if ifdef ifndef import include
  include_next line pragma sccs unassert undef warning
]

PREPROC_REGEX = Regexp.new('^#(' + PREPROC_WORDS.join('|') + ')')

HASH_REPLACE = '@@_HASH_@@'

THIS_DIR = File.expand_path('..', __FILE__)


def sh(*cmd)
  system(*cmd).tap do |b|
    raise "Command failed: #{cmd.join(' ')} with status: #{$?.inspect}" unless b
  end
end

def preprocess(inputfile)
  lines = File.readlines(inputfile)

  lines.each do |line|
    next if line =~ PREPROC_REGEX

    line.gsub!(/#(.*)/, "#{HASH_REPLACE}\\1")
  end

  processed = []

  Tempfile.open("#{inputfile}") do |tmp|
    tmp << lines.join('')
    tmp.fsync

    cmd = "gcc -E -nostdinc -iquote '#{THIS_DIR}' -x c -o- #{tmp.path}"

    IO.popen(cmd) do |io|
      while s = io.gets
        s.gsub!(/@@_HASH_@@/, '#')
        processed << s
      end
    end

    raise "command failed: #{cmd.inspect} with status: #{$?.inspect}" unless $?.exited? and $?.success?
  end


  processed.join
end


def main
  if ARGV.empty?
    $stderr.puts "Usage: #{File.basename($0)} inputfile"
    exit 1
  end

  puts preprocess(ARGV.first)
end


main # <-- entry point

