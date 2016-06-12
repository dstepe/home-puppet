node "marvin.tf5net.local" {

	include user

	class { 'ssh::server':
		storeconfigs_enabled => false,
		options => {
			'PasswordAuthentication' => 'no',
			'PermitRootLogin'        => 'no',
			'Port'                   => [22, 2222],
		}
	}

	class { 'sudo': }
	sudo::conf { 'dstepe':
		priority => 10,
		content  => "%wheel ALL=(ALL) NOPASSWD: ALL",
	}
}
