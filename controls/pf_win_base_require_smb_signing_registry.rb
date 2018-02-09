# frozen_string_literal: true

title 'require_smb_signing_registry recipe'

control 'SMB Signing' do
  impact 0.1
  title 'Ensure SMB signing is enabled'
  desc  'Ensure SMB signing is enabled'
  describe registry_key('HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanmanWorkStation\Parameters') do
    it { should exist }
    its('RequireSecuritySignature') { should eq 1 }
  end
end
