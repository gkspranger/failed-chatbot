control 'inspec_setup-1.0' do
    impact 1.0
    title 'inspec_setup'

    describe file('/usr/local/bin/rit') do
        it { should be_file }
        it { should be_executable }
        it { should be_owned_by 'root' }
    end
end
