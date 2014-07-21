# puppetdbversion.rb
# Supply the PuppetDB version as a fact
# 
Facter.add("puppetdbversion") do
  confine :kernel => %w{Linux FreeBSD OpenBSD SunOS HP-UX GNU/kFreeBSD}
  setcode do
    versionfile = '/var/lib/puppet/puppetdbversion'
    if File.exists?(versionfile) and (File.stat(versionfile).mtime.to_i + (12*60*60) >= Time.now().to_i)
      %x{cat #{versionfile}}.chomp.to_f
    else
      output = %x{/usr/bin/java -cp /usr/share/puppetdb/puppetdb.jar clojure.main -m com.puppetlabs.puppetdb.core version 2>/dev/null | grep '^version'}
      output.chomp!
      if output.length >0
        val = output.split('=')[-1]
        File.open(versionfile,'w') {|x| x.write(val)}
        val.to_f
      else
        ''
      end
    end
  end
end
