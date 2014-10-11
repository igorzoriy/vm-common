require 'yaml'
local_config = YAML::load_file('config.yml')

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'digital_ocean'

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    config.vm.hostname = 'vm-common'
    config.vm.synced_folder '.', '/vagrant', disabled: true

    config.vm.provider :digital_ocean do |provider, override|
        override.ssh.private_key_path = local_config['ssh_key_path']
        override.vm.box = 'digital_ocean'
        override.vm.box_url = 'https://github.com/smdahlen/vagrant-digitalocean/raw/master/box/digital_ocean.box'

        provider.token = local_config['token']
        provider.image = 'Docker 1.2.0 on Ubuntu 14.04'
        provider.region = 'sgp1'
        provider.size = '512mb'
    end
end
