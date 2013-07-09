define ssh_keys::authorized_key (
  $key_line,
  $user
) {

  $hashed_key_line = md5($key_line)

  concat::fragment{"${user}-${hashed_key_line}":
    target    => "ssh_keys::user::${user}",
    content   => "${key_line}\n",
    order     => 02,
  }
}
