#
# Cookbook Name:: redis
# Recipe:: _server_install_from_package

case node.platform_family
when "debian"
  pkg = node.redis.package_name
when "rhel", "fedora"
  include_recipe node.redis.yum_epel_recipe
  pkg = "redis"
else
  pkg = "redis"
end

package "redis" do
  package_name pkg
  action :install
end
