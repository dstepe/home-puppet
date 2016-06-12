class cameraftp {
	group { 'cameras':
		ensure => 'present',
	}
	
	user { 'camera1':
		ensure => 'present',
		comment => 'Camera 1',
		home => '/home/camera1',
		managehome => true,
		password => '$1$wtZfSWpg$NvW7jd12QuFMku4KBWQFe.',
		groups => ['cameras'],
	}
        user { 'camera2':
                ensure => 'present',
                comment => 'Camera 2',
                home => '/home/camera2',
                managehome => true,
		password => '$1$wtZfSWpg$NvW7jd12QuFMku4KBWQFe.',
                groups => ['cameras'],
        }
}
