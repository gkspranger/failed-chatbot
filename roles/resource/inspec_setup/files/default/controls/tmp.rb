# you add controls here
control 'tmp-1.0' do                    # A unique ID for this control
  impact 1.0                            # The criticality, if this control fails.
  title '/tmp directory'                # A human-readable title
  desc 'An optional description ..'
  
  describe file('/tmp') do              # The actual test
    it { should be_directory }
  end
end
