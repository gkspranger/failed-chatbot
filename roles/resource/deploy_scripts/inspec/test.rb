control 'deploy_scripts-1.0' do
    impact 1.0
    title 'deploy_scripts'
    
    dss = %w(
        dfa
        dfc
    )

    dss.each do |ds|
        describe file("/usr/local/bin/#{ds}") do
            it { should be_file }
            it { should be_executable }
            it { should be_owned_by 'root' }
        end
    end
end
