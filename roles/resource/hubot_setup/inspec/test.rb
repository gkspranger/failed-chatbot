control 'hubot_setup-1.0' do
    impact 1.0
    title 'hubot_setup'
    
    describe service('hubot') do
        it { should be_enabled }
        it { should be_running }
    end
end
