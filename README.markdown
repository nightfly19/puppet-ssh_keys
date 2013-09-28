# SSH Keys Module

Sage Imel <sage@sagenite.net>

A concat based ssh authorized_keys management solution 
created mostly to work around ssh_authorized_keys not being able to purge old keys. 
Also since authorized keys are managed as file-lines you are not restricted to the subset of 
ssh authorized_keys functionality that the ssh_authorized_keys resource imposes.

# Dependencies

## Required
* [puppet-concat](http://forge.puppetlabs.com/puppetlabs/concat)

# Quick Start

This module has been tested on Ubuntu though it is intended to work on any Unix/Linux like supported playform.

## Example Usage

### Managing Keys

``` puppet
include ssh_keys

ssh_keys::user{'foo':
  manage_ssh_dir => true,
}
  
ssh_keys::authorized_key{'foo-laptop':
  key_line => 'ssh-rsa long-key-here foo@bar',
  user     => 'foo',
}
```
