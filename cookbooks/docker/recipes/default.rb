#
# Cookbook:: docker
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

execute 'name' do
  cwd "/var/www/html/"
  command "yum -y update"
  command "yum -y install git"
  command "git clone https://github.com/vemular1/MyBlog.git"
  command "docker pull httpd"
  command "docker run -d -p 81:81 -v /var/www/html:/usr/local/apache2/htdocs httpd"
end

