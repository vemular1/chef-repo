# See https://docs.getchef.com/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "vemular1"
client_key               "#{current_dir}/vemular1.pem"
chef_server_url          "https://vemular15.mylabserver.com/organizations/vemulaorg"
cookbook_path            ["#{current_dir}/../cookbooks"]
