control 'hubot_user-1.0' do
    impact 1.0
    title 'hubot_user'
    
    describe user('hubot') do
        it { should exist }
        its('uid') { should eq 5000 }
        its('home') { should eq '/opt/hubot' }
        its('shell') { should eq '/bin/bash' }
    end
end
