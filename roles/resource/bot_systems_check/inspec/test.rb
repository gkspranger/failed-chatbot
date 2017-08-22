control 'bot_systems_check-1.0' do
    impact 1.0
    title 'bot_systems_check'
    
    describe file('/usr/local/bin/bot_systems_check') do
        it { should be_file }
        it { should be_executable }
        it { should be_owned_by 'root' }
    end
end
