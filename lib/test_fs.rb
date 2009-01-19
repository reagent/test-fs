$:.unshift File.dirname(__FILE__)

require 'tmpdir'
require 'fileutils'
require 'test/unit'

require 'test_fs/node'
require 'test_fs/directory'
require 'test_fs/root_directory'
require 'test_fs/file'
require 'test_fs/helper'

class Test::Unit::TestCase
  include TestFs::Helper
end