require 'chefspec'
require 'chefspec/berkshelf'

describe 'apt-mirror::default' do
 
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }    
           
  it 'installs apt-mirror' do
    expect(chef_run).to install_package('apt-mirror')
  end
    
  it 'creates basepath directory with attributes' do
    expect(chef_run).to create_directory('/var/spool/apt-mirror').with(
      user:   'root',
      group:  'root',
    )    
  end
    
  it 'creates a mirror.list template with attributes' do
    expect(chef_run).to create_template('/etc/apt/mirror.list').with(
      user:   'root',
      group:  'root'      
    )    
  end
    
end