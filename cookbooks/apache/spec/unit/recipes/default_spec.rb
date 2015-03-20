#
# Cookbook Name:: apache
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'apache::default' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
    
    it 'installs the apache package' do
      expect(chef_run).to install_package "httpd"
    end
    
    it 'start the apache service' do
      expect(chef_run).to start_service "httpd"
    end
  end
  
  context 'on an CentOs platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(:platform => "centos", :version => "6.4")
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
    
    it 'installs the apache package' do
      expect(chef_run).to install_package "httpd"
    end
    
    it 'start the apache service' do
      expect(chef_run).to start_service "httpd"
    end
  end
  
  context 'on an Ubuntu platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new(:platform => "ubuntu", :version => "12.04")
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
    
    it 'installs the apache package' do
      expect(chef_run).to install_package "apache2"
    end
    
    it 'start the apache service' do
      expect(chef_run).to start_service "apache2"
    end
  end
end
