# Introduction to Testing Chef

This repository contains slides and code used in a presentation for the 
[DC Agile Software Testing Group (DCAST) meetup on March 19, 2015](http://www.meetup.com/D-CAST/events/220138533/).

### Prerequisites

Before running any of the code, you will need to install the [Chef Development 
Kit](https://downloads.chef.io/chef-dk/).

### Apache Cookbook

This is a simple Chef cookbook that will install Apache on Ubuntu or CentOS 
servers.

It includes:

code syntax and linting

    $ foodcritic .
    
Unit testing with [ChefSpec](http://sethvargo.github.io/chefspec/)

    $ rspec spec
    .........

    Finished in 4.24 seconds (files took 4.42 seconds to load)
    9 examples, 0 failures

And integration testing with [Test Kitchen](http://kitchen.ci/) and 
[Serverspec](http://serverspec.org/)

    $ kitchen test -c
     -----> Starting Kitchen (v1.3.1)
     -----> Cleaning up any prior instances of <default-centos-64>
     -----> Destroying <default-centos-64>...
     -----> Cleaning up any prior instances of <default-ubuntu-1204>
     -----> Destroying <default-ubuntu-1204>...
            Finished destroying <default-centos-64> (0m0.00s).
            Finished destroying <default-ubuntu-1204> (0m0.00s).
     -----> Testing <default-centos-64>
     -----> Creating <default-centos-64>...
     -----> Testing <default-ubuntu-1204>
     -----> Creating <default-ubuntu-1204>...
            EC2 instance <i-55acf0a5> created.
     .       EC2 instance <i-b9acf049> created.
     ....................................       (server ready)
     ............       (server ready)
            Waiting for ec2-54-174-151-195.compute-1.amazonaws.com:22...
            Waiting for ec2-54-174-151-195.compute-1.amazonaws.com:22...
            Waiting for ec2-54-174-151-195.compute-1.amazonaws.com:22...
            (ssh ready)\n
            Finished creating <default-ubuntu-1204> (0m47.45s).
     -----> Converging <default-ubuntu-1204>...
            Preparing files for transfer
            Preparing dna.json
            Resolving cookbook dependencies with Berkshelf 3.2.3...
            Removing non-cookbook files before transfer
            Preparing validation.pem
            Preparing client.rb
     -----> Installing Chef Omnibus (install only if missing)
            downloading https://www.chef.io/chef/install.sh
              to file /tmp/install.sh
            trying wget...
            Downloading Chef  for ubuntu...
            downloading https://www.chef.io/chef/metadata?v=&prerelease=false&nightlies=false&p=ubuntu&pv=12.04&m=x86_64
              to file /tmp/install.sh.946/metadata.txt
            trying wget...
            url	https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chef_12.1.1-1_amd64.deb
            md5	9332b8ffa29697cdc5f6062607b99100
            sha256	fa2303e4cd8e5f8f73f111c699adadf81d0cd26cef43b9d18c9a93a903ed4ed0
            downloaded metadata file looks valid...
            downloading https://opscode-omnibus-packages.s3.amazonaws.com/ubuntu/12.04/x86_64/chef_12.1.1-1_amd64.deb
              to file /tmp/install.sh.946/chef_12.1.1-1_amd64.deb
            trying wget...
            Comparing checksum with sha256sum...
            Installing Chef
            installing with dpkg...
            Selecting previously unselected package chef.
     (Reading database ... 47460 files and directories currently installed.)
            Unpacking chef (from .../chef_12.1.1-1_amd64.deb) ...
            Setting up chef (12.1.1-1) ...
            Thank you for installing Chef!
            Processing triggers for initramfs-tools ...
            update-initramfs: Generating /boot/initrd.img-3.2.0-52-virtual
            Transferring files to <default-ubuntu-1204>
            Starting Chef Client, version 12.1.1
            Creating a new client identity for default-ubuntu-1204 using the validator key.
            [2015-03-20T12:22:11+00:00] WARN: Child with name 'dna.json' found in multiple directories: /tmp/kitchen/dna.json and /tmp/kitchen/dna.json
            [2015-03-20T12:22:11+00:00] WARN: Child with name 'dna.json' found in multiple directories: /tmp/kitchen/dna.json and /tmp/kitchen/dna.json
            resolving cookbooks for run list: ["apache::default"]
            [2015-03-20T12:22:11+00:00] WARN: Child with name 'dna.json' found in multiple directories: /tmp/kitchen/dna.json and /tmp/kitchen/dna.json
            Synchronizing Cookbooks:
              - apache
              - apt
            Compiling Cookbooks...
            Converging 10 resources
            Recipe: apt::default
              * execute[apt-get-update] action run (skipped due to not_if)
              * execute[apt-get update] action nothing (skipped due to action :nothing)
              * execute[apt-get autoremove] action nothing (skipped due to action :nothing)
              * execute[apt-get autoclean] action nothing (skipped due to action :nothing)
            Waiting for ec2-54-174-158-233.compute-1.amazonaws.com:22...
              * apt_package[update-notifier-common] action install (up to date)
              * execute[apt-get-update-periodic] action run
                - execute apt-get update
              * directory[/var/cache/local] action create
                - create new directory /var/cache/local
                - change mode from '' to '0755'
                - change owner from '' to 'root'
                - change group from '' to 'root'
              * directory[/var/cache/local/preseeding] action create
                - create new directory /var/cache/local/preseeding
                - change mode from '' to '0755'
                - change owner from '' to 'root'
                - change group from '' to 'root'
            Recipe: apache::default
              * apt_package[apache2] action install
                - install version 2.2.22-1ubuntu1.8 of package apache2
              * service[apache2] action start (up to date)

            Running handlers:
            Running handlers complete
            Chef Client finished, 4/6 resources updated in 47.228981828 seconds
            Finished converging <default-ubuntu-1204> (1m33.12s).
     -----> Setting up <default-ubuntu-1204>...
     Fetching: thor-0.19.0.gem (100%)
            Successfully installed thor-0.19.0
     Fetching: busser-0.7.0.gem (100%)
            Successfully installed busser-0.7.0
            2 gems installed
     -----> Setting up Busser
            Creating BUSSER_ROOT in /tmp/busser
            Creating busser binstub
            Plugin serverspec installed (version 0.5.3)
     -----> Running postinstall for serverspec plugin
            Finished setting up <default-ubuntu-1204> (0m12.55s).
     -----> Verifying <default-ubuntu-1204>...
            Suite path directory /tmp/busser/suites does not exist, skipping.
            Uploading /tmp/busser/suites/serverspec/default_spec.rb (mode=0644)
            Uploading /tmp/busser/suites/serverspec/spec_helper.rb (mode=0644)
     -----> Running serverspec test suite
     -----> Installing Serverspec..
     Fetching: net-ssh-2.9.2.gem (100%)
     Fetching: net-scp-1.2.1.gem (100%)
     Fetching: specinfra-2.20.1.gem (100%)
     Fetching: multi_json-1.11.0.gem (100%)
     Fetching: diff-lcs-1.2.5.gem (100%)
     Fetching: rspec-support-3.2.2.gem (100%)
     Fetching: rspec-expectations-3.2.0.gem (100%)
     Fetching: rspec-core-3.2.2.gem (100%)
     Fetching: rspec-its-1.2.0.gem (100%)
     Fetching: rspec-mocks-3.2.1.gem (100%)
     Fetching: rspec-3.2.0.gem (100%)
     Fetching: serverspec-2.10.1.gem (100%)
     -----> serverspec installed (version 2.10.1)
            /opt/chef/embedded/bin/ruby -I/tmp/busser/suites/serverspec -I/tmp/busser/gems/gems/rspec-support-3.2.2/lib:/tmp/busser/gems/gems/rspec-core-3.2.2/lib /opt/chef/embedded/bin/rspec --pattern /tmp/busser/suites/serverspec/\*\*/\*_spec.rb --color --format documentation --default-path /tmp/busser/suites/serverspec

            apache::default
              listenting on port 80

            Finished in 0.7035 seconds (files took 1.11 seconds to load)
            1 example, 0 failures

            Finished verifying <default-ubuntu-1204> (0m14.48s).
     -----> Destroying <default-ubuntu-1204>...
            EC2 instance <i-b9acf049> destroyed.
            Finished destroying <default-ubuntu-1204> (0m0.92s).
            Finished testing <default-ubuntu-1204> (2m48.53s).
            Waiting for ec2-54-174-158-233.compute-1.amazonaws.com:22...
            Waiting for ec2-54-174-158-233.compute-1.amazonaws.com:22...
            Waiting for ec2-54-174-158-233.compute-1.amazonaws.com:22...
            Waiting for ec2-54-174-158-233.compute-1.amazonaws.com:22...
            (ssh ready)\n
            Finished creating <default-centos-64> (3m6.16s).
     -----> Converging <default-centos-64>...
            Preparing files for transfer
            Preparing dna.json
            Resolving cookbook dependencies with Berkshelf 3.2.3...
            Removing non-cookbook files before transfer
            Preparing validation.pem
            Preparing client.rb
     -----> Installing Chef Omnibus (install only if missing)
            downloading https://www.chef.io/chef/install.sh
              to file /tmp/install.sh
            trying curl...
              % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                      Dload  Upload   Total   Spent    Left  Speed
     100 18358  100 18358    0     0  49162      0 --:--:-- --:--:-- --:--:--  618k
            Downloading Chef  for el...
            downloading https://www.chef.io/chef/metadata?v=&prerelease=false&nightlies=false&p=el&pv=6&m=x86_64
              to file /tmp/install.sh.964/metadata.txt
            trying curl...
            url	https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-12.1.1-1.el6.x86_64.rpm
            md5	01e4e0e2688c297590134f4070956148
            sha256	1ed7d17df3f11069f19f31c6bbe4101b55334bf4ba6e96f8d022cb6750b48a63
            downloaded metadata file looks valid...
            downloading https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chef-12.1.1-1.el6.x86_64.rpm
              to file /tmp/install.sh.964/chef-12.1.1-1.el6.x86_64.rpm
            trying curl...
            Comparing checksum with sha256sum...
            Installing Chef
            installing with rpm...
            warning: /tmp/install.sh.964/chef-12.1.1-1.el6.x86_64.rpm: Header V4 DSA/SHA1 Signature, key ID 83ef826a: NOKEY
            Preparing...                ########################################### [100%]
               1:chef                   ########################################### [100%]
            Thank you for installing Chef!
            Transferring files to <default-centos-64>
            Starting Chef Client, version 12.1.1
            Creating a new client identity for default-centos-64 using the validator key.
            [2015-03-20T12:24:43+00:00] WARN: Child with name 'dna.json' found in multiple directories: /tmp/kitchen/dna.json and /tmp/kitchen/dna.json
            [2015-03-20T12:24:43+00:00] WARN: Child with name 'dna.json' found in multiple directories: /tmp/kitchen/dna.json and /tmp/kitchen/dna.json
            resolving cookbooks for run list: ["apache::default"]
            [2015-03-20T12:24:43+00:00] WARN: Child with name 'dna.json' found in multiple directories: /tmp/kitchen/dna.json and /tmp/kitchen/dna.json
            Synchronizing Cookbooks:
              - apache
              - apt
            Compiling Cookbooks...
            Converging 2 resources
            Recipe: apache::default

                - install version 2.2.15-39.el6.centos of package httpd
              * service[httpd] action start


            Running handlers:
            Running handlers complete
            Chef Client finished, 2/2 resources updated in 43.481730632 seconds
            Finished converging <default-centos-64> (1m42.48s).
     -----> Setting up <default-centos-64>...
     Fetching: thor-0.19.0.gem (100%)
            Successfully installed thor-0.19.0
     Fetching: busser-0.7.0.gem (100%)
            Successfully installed busser-0.7.0
            2 gems installed
     -----> Setting up Busser
            Creating BUSSER_ROOT in /tmp/busser
            Creating busser binstub
            Plugin serverspec installed (version 0.5.3)
     -----> Running postinstall for serverspec plugin
            Finished setting up <default-centos-64> (0m12.16s).
     -----> Verifying <default-centos-64>...
            Suite path directory /tmp/busser/suites does not exist, skipping.
            Uploading /tmp/busser/suites/serverspec/default_spec.rb (mode=0644)
            Uploading /tmp/busser/suites/serverspec/spec_helper.rb (mode=0644)
     -----> Running serverspec test suite
     -----> Installing Serverspec..
     Fetching: net-ssh-2.9.2.gem (100%)
     Fetching: net-scp-1.2.1.gem (100%)
     Fetching: specinfra-2.20.1.gem (100%)
     Fetching: multi_json-1.11.0.gem (100%)
     Fetching: diff-lcs-1.2.5.gem (100%)
     Fetching: rspec-support-3.2.2.gem (100%)
     Fetching: rspec-expectations-3.2.0.gem (100%)
     Fetching: rspec-core-3.2.2.gem (100%)
     Fetching: rspec-its-1.2.0.gem (100%)
     Fetching: rspec-mocks-3.2.1.gem (100%)
     Fetching: rspec-3.2.0.gem (100%)
     Fetching: serverspec-2.10.1.gem (100%)
     -----> serverspec installed (version 2.10.1)
            /opt/chef/embedded/bin/ruby -I/tmp/busser/suites/serverspec -I/tmp/busser/gems/gems/rspec-support-3.2.2/lib:/tmp/busser/gems/gems/rspec-core-3.2.2/lib /opt/chef/embedded/bin/rspec --pattern /tmp/busser/suites/serverspec/\*\*/\*_spec.rb --color --format documentation --default-path /tmp/busser/suites/serverspec

            apache::default
              listenting on port 80

            Finished in 0.51245 seconds (files took 1.11 seconds to load)
            1 example, 0 failures

            Finished verifying <default-centos-64> (0m15.01s).
     -----> Destroying <default-centos-64>...
            EC2 instance <i-55acf0a5> destroyed.
            Finished destroying <default-centos-64> (0m0.86s).
            Finished testing <default-centos-64> (5m16.68s).
     -----> Kitchen is finished. (5m18.26s)

