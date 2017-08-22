control 'redis-1.0' do
    impact 1.0
    title 'redis'
    
    describe package('redis') do
        it { should be_installed }
    end

    describe service('redis') do
        it { should be_enabled }
        it { should be_running }
    end

    describe port.where { protocol =~ /tcp/ && port == 6379 } do
        it { should be_listening }
    end
end
