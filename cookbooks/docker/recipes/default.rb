#
# Cookbook:: docker
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

file '/etc/yum.repos.d/docker.repo' do
content '[Docker]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/$releasever/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg'
end

execute 'update' do
  cwd "/var/www/html"
  command "yum -y update"
end

package 'docker-engine'

service 'docker' do
  action [:enable, :start]
end

package 'git'

git '/var/www/html/MyBlog' do
  repository 'https://github.com/vemular1/MyBlog.git'
  revision 'master'
  action :sync
  user 'root'
  group 'root'
end

execute 'pull' do
  command "docker pull httpd"
  command "docker run -d -p 81:80 -v /var/www/html/MyBlog:/usr/local/apache2/htdocs/MyBlog httpd"
end

