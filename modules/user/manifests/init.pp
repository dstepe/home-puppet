class user {
	user { 'dstepe':
		ensure  => present,
		comment => 'Dirk Tepe',
		home    => '/home/dstepe',
		managehome => true
	} 
}
