require 'yaml'
local_config = YAML::load_file('config.yml')

ENV['VAGRANT_DEFAULT_PROVIDER'] = 'digital_ocean'

VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    config.ssh.private_key_path = local_config['ssh_key_path']

    config.vm.box = 'digital_ocean'
    config.vm.hostname = 'vm-common'

    config.vm.provider :digital_ocean do |provider|
        provider.token = local_config['token']
        provider.image = 'Ubuntu 14.04 x64'
        provider.region = 'sgp1'
    end
end
