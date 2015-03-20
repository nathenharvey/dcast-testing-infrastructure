require 'spec_helper'

describe 'apache::default' do

  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  
  it 'listenting on port 80' do
    expect(port 80).to be_listening
  end

end