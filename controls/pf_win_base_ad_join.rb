# frozen_string_literal: true

title 'ad_join recipe'

control 'Member of a domain' do
  impact 0.1
  title 'Ensure systems is a member of a domain'
  desc 'Ensure systems is a member of a domain'
  script = <<-EOH
      (Get-WmiObject -Class Win32_ComputerSystem).PartOfDomain
      EOH
  describe powershell(script) do
    its('stdout') { should eq "True\r\n" }
  end
end
