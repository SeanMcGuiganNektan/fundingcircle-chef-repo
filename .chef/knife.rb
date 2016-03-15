# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "fcadmin"
client_key               "#{current_dir}/fcadmin.pem"
validation_client_name   "fundingcircle-validator"
validation_key           "#{current_dir}/fundingcircle-validator.pem"
chef_server_url          "https://chef.fc-staging.co.uk/organizations/fundingcircle"
cookbook_path            ["#{current_dir}/../cookbooks"]
