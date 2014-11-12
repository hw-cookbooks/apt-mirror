require 'chefspec'
require 'chefspec/berkshelf'

describe 'apt-mirror::nginx' do
 
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }    
 
  before do
    stub_command("which nginx").and_return(false)
  end
    
  it 'includes nginx recipe' do
     expect(chef_run).to include_recipe('nginx')
  end    
    
  it 'includes apt-mirror recipe' do
     expect(chef_run).to include_recipe('apt-mirror')
  end
    
  it 'installs nginx' do
    expect(chef_run).to install_package('nginx')
  end
        
  it 'creates a apt-mirrors template with attributes' do
    expect(chef_run).to create_template('/etc/nginx/sites-available/apt-mirrors').with(
      user:   'root',
      group:  'root'      
    )    
  end
    
end