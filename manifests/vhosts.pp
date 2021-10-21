# @summary A short summary of the purpose of this defined type.
#   Genrated vistual hosts files
#
# @example
#   apache::vhosts { 'namevar': }
define apache::vhosts (
  Integer $port,
  String[1] $subdomain,
  String $admin,
  String[1] $docroot,
) {
  file {"${docroot}":
    ensure => 'directory',
    owner  => $apache::vhosts_owner,
    group  => $apache::vhosts_group,
  }
 
  file { "${apache::vhosts_dir}/${subdomain}.conf":
   ensure  => 'file',
   owner   => $apache::vhosts_owner,
   group   => $apache::vhosts_group,
   mode    => '0644',
   content => epp('apache/vhosts.conf.epp', {'port' => $port, 'subdomain' => $subdomain, 'admin' => $admin, 'docroot' => $docroot}),
   notify  => Service['apache_service'],
  }
}
