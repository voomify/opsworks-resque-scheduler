node[:deploy].each do |application, deploy|
  if node[:resque_scheduler][application]
    service "resque-scheduler-#{application}" do
      action [:stop, :start]
      provider Chef::Provider::Service::Upstart
    end
  end
end