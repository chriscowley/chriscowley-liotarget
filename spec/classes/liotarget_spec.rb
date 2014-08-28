require 'spec_helper'

describe 'liotarget' do
  context 'supported operating systems' do
    [ 'RedHat'].each do |osfamily|
      describe "liotarget class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
        }}

        it { should compile.with_all_deps }

        it { should contain_class('liotarget::params') }
        it { should contain_class('liotarget::install').that_comes_before('liotarget::config') }
        it { should contain_class('liotarget::config') }
#        it { should contain_class('liotarget::service').that_subscribes_to('liotarget::config') }

#        it { should contain_service('liotarget') }
        it { should contain_package('targetcli').with_ensure('present') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'liotarget class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should contain_package('targetcli') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
