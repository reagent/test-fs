$:.unshift File.dirname(__FILE__)

require 'tmpdir'
require 'fileutils'
require 'test/unit'

require 'test_fs/node'
require 'test_fs/directory'
require 'test_fs/root_directory'
require 'test_fs/file'
require 'test_fs/helper'

module Test # :nodoc:
  module Unit # :nodoc:
    class TestCase # :nodoc:
      include TestFs::Helper
    end
  end
end