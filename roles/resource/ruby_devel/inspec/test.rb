control 'ruby_devel-1.0' do
    impact 1.0
    title 'ruby_devel'
    
    describe package('ruby-devel') do
        it { should be_installed }
    end
end
