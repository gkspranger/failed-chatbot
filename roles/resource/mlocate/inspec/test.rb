control 'mlocate-1.0' do
    impact 1.0
    title 'mlocate'
    
    describe package('mlocate') do
        it { should be_installed }
    end
end
