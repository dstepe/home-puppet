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
	ssh_authorized_key { 'dstepe_mercury_ssh':
		user => 'dstepe',
		type => 'rsa',
		key => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQCrSCIVx0TKIU3EjJulAMPjaBaITTdwDKgvbasiChOwS4qUwGWgFvM4nQLxC3cec+hMIH7ZEPsoNz+Kr+2EjLV9huMf1HfhwJknOEVHVd+0S+xsKmFeh84CtDtMIZqlRLbFmdf6F4c8augSQ75vvivJ00ae+2oPzkwj2Eny5vZu4ZsODb0nTJTkoet2ZqFo+4GBABek/s4CELW9/5xX127wj4FtINIRA/ySKIB+GD1rddYa1kXFn9ltsDZGoiLpQSnLrnmzm85MJDUx8IiLYtJW6UKe3fl1l86KGGhq3e8rRj5iV5UhJ8elHZquHHTaUzMrdKCiDY9RQygOY8StexG0DJI8wCZWZi4eplXkCr42j8j5n4VWgGQm3VFGfPRkZ8gZYRO4Ind9a4oxQ8y094tA5Lr6MlmZnHiXluVc8eMuOhUZ01FflDz8Ls1l5uG4BLMeV9OmtkE492A5PM72oo7t5KlmxpYw+LiUonQye0PyvEBJD9l71bFjgcBBcLqdDcwRcq622phP2j3B7CjCKOuYqK2bNP6/6AprInZoPveQDbY8Cttyt6F/nHCZz1gvXpxAuu25SAaZ0jjFcvyheJZ8Jr+vbE18HEGE/T00oMgdG/Cm1tgkeW1CPfgdncZvbssXPev+sPGIupUuleCkel9nb2AyqNlu1R9mubC9pGSUNw==',
	}
}
