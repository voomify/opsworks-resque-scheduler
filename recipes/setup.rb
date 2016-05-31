#
# Cookbook Name:: opsworks-resque-scheduler
# Recipe:: setup
#

node[:deploy].each do |application, deploy|
  settings = node[:resque_scheduler][application]
  if settings
    template "/etc/init/resque-scheduler-#{application}.conf" do
      source "resque-scheduler.conf.erb"
      mode "0755"
      variables application: application, deploy: deploy
    end
  end
end
