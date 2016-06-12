class user {
	user { 'dstepe':
		ensure  => present,
		comment => 'Dirk Tepe',
		home    => '/home/dstepe',
		managehome => true,
		groups  => ['wheel'],
	}
	ssh_authorized_key { 'dstepe_ssh':
		user => 'dstepe',
		type => 'rsa',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDlkpcrJuF0EbX4YZb87JQ5UoEgVSxgAayup3CeYojilInN1LGRVz1TxiKeFDRCgJ/z5Xe9S24gkVdPFsOIQCdupV+RmEN8jcj/y6neDiX/UGqZamRu5bPZhIGBDlK8rxXhFJO0QQN1Rto0u0HMe2YRjC10FVtInn/tS8h1yRzpGhfXpztaGWAegpv8+zfiA2VZ6X7eSLhJDXfOaREbJHkUIe9qjjYbOqqJT+9dG2992MMfFJp3GxqpdsOTbiasD0c+fwqnIKqDGOSuBpoZ0q+vmFcJyVXJDU+SAIO0K3gHw/TMQ59bZdqGzWvD8R82uIg7sS1oATzApExS8VedsAQT',
	}
	ssh_authorized_key { 'dstepe_marvin_ssh':
		user => 'dstepe',
		type => 'rsa',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAABAQDvYyN3vgUexJ11+RTfqxI7M3l5wtE2LWng8NW+M6lDjC1S/rtRN5ySsIg9j74sW1ZS5W1I3VgSfertNJLyqSLjYjVCG9lt7lsimXkHMCmTCjMZTZReDLBegSO3c5stJXKqGyNdMUD3aXdO+1ydMuIM+i2tN7Z11ShWi+b23PHEuZ+bY3f4Hm2cTnvV/iSKZ1gCmgWl+kg5F98we0BccuxApNR5wvXeJ/kvFsrbl/mI2bOSgQQ/XHY/7Fockked0O7sCMAY+Z8KM+wtqxZgXPQBH5/w9IwxSs5i7S0lIP0jT6A0SsgI49Mdr9ABDrA+UykVzJ3eXsqssvzG+lE6vCMR',
	}
}
