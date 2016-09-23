This is a mirror of [Open Grid Scheduler](http://gridscheduler.sourceforge.net/), taken from [Subversion r156](https://sourceforge.net/p/gridscheduler/code/156/).  Patches from the (deceased) FreeBSD [sge62](https://www.freshports.org/sysutils/sge62/) port, and a few of my own (to make it work with more than 4GB memory) were then applied.

Before you install this, consider [Son of Grid Engine](https://arc.liv.ac.uk/trac/SGE) (or maybe [here](https://arc.liv.ac.uk/SGE/)) which might actually be supported.

## Conversion:

Grab the repository.  It was at r156, dated 2014-01-01, when I did this on 2016-09-22.

```
rsync -av svn.code.sf.net::p/gridscheduler/code code
```

Create an authors file.

```
rayrayson     = Rayson Ho   <raysonlogin@mail-g.com>
ron_chen_123  = Ron Chen    <ron_chen@mail-hot.com>
```

Convert to git.


```
mkdir opengridscheduler.git
cd    opengridscheduler.git

git svn init file:///trashcan/gridscheduler/code --stdlayout --no-metadata
git config svn.authorsfile /trashcan/gridscheduler/opengridscheduler.git.users

git svn fetch

#  Check branches.  Yup, branches exist.

git branch -a

#  Cleanup tags.

git tag SGE6.2u5    origin/SGE6.2u5
git tag SGE6.2u5p1  origin/SGE6.2u5p1
git tag GE2011.11   origin/tags/GE2011.11
git tag GE2011.11p1 origin/tags/GE2011.11p1
git tag SGE6.2u5p1  origin/tags/SGE6.2u5p1
git tag SGE6.2u5p2  origin/tags/SGE6.2u5p2
git tag SGE6.2u5p3  origin/tags/SGE6.2u5p3

git branch -d -r  origin/SGE6.2u5
git branch -d -r  origin/SGE6.2u5p1
git branch -d -r  origin/tags/GE2011.11
git branch -d -r  origin/tags/GE2011.11p1
git branch -d -r  origin/tags/SGE6.2u5p1
git branch -d -r  origin/tags/SGE6.2u5p2
git branch -d -r  origin/tags/SGE6.2u5p3
git branch -d -r  origin/trunk

#  Remove the SVN stuff.  No clue what it does; copied from some other recipe.

git config --remove-section svn-remote.svn
rm -rf .git/svn .git/logs/refs/remotes/origin/ .git/refs/remotes/origin/

#  Convert the remaining branches to local branches.  Even less of a clue what it does.

git config remote.origin.url .
git config --add remote.origin.fetch +refs/remotes/\*:refs/heads/\*
git fetch

#  Covert repo into a bare repo.

cd ..
git clone --bare opengridscheduler.git opengridschedulerbare.git

#  Upload that to wherever.

cd opengridschedulerbare.git
git push --mirror git@github.com:brianwalenz/opengridscheduler.git
```

## Compilation:

Easy, but not as easy as 'gmake'.

```
cd source

setenv AIMK_ARGS "-spool-classic -no-java -no-jni -no-gui-inst -no-secure -no-qmake -no-qtcsh"

./aimk $AIMK_ARGS -only-depend
./scripts/zerodepend
./aimk $AIMK_ARGS depend
./aimk $AIMK_ARGS 
./aimk $AIMK_ARGS -man

setenv SGE_ROOT  /usr/local/sge

./scripts/distinst -y -noexit -local -libs fbsd-amd64 -- \
   man common sge_qmaster sge_execd sge_shadowd sge_shepherd sge_coshepherd \
   qstat qsub qalter qconf qdel qacct qmod qsh utilbin jobs qhost qmake qmon \
   qping qloadsensor.exe sgepasswd qquota
```

## Installation:

The 'official' installation wants you to run '/usr/local/sge/install_qmaster' and '/usr/local/sge/install_execd'.  I haven't done that recently, instead, just the following steps:


```
pw groupadd sgeadmin -g 103
pw useradd sgeadmin -u 103 -g 103 -h - -d /nonexistent -s /sbin/nologin -c "Sun Grid Engine Admin"

cp -p /usr/local/sge/rc.d_sge /usr/local/etc/rc.d/sge

#  Load SGE on boot.  Add:
#    sge_qmaster_enable="YES"
#    sge_execd_enable="YES"
vi /etc/rc.conf

#  Add '. /usr/local/sge/default/common/settings.sh' so grid jobs have SGE configured too
vi /etc/profile

#  Add 'source /usr/local/sge/default/common/settings.csh'
vi ~/.cshrc

```

## Configuration:

You're on your own here.  I'm using this old version because I've been using it for years, and it's already configured for me.

However, adding a new host isn't that hard:

```
qconf -Ae new-server           #  With template from 'qconf -se', -ae might have worked too.
qconf -ah aye.home,bee.home    #  Add admin host.
qconf -as aye.home,bee.home    #  Add submit host.
qconf -aq big.q                #  Pops up vi to edit queue description.  Copied from servers.q.

```
