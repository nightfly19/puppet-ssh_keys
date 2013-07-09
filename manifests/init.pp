class ssh_keys {
  include ssh_keys::params
  $_homedir_base = $ssh_keys::params::homedir_locations["${osfamlily}"]
  $homedir_base = $_homedir_base ? {
    undef   => $ssh_keys::params::fallback_homedir_location,
    default => $_homedir_base
  }
}
