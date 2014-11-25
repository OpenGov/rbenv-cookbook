#
# Cookbook Name:: rbenv
# Attributes:: default
#
# Author:: Jamie Winsor (<jamie@vialstudios.com>)
#
# Copyright 2011-2012, Riot Games
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

default[:rbenv][:user]           = "rbenv"
default[:rbenv][:group]          = "rbenv"
default[:rbenv][:manage_home]    = true
default[:rbenv][:group_users]    = Array.new

# rbenv
default[:rbenv][:install_type]   = "git" # or 'tarball'
default[:rbenv][:install_prefix] = "/opt"

default[:rbenv][:git_repository] = "https://github.com/sstephenson/rbenv.git"
default[:rbenv][:git_revision]   = "master"

default[:rbenv][:tarball_url_prefix] = nil
default[:rbenv][:tarball_version] = nil
default[:rbenv][:tarball_extension] = 'tar.bz2'
default[:rbenv][:tar_compression_char] = 'j'

if node[:rbenv][:tarball_url_prefix] && node[:rbenv][:tarball_version]
  default[:rbenv][:tarball_name] = "{node[:rbenv][:tarball_version]}.#{node[:rbenv][:tarball_extension]}"
  default[:rbenv][:tarball_url] = "#{node[:rbenv][:tarball_url_prefix]}-#{node[:rbenv][:tarball_name]}"
end

default[:rbenv][:root_path]      = "#{node[:rbenv][:install_prefix]}/rbenv"
default[:rbenv][:user_home]      = "/home/#{node[:rbenv][:user]}"

# ruby build
default[:ruby_build][:install_type] = "git"

default[:ruby_build][:git_repository] = "https://github.com/sstephenson/ruby-build.git"
default[:ruby_build][:git_revision]   = "master"

default[:ruby_build][:tarball_url_prefix] = nil
default[:ruby_build][:tarball_version] = nil
default[:ruby_build][:tarball_extension] = 'tar.bz2'
default[:ruby_build][:tar_compression_char] = 'j'

if node[:ruby_build][:tarball_url_prefix] && node[:ruby_build][:tarball_version]
  default[:ruby_build][:tarball_name] = "{node[:ruby_build][:tarball_version]}.#{node[:ruby_build][:tarball_extension]}"
  default[:ruby_build][:tarball_url] = "#{node[:ruby_build][:tarball_url_prefix]}-#{node[:ruby_build][:tarball_name]}"
end

# rbenv vars
default[:rbenv_vars][:git_repository] = "https://github.com/sstephenson/rbenv-vars.git"
default[:rbenv_vars][:git_revision]   = "master"
