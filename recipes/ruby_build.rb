#
# Cookbook Name:: rbenv
# Recipe:: ruby_build
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

include_recipe "git"

with_home_for_user(node[:rbenv][:user]) do
  if node[:ruby_build][:install_type] == 'tarball'
    rbenv_build_cache_path = "#{Chef::Config[:file_cache_path]}/rbenv-ruby-build-#{node['ruby_build']['tarball_name']}"

    tar_extract node['ruby_build']['tarball_url'] do
      user node['rbenv']['user']
      group node['rbenv']['group']
      download_dir rbenv_build_cache_path
      target_dir node['ruby_build']['plugin_path']
      compress_char node['ruby_build']['tar_compression_char']
      creates node['ruby_build']['prefix']
      notifies :run, 'execute[rbenv-chown-build-package]', :immediately
    end

    execute 'rbenv-chown-build-package' do
      command "chown -R #{node['rbenv']['user']}:#{node['rbenv']['group']} #{node['ruby_build']['prefix']}"
      action :nothing
    end
  else

    git node[:ruby_build][:prefix] do
      repository node[:ruby_build][:git_repository]
      reference node[:ruby_build][:git_revision]
      action :sync
      user node[:rbenv][:user]
      group node[:rbenv][:group]
    end
  end
end
