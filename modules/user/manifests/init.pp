class user {
	user { 'dstepe':
		ensure  => present,
		comment => 'Dirk Tepe',
		home    => '/home/dstepe',
		managehome => true
	}
	ssh_authorized_key { 'dstepe_ssh':
		user => 'dstepe',
		type => 'rsa',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDlkpcrJuF0EbX4YZb87JQ5UoEgVSxgAayup3CeYojilInN1LGRVz1TxiKeFDRCgJ/z5Xe9S24gkVdPFsOIQCdupV+RmEN8jcj/y6neDiX/UGqZamRu5bPZhIGBDlK8rxXhFJO0QQN1Rto0u0HMe2YRjC10FVtInn/tS8h1yRzpGhfXpztaGWAegpv8+zfiA2VZ6X7eSLhJDXfOaREbJHkUIe9qjjYbOqqJT+9dG2992MMfFJp3GxqpdsOTbiasD0c+fwqnIKqDGOSuBpoZ0q+vmFcJyVXJDU+SAIO0K3gHw/TMQ59bZdqGzWvD8R82uIg7sS1oATzApExS8VedsAQT',
	}
}
