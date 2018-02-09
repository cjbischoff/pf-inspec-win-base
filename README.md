# pf-inspec-win-base

This compliance profiles ensures systems are deployed per the pf-win-base cookbook.

Exernal compliance profiles are pulled specific to 

- [hardening](https://github.com/dev-sec/windows-baseline)
- [patching](https://github.com/dev-sec/windows-patch-baseline)
- [CIS Benchmark Windows 2016 Level1](https://github.com/cjbischoff/inspec-cis-windows2016rtm-level1-memberserver)
- [CIS Benchmark Windows 2016 Level2](https://github.com/cjbischoff/inspec-cis-windows2016rtm-level2-memberserver)

## Profile Layout

- reponame will be based upon the Chef Cookbookb being tested against prepended with `pf-inspec`
- control files will be created/associated per recipe within the Cookbook; notated using `cookbook name`-`recipe`

## Standalone Usage

This Compliance Profile requires [InSpec](https://github.com/chef/inspec) for execution:

```
$ git clone git@github.com:cjbischoff/pf-inspec-win-base.git
$ inspec exec pf-inspec
```
You can also execute the profile directly from Github:

```
$ inspec exec https://github.com/cjbischoff/pf-inspec-win-base

# run test on remote windows host on WinRM
$ inspec exec test.rb -t winrm://Administrator@windowshost --password 'your-password'
```
