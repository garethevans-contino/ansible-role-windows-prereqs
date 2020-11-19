
# Example Test.
describe file('C:/Windows/explorer.exe') do
  it { should exist }
  it { should be_file }
end

describe service("WinRM") do
  it { should be_installed }
  it { should be_running }
end

describe service("Telnet") do
  it { should_not be_installed }
end

describe port(23) do
  it { should_not be_listening }
end

describe port(80) do
  it { should_not be_listening }
end

describe port(443) do
  it { should_not be_listening }
end

describe port(3389) do
  it { should be_listening }
end

# look for all administrators: SID: S-1-5-21domain-500
describe users.where { uid =~ /S\-1\-5\-21\-\d+\-\d+\-\d+\-500/ } do
  it { should exist }
end

describe chocolatey_package('baretail') do
  it { should be_installed }
end
