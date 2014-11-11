require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('apt-mirror') do
  it { should be_installed }
end

describe file('/ci/apt-mirror') do
  it { should be_directory }
  it { should be_owned_by 'root' }
  it { should be_mode 755 }
end

describe file('/etc/apt/mirror.list') do 
  it { should be_owned_by 'root' }
  it { should be_mode 644 }
    
  its(:content) { should match /set base_path     \/ci\/apt-mirror/ }
  its(:content) { should match /deb http:\/\/gb.archive.ubuntu.com\/ubuntu trusty main restricted universe multiverse/ }
  its(:content) { should match /deb http:\/\/gb.archive.ubuntu.com\/ubuntu trusty-security main restricted universe multiverse/ }
  its(:content) { should match /deb http:\/\/gb.archive.ubuntu.com\/ubuntu trusty-updates main restricted universe multiverse/ }
  its(:content) { should match /deb-src http:\/\/gb.archive.ubuntu.com\/ubuntu trusty main restricted universe multiverse/ }
  its(:content) { should match /deb-src http:\/\/gb.archive.ubuntu.com\/ubuntu trusty-security main restricted universe multiverse/ }
  its(:content) { should match /deb-src http:\/\/gb.archive.ubuntu.com\/ubuntu trusty-updates main restricted universe multiverse/ }
  its(:content) { should match /clean http:\/\/gb.archive.ubuntu.com\/ubuntu/ }                                    
end


#describe "apt-mirror::nginx" do
#  #check nginx is running
#  it "has a running nginx service" do
#    expect(service("nginx")).to be_running
#  end   
#end 