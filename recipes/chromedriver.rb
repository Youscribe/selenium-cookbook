#
# Cookbook Name:: selenium
# Recipe:: IEDriver
# Author:: Guilhem Lettron <guilhem.lettron@youscribe.com>
#
# Copyright 2012, Societe Publica.
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

remote_file "chromedriver" do
  source node['selenium']['chromedriver']['url']
  path "#{Chef::Config[:file_cache_path]}/chromedriver.zip"
  notifies :run, "service[Extract zip]"
end

chef_gem "rubyzip"

directory node['selenium']['chromedriver']['directory']

ruby_block "Extract zip" do
  block do
    require 'zip/zip'
    Zip::ZipFile.extract("#{Chef::Config[:file_cache_path]}/chromedriver.zip", node['selenium']['chromedriver']['directory'])
  end
  action :nothing
end

windows_path node['selenium']['chromedriver']['directory'] if node['plateform'] == "windows"
