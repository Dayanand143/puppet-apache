# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache
class apache (
  String $install_name,
  String $install_ensure,
  String $config_ensure,
  String $config_path,
  Enum["running","stopped"] $service_name,
  String $service_name,
  Boolean $service_enable,
  String[1] $vhosts_dir,
  String[1] $vhosts_owner,
  String[1] $vhosts_group,
) {
  contains apache::install
  contains apache::config
  contains apache::service

  Class['::apache::install']
  -> Class['::apache::config']
  ~> Class['::apache::service']
}
