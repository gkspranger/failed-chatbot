control 'timezone-1.0' do
    impact 1.0
    title 'timezone'

  describe bash('grep ZONE /etc/sysconfig/clock') do
    its('stdout') { should match /.*{{ bot_clients[ ec2_tags.tags.client ].tz | regex_replace("/", "\/") }}.*/ }
  end
end
