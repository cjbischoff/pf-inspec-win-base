# frozen_string_literal: true

title 'default recipe'

control 'TimeZone' do
  impact 0.1
  title 'Ensure TimeZone is set to Pacific Standard Time'
  desc  'Ensure TimeZone is set to Pacific Standard Time'
  describe registry_key('HKLM\System\CurrentControlSet\Control\TimeZoneInformation') do
    it { should exist }
    its('TimeZoneKeyName') { should eq 'Pacific Standard Time' }
  end
end

control 'Virtual Memory Page' do
  impact 0.1
  title 'Ensure Set virtual memory page file size to auto managed'
  desc  'Ensure Set virtual memory page file size to auto managed'
  script = <<-EOH
      (Get-WmiObject -Class Win32_ComputerSystem -EnableAllPrivileges).AutomaticManagedPageFile
    EOH
  describe powershell(script) do
    its('stdout') { should eq "True\r\n" }
  end
end

control 'Windows Firewall' do
  impact 0.1
  title 'Ensure Windows Firewall is disabled'
  desc  'Ensure Windows Firewall is disabled'
  script = <<-EOH
       (Get-NetFirewallProfile | Where-Object {$_.Enabled -eq "True"}).Count -eq 0
      EOH
  describe powershell(script) do
    its('stdout') { should eq "False\r\n" }
  end
end

control 'Taskbar' do
  impact 0.1
  title 'Ensure Taskbar Combines When Full'
  desc  'Ensure Taskbar Combines When Full'
  describe registry_key('HKLM\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced') do
    it { should exist }
    its('TaskbarGlomLevel') { should eq '00000001' }
  end
end
