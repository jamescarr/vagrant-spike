# My Feeble Attempt at Using Vagrant+Puppet
This is my attempt to use Vagrant and Puppet, which I am completely new
with. I followed these instructions:

* http://vagrantup.com/
* http://vagrantup.com/docs/provisioners/puppet.html

Getting started I had issues with the simple apache example, following
the instructions found
[here](https://github.com/mitchellh/vagrant/issues/586) helped me fix
the issue and get up and running.


And used these modules:

* http://forge.puppetlabs.com/portertech/mongodb


## Notes
* MongoDB took awhile to install... it felt like it was simply hanging.
  Is there someway to get a progress indicator so the user can know it
is installing?
* [Other VDIs](vagrantbox.es)
* Run `vagrant provision` to run provisioning again
