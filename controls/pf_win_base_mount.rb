# frozen_string_literal: true

title 'mount recipe'

control 'Drive Mount' do
  impact 0.1
  title 'Ensure Volume is Mounted as D Drive'
  desc 'Ensure Volume is Mounted as D Drive'
  script = <<-EOH
        Test-Path -Path "D:\"
      EOH
  describe powershell(script) do
    its('stdout') { should eq "True\r\n" }
  end
end
