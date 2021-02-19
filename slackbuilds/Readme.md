# SlackBuilds - Migration to Git

Description of CVS to Git migration of my Slackware build scripts collection.

## Abstract

The project is a collection of shell scripts for building various programs and
libraries for Slackware Linux 10.2 and above. Each build script named as
`software.SlackBuild` is accompanied by one or more of the following files
all of which are considered sources:

* `README` - Readme for the packages without README file (text file);
* `doinst.sh` - Post installation script (bash script);
* `slack-conflicts` - List of conflicting packages (text file);
* `slack-desc` - Package description (text file);
* `slack-required` - List of required packages (text file);
* `slack-suggests` - List of optional packages (text file);
* `*.diff`, `*.patch` - Patches (text files);
* `rc.*` - Runtime configuration files (bash scripts);
* `*.desktop` - Menu configuration files (text files);
* `profile.d/` - Bash profile configuration files (bash scripts).

And put into a folder with the name of the software.

## Migration

Since the different directories with Slackware build scripts have quite
different history following software's release history it would be most
appropriate to migrate each folder as a separate Git repository. However,
this means also to create a "superproject" repository with the common files
(e.g. `slack-package.conf`) into another repository that through
[submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
incorporates all other repositories. The proposed structure is the
following:

```
slackbuilds
├── COPYING
├── README.md
├── a
    ├── soft1
    └── soft2
├── ap
    └── soft3
├── audio
├── d
├── games
├── l
├── n
├── py
├── slack-package.conf
├── video
├── xap
└── y
    └── softN
```

# Migration order

The migration should start with the oldest packages with sources (see files
in [Abstract](#Abstract) above), but whenever new changes need to be made to
a Slackware build script sources then the repository first should be migrated
to Git and moved to GitHub, so then the work should continue in the new
repository. The suggested order that may not be followed strictly is:

| Package | Version | Timestamp | Slackware | SlackBuild | Description |
| --- | --- | --- | --- | --- | --- |
| net-snmp | 5.2 | current | 2005-01-22 20:27:00 | no | yes |
| gd | 2.0.33 | current | 2005-01-23 14:48:00 | no | yes |
| hddtemp | 0.3b12 | 102 | 2005-03-03 01:35:00 | no | yes |
| ksensors | 0.7.3 | current | 2005-03-05 23:45:00 | no | yes |
| mysql | 4.1.10 | 102 | 2005-03-11 23:00:00 | no | yes |
| php | 4.3.10 | current | 2005-03-12 15:05:00 | no | yes |
| konverter | 0.92b1 | current | 2005-03-13 13:00:00 | no | yes |
| ffmpeg | 0.4.9pre1 | current | 2005-03-14 20:55:00 | no | yes |
| divx4linux | 20030428 | current | 2005-03-15 22:00:00 | no | yes |
| xvidcore | 1.1.0b1 | current | 2005-03-15 22:13:00 | no | yes |
| faad2 | 2.0 | current | 2005-03-15 22:50:00 | no | yes |
| faac | 1.24 | current | 2005-03-15 23:00:00 | no | yes |
| avifile | 0.7.42 | current | 2005-03-16 20:00:00 | no | yes |
| a52dec | 0.7.4 | current | 2005-03-16 20:40:00 | no | yes |
| transcode | 0.6.14 | current | 2005-03-16 21:06:00 | no | yes |
| mailsend | 1.05 | 102 | 2005-03-28 21:42:00 | no | yes |
| neon | 0.24.7 | current | 2005-04-16 21:19:00 | no | yes |
| ddd | 3.3.11 | current | 2005-05-14 13:17:00 | no | yes |
| redland | 0.9.16 | current | 2005-08-24 22:10:00 | no | yes |
| myodbc | 3.51.11 | current | 2005-10-02 17:28:00 | no | yes |
| meld | 1.1.1 | current | 2005-11-03 21:09:00 | no | yes |
| motion | 3.2.4 | 102 | 2006-01-22 21:35:00 | no | yes |
| xawtv | 3.95 | 102 | 2006-01-25 15:51:00 | no | yes |
| cvsgraph | 1.6.0 | 102 | 2006-01-27 22:23:00 | no | yes |
| mysql-administrator | 1.1.6 | 102 | 2006-02-04 12:45:00 | no | yes |
| bgoffice | 1.8 | 102 | 2006-02-07 20:45:00 | no | yes |
| mysqlcc | 0.9.4 | 102 | 2006-02-12 21:35:00 | no | yes |
| siefs | 0.5 | 102 | 2006-02-15 16:45:00 | no | yes |
| chmlib | 0.37.4 | 102 | 2006-03-04 11:11:00 | yes | yes |
| xmlrpc++ | 0.7 | 102 | 2006-03-09 12:21:00 | no | yes |
| xchm | 1.4 | 102 | 2006-03-10 22:15:00 | yes | yes |
| mysql-query-browser | 1.1.18 | 102 | 2006-03-19 20:00:00 | no | yes |
| kernel-headers | 2.6.15 | 102 | 2006-03-20 00:00:00 | no | yes |
| k3b-i18n | 0.12.13 | 102 | 2006-03-20 21:16:00 | no | yes |
| openoffice.org-bg | 2.0.2 | 102 | 2006-03-20 21:16:00 | yes | yes |
| mysql-connector-odbc | 5.0.0a | 102 | 2006-03-20 21:16:00 | no | yes |
| foo2zjs | 20060324 | 102 | 2006-03-25 19:27:00 | no | yes |
| base64 | 1.4 | 102 | 2006-03-25 19:42:00 | no | yes |
| firefox | 1.5.0.3bg | 102 | 2006-05-28 00:37:00 | yes | yes |
| thunderbird | 1.5.0.2bg | 102 | 2006-05-28 00:51:00 | yes | yes |
| qemu | 0.8.1 | 102 | 2006-07-21 00:55:00 | yes | yes |
| libgksu1.2 | 1.3.8 | 102 | 2006-07-31 21:02:00 | no | yes |
| libgtksuui1.0 | 1.0.7 | 102 | 2006-07-31 21:43:00 | no | yes |
| nut | 2.0.4 | 102 | 2006-08-01 23:12:00 | yes | yes |
| mgeups-psp | 3.0.1 | 102 | 2006-08-03 17:42:00 | yes | yes |
| mysql-gui-tools | 5.0r2 | 102 | 2006-09-06 22:20:22 | yes | yes |
| mrtg | 2.14.7 | 102 | 2006-09-10 19:28:15 | yes | yes |
| lua | 5.0.3 | 102 | 2006-09-13 21:46:00 | yes | yes |
| ocrad | 0.15 | 102 | 2006-09-28 00:15:00 | yes | yes |
| gocr | 0.41 | 102 | 2006-09-28 00:43:00 | yes | yes |
| valgrind | 3.2.1 | 110 | 2006-10-22 13:10:56 | yes | yes |
| ... | ... | ... | ... | ... | ... |

And so on and so on.

# Problems

1. Repositories are not self contained. The build scripts depend on the common
   file `slack-package.conf` inherited from linuxpackages.net, without which
   the build script cannot run.

2. TODO

3. Some directories already contain `README` file (see list below). If these are
   going into dedicated repositories with `README` file there would be name
   collision.

```
$ find . -type f -name 'README'
./d/cffi/README
./xap/skype/README
./xap/libreoffice-helppack/README
./xap/openoffice-langpack/README
./ap/tesseract-lang/README
./l/blas/README
./l/libmatroska/README
./l/libass/README
./l/x265/README
./l/numpy/README
./l/libva/README
./l/leptonica/README
./l/libebml/README
```

**Solution**: A possible solution is to create the repository `README` file as
`README.md`, so to avoid collision. Markdown exists since 2004. Or simply
rename the original `README` for the software in the package to `README.in`.

4. And some other also contain `COPYING` file.

```
$ find . -type f -name 'COPYING'
./audio/jack/COPYING
./xap/libreoffice-langpack/COPYING
./xap/libreoffice/COPYING
./xap/libreoffice-helppack/COPYING
./xap/openoffice-langpack/COPYING
./ap/tesseract-lang/COPYING
./ap/bwbar/COPYING
./l/blas/COPYING
./l/tinyxml2/COPYING
./l/qhull/COPYING
./l/arpack/COPYING
./l/tinyxml/COPYING
```

**Solution**: [Licensee](https://github.com/licensee/licensee) apparently
[considers](https://github.com/licensee/licensee/blob/master/docs/what-we-look-at.md)
any text file named `LICENSE*` or `COPYING*`, so renaming the old `COPYING`
file won't stop it from looking into the file. Therefore, the license file
for the packaged software should be named neutrally as `PKGLIC`' (i.e.
shortened from PACKAGE LICENSE) or otherwise (e.g. BSDLIC, GPLLIC, etc.).

5. There are some packages without build script. These only have description
   file and eventually requirements file. This is the list:

| Package | Version | Timestamp | Slackware | SlackBuild | Description | Requirements |
| --- | --- | --- | --- | --- | --- | --- |
| gd | 2.0.33 | 2005-01-23 14:48:00 | 99999 | no | yes | yes |
| ksensors | 0.7.3 | 2005-03-05 23:45:00 | 99999 | no | yes | no |
| konverter | 0.92b1 | 2005-03-13 13:00:00 | 99999 | no | yes | no |
| neon | 0.24.7 | 2005-04-16 21:19:00 | 99999 | no | yes | yes |
| redland | 0.9.16 | 2005-08-24 22:10:00 | 99999 | no | yes | no |
| myodbc | 3.51.11 | 2005-10-02 17:28:00 | 99999 | no | yes | no |
| myodbc | 3.51.12 | 2005-10-29 00:44:00 | 99999 | no | yes | no |
| xawtv | 3.95 | 2006-01-25 15:51:00 | 102 | no | yes | no |
| xawtv | 3.95 | 2006-01-29 11:24:00 | 102 | no | yes | no |
| mysql-administrator | 1.1.6 | 2006-02-04 12:45:00 | 102 | no | yes | no |
| bgoffice | 1.8 | 2006-02-07 20:45:00 | 102 | no | yes | no |
| mysqlcc | 0.9.4 | 2006-02-12 21:35:00 | 102 | no | yes | no |
| mysqlcc | 0.9.4 | 2006-02-13 13:39:42 | 102 | no | yes | no |
| siefs | 0.5 | 2006-02-15 16:45:00 | 102 | no | yes | no |
| siefs | 0.5 | 2006-02-20 19:48:00 | 102 | no | yes | yes |
| mysql-query-browser | 1.1.18 | 2006-03-19 20:00:00 | 102 | no | yes | no |
| kernel-headers | 2.6.15 | 2006-03-20 00:00:00 | 102 | no | yes | no |
| mysql-query-browser | 1.1.12 | 2006-03-20 21:16:00 | 102 | no | yes | no |
| mysql-query-browser | 1.1.18 | 2006-03-20 21:16:00 | 102 | no | yes | no |
| kernel-headers | 2.6.16.1 | 2006-04-02 18:30:00 | 102 | no | yes | no |
| kernel-headers | 2.6.17.1 | 2006-06-29 08:21:00 | 102 | no | yes | no |
| kernel-headers | 2.6.20 | 2007-02-11 19:30:09 | 110 | no | yes | no |
| kernel-headers | 2.6.20.3 | 2007-03-22 12:53:55 | 110 | no | yes | no |
| kernel-headers | 2.6.21 | 2007-05-08 23:10:20 | 110 | no | yes | no |
| kernel-headers | 2.6.28.7 | 2009-02-27 00:24:23 | 122 | no | yes | no |
| kernel-headers | 2.6.30.1 | 2009-07-16 21:34:51 | 122 | no | yes | no |

It does not seem it worth it to version these and migrate to Git.

