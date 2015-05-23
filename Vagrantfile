require 'yaml'
local_config = YAML::load_file('config.yml')

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.hostname = 'vm-common'
    config.vm.synced_folder '.', '/vagrant', disabled: true

    config.vm.provider :digital_ocean do |provider, override|
        override.ssh.private_key_path = local_config['do_ssh_key_path']
        override.vm.box = 'digital_ocean'
        override.vm.box_url = 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box'

        provider.token = local_config['do_token']
        provider.image = 'ubuntu-14-04-x64'
        provider.region = 'fra1'
        provider.size = '512mb'
    end

    config.vm.provider :aws do |provider, override|
      override.ssh.username = 'ubuntu'
      override.ssh.private_key_path = local_config['aws_ssh_key_path']
      override.vm.box = 'dummy'
      override.vm.box_url = 'https://github.com/mitchellh/vagrant-aws/raw/master/dummy.box'

      provider.access_key_id = local_config['aws_key']
      provider.secret_access_key = local_config['aws_secret']
      provider.keypair_name = 'vagrant'
      provider.ami = 'ami-d6e7c084'
      provider.instance_type = 'm3.medium'
      provider.region = 'ap-southeast-1'
    end

    config.vm.provision 'ansible' do |ansible|
        ansible.playbook = 'ansible/playbook.yml'
    end
end
