control 'slacktee-1.0' do
    impact 1.0
    title 'slacktee'
    
    describe file('/usr/local/bin/slacktee') do
        it { should be_file }
        it { should be_executable }
        it { should be_owned_by 'root' }
        its('content') { should match(/.*{{ ec2_tags.tags.bot_name }}.*/) }
    end
end
