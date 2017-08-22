control 'zlib_devel-1.0' do
    impact 1.0
    title 'zlib_devel'
    
    describe package('zlib-devel') do
        it { should be_installed }
    end
end
