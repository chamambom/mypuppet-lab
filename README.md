# this is my puppet test pad , for creating puppet modules and manifests in my test environment running 
foreman/Puppet and a couple of Linux boxes

Creating a puppet/Git workflow for Collaboration
Prerequisites to consider before using this module
1.	For an existing repo, make sure that you’ve been tracking every lil bit of file in your git repo
2.	make sure that you check the permissions of certain files that you will be tracking before you override them
Navigate to any folder within your puppet master and install the vcsrepo module from puppet labs https://github.com/puppetlabs/puppetlabs-vcsrepo 
# puppet module install puppetlabs-vcsrepo [This is going to be installed in your module directory path] most likely # /etc/puppet/module or #/etc/puppet/environments/production/modules
Don’t copy the module from an existing install to avoid this error 
1.	https://obviate.io/2011/12/01/error-400-on-server-puppetparserastresource-failed-with-error-argumenterror-invalid-resource-type/ 
2.	Also make sure that git is installed on your puppet master
After installation, you can move the vcsrepo module from where it is to say /opt
Create the manifests directory within the module and create the init.pp file which contains the following code 
root@puppet:/opt/vcsrepo/manifests# cat init.pp
vcsrepo {‘/etc/puppet':
  ensure   => latest,
  provider => git,
  source   => 'https://token@url_to_your_git_repo.git',
  force=>true
}
NB: You can find working examples inside the vcsrepo examples folder if your environment is different
NB: Force=>true 
Use this on the initial puppet run, only. This is because for an existing repo, vcsrepo won’t be able to remove and recreate the desired repo , remove the option once the initial run has been done and remain with 
vcsrepo {‘/etc/puppet':
  ensure   => latest,
  provider => git,
  source   => 'https://token@liquidtelecom.kilnhg.com/Code/TeamZOL/Automation/ZOL-Puppet.git',
}
Create a puppet module that runs cron pointing to the init.pp manifest to complete the workflow.
Other 






