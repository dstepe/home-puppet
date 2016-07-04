class cameraftp {
	file { '/var/cameras':
		ensure => 'directory',
		owner => 'root',
		group => 'cameras',
		mode  => '775',
	}

	group { 'cameras':
		ensure => 'present',
	}
	
	user { 'camera1':
		ensure => 'present',
		comment => 'Camera 1',
		home => '/var/cameras/camera1',
		managehome => true,
		password => '$1$wtZfSWpg$NvW7jd12QuFMku4KBWQFe.',
		groups => ['cameras'],
	}
        user { 'camera2':
                ensure => 'present',
                comment => 'Camera 2',
                home => '/var/cameras/camera2',
                managehome => true,
		password => '$1$wtZfSWpg$NvW7jd12QuFMku4KBWQFe.',
                groups => ['cameras'],
        }

	file { '/usr/local/bin/moveSnaps.sh':
		mode => '0755',
		owner => 'root',
		group => 'root',
		source => 'puppet:///modules/cameraftp/moveSnaps.sh',
	}

	cron { 'camera1snaps':
		command => '/usr/local/bin/moveSnaps.sh --camera camera1 >/dev/null 2>&1',
		user    => 'root',
		minute  => '*/5',
	}

	cron { 'camera2snaps':
		command => '/usr/local/bin/moveSnaps.sh --camera camera2 >/dev/null 2>&1',
		user    => 'root',
		minute  => '*/5',
	}
}
