module Vagrant
  module Butcher
    class Plugin < Vagrant.plugin('2')
      name "vagrant-butcher"
      description <<-DESC
      Delete node and client from the Chef server when destroying the VM.
      DESC
      
      action_hook(:vagrant_butcher_cleanup, :machine_action_destroy) do |hook|
        hook.after(::Vagrant::Action::Builtin::ConfigValidate, Vagrant::Butcher::Action.cleanup)
      end
      
      config("butcher") do
        Config
      end
    end
  end
end
