node "marvin.tf5net.local" {

	include user

	include cameraftp

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

	class { 'vsftpd':
		anonymous_enable  => 'NO',
		write_enable      => 'YES',
		ftpd_banner       => 'TF5Net FTP Server',
		local_enable      => true,
		#chroot_local_user => 'YES',
	}
}
