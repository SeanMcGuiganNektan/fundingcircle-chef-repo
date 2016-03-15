default['fc']['ipsub'] = node['ipaddress'].gsub('.','-')
default['fc']['env'] = node.chef_environment
default['fc']['domainname'] = "platform.fc.com"
default['fc']['hostname'] = "#{node[:fc][:env]}-ip-#{node[:fc][:ipsub]}"
default['hosts']['file'] = "/etc/hosts"
#
default['hostnm']['file'] = "/etc/sysconfig/network"

