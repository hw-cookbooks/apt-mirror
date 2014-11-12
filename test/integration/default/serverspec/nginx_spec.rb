require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('nginx') do
  it { should be_installed }
end

describe package('apt-mirror') do
  it { should be_installed }
end

describe file('/etc/nginx/sites-available/apt-mirrors') do 
  it { should be_owned_by 'root' }
  it { should be_mode 644 }    
  its(:content) { should match /listen  80;/ }
  its(:content) { should match /access_log \/var\/log\/nginx\/mirror-access.log/ }
  its(:content) { should match /location \/trusty/ }
  its(:content) { should match /alias \/ci\/apt-mirror\/mirror\/gb.archive.ubuntu.com/ }  
end

describe file('/etc/nginx/sites-enabled/apt-mirrors') do 
  it { should be_linked_to '/etc/nginx/sites-available/apt-mirrors' }  
end

describe port(80) do
  it { should be_listening }
end

describe process("nginx") do
  it { should be_running }
end