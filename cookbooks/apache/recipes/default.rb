#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package_name = "httpd"

case node["platform"]
when "ubuntu"
  package_name = "apache2"
end


package package_name

service package_name do
  action :start
end








