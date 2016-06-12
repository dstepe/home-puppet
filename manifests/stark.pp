node "stark.tf5net.local" {

	package { 'epel-release':
		ensure => 'installed',
	}

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

	class { 'openvpn':  }
	openvpn::server { 'tf5net':
		country      => 'US',
		province     => 'OH',
		city         => 'Hamilton',
		organization => 'tf5net.local',
		email        => 'dstepe@gmail.com',
		server       => '10.200.200.0 255.255.255.0',
	}
}
