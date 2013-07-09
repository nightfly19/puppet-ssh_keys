define ssh_keys::user (
  $user           = $title,
  $group          = $concat::setup::root_group, 
  $homedir        = "${ssh_keys::homedir_base}/${title}",
  $manage_ssh_dir = false
) {
  include ssh_keys

  $ssh_dir = "${homedir}/.ssh"

  if $manage_ssh_dir {
    file{$ssh_dir:
      ensure => directory,
      owner  => $user,
      group  => $group,
      mode   => '0700',
    }
  }  

  $authorized_keys_file = "${ssh_dir}/authorized_keys"

  concat{"ssh_keys::user::${user}":
    path  => $authorized_keys_file,
    owner => $user,
    group => $group,
    mode  => '0600',
    require => $manage_ssh_dir ? {
      true    => [File["${ssh_dir}"]],
      default => []
    }
  }

  concat::fragment{"${user}-header":
    target   => "ssh_keys::user::${user}",
    content  => "## Managed by puppet via ssh_keys module\n## You CANNOT manage this file manually\n",
    order    => 01,
  }
}
