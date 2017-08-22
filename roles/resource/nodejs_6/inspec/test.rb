control 'nodejs_6-1.0' do
    impact 1.0
    title 'nodejs_6'
    
    describe package('nodejs') do
        it { should be_installed }
        its('version') { should match /^6.*/ }
    end
end
