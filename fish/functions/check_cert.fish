function check_cert
  openssl s_client -connect $argv:443
end
