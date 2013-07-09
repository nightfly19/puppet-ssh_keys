class ssh_keys::params (
  $homedir_locations = {
    'Debian' => '/home',
    'Solaris' => '/export/home',
  },
  $fallback_homedir_location = '/home'
) {}
