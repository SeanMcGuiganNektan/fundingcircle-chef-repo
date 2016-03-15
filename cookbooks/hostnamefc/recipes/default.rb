#
# Cookbook Name:: hostname
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute 'set_hostname' do
  command "/bin/hostname #{node[:fc][:hostname]}"
  not_if "/bin/hostname | grep #{node[:fc][:hostname]}"
end

template "#{node[:hosts][:file]}" do
  source "hosts.erb"
  owner "root"
  group "root"
  variables({
  :host_ip => node['ipaddress'],
  :host_name => node['fc']['hostname'] 
})
end

ruby_block "update_hostname" do
    block do
    file = Chef::Util::FileEdit.new("#{node[:hostnm][:file]}")
    file.search_file_replace_line(/^HOSTNAME=(.*)/,"HOSTNAME=#{node[:fc][:hostname]}")
    file.write_file
  end
  not_if "grep #{node[:fc][:hostname]} #{node[:hostnm][:file]}"
  notifies :restart, 'service[network]', :immediately
end

service 'network' do
  supports :restart => true
  action [:enable, :start]
end














