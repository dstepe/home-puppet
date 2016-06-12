require 'spec_helper'

describe 'openvpn::client', :type => :define do
  let(:title) { 'test_client' }
  let(:params) { { 'server' => 'test_server' } }
  let(:facts) { {
    :fqdn           => 'somehost',
    :concat_basedir => '/var/lib/puppet/concat',
    :osfamily       => 'Debian',
    :lsbdistid      => 'Ubuntu',
    :lsbdistrelease => '12.04',
  } }
  let(:pre_condition) do
    'openvpn::server { "test_server":
      country       => "CO",
      province      => "ST",
      city          => "Some City",
      organization  => "example.org",
      email         => "testemail@example.org"
    }'
  end

  it { should contain_exec('generate certificate for test_client in context of test_server') }

  [ 'test_client', 'test_client/keys/test_client'].each do |directory|
    it { should contain_file("/etc/openvpn/test_server/download-configs/#{directory}") }
  end

  [ 'test_client.crt', 'test_client.key', 'ca.crt' ].each do |file|
    it { should contain_file("/etc/openvpn/test_server/download-configs/test_client/keys/test_client/#{file}").with(
      'ensure'  => 'link',
      'target'  => "/etc/openvpn/test_server/easy-rsa/keys/#{file}"
    )}
  end

  it { should contain_exec('tar the thing test_server with test_client').with(
    'cwd'     => '/etc/openvpn/test_server/download-configs/',
    'command' => '/bin/rm test_client.tar.gz; tar --exclude=\*.conf.d -chzvf test_client.tar.gz test_client'
  ) }

  context "setting the minimum parameters" do
    let(:params) { { 'server' => 'test_server' } }

    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^client$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^ca\s+keys\/test_client\/ca\.crt$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^cert\s+keys\/test_client\/test_client.crt$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^key\s+keys\/test_client\/test_client\.key$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^dev\s+tun$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^proto\s+tcp$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^remote\s+somehost\s+1194$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^comp-lzo$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^resolv-retry\s+infinite$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^nobind$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^persist-key$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^persist-tun$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^mute-replay-warnings$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^ns\-cert\-type\s+server$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^verb\s+3$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^mute\s+20$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^auth-retry\s+none$/)}
  end

  context "setting all of the parameters" do
    let(:params) { {
      'server'                => 'test_server',
      'compression'           => 'comp-something',
      'dev'                   => 'tap',
      'mute'                  => 10,
      'mute_replay_warnings'  => false,
      'nobind'                => false,
      'persist_key'           => false,
      'persist_tun'           => false,
      'cipher'                => 'BF-CBC',
      'port'                  => '123',
      'proto'                 => 'udp',
      'remote_host'           => 'somewhere',
      'resolv_retry'          => '2m',
      'auth_retry'            => 'interact',
      'verb'                  => '1',
      'setenv'                => {'CLIENT_CERT' => '0'},
      'setenv_safe'           => {'FORWARD_COMPATIBLE' => '1'}
    } }
    let(:facts) { {
      :fqdn           => 'somehost',
      :concat_basedir => '/var/lib/puppet/concat',
      :osfamily       => 'Debian',
      :lsbdistid      => 'Ubuntu',
      :lsbdistrelease => '12.04',
    } }

    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^client$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^ca\s+keys\/test_client\/ca\.crt$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^cert\s+keys\/test_client\/test_client.crt$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^key\s+keys\/test_client\/test_client\.key$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^dev\s+tap$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^proto\s+udp$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^remote\s+somewhere\s+123$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^comp-something$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^resolv-retry\s+2m$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^verb\s+1$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^mute\s+10$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^auth-retry\s+interact$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^setenv\s+CLIENT_CERT\s+0$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^setenv_safe\s+FORWARD_COMPATIBLE\s+1$/)}
    it { should contain_file('/etc/openvpn/test_server/download-configs/test_client/test_client.conf').with_content(/^cipher\s+BF-CBC$/)}
  end

end