control 'gcp-single-zone-1' do
  title 'Check the status of a single zone'
  describe google_compute_zone(project: 'k8s-node-224301',  zone: 'us-east1-c') do
    it { should exist }
    
  end
end


control 'gcp-instance-instance-name' do 
  title 'Check Instance Name'
  describe google_compute_instances(project: 'k8s-node-224301',  zone: 'us-east1-c') do
    its('instance_names') { should include "james-gcp-ubuntu" }
  end
end

control 'gcp-instance-instance-running' do 
  title 'Check Instance is Running'
  describe google_compute_instance(project: 'k8s-node-224301',  zone: 'us-east1-c', name: 'james-gcp-ubuntu') do
    its('status') { should eq 'RUNNING' }
  end
end

control 'gcp-instance-size' do
  title 'Check instance size'
  describe google_compute_instance(project: 'k8s-node-224301',  zone: 'us-east1-c', name: 'james-gcp-ubuntu') do
    its('machine_type') { should match "f1-micro" }
  end
end


