# SlackBuilds - Migration to CVS

Description of CVS to Git migration of my Slackware build scripts collection.

## Abstract

The project is a collection of shell scripts for building various programs and
libraries for Slackware Linux 10.2 and above. Each build script named as
`software.SlackBuild` is acompanied by one or more of the following files:

* README - Readme for the packages without README file (text file);
* doinst.sh - Post installation script (bash script);
* slack-conflicts - List of conflicting packages (text file);
* slack-desc - Package description (text file);
* slack-required - List of required packages (text file);
* slack-suggests - List of optional packages (text file);
* *.diff - Patches (text files);
* rc.* - Runtime configuration files (bash scripts);
* *.desktop - Menu configuration files (text files);
* profile.d/ - Bash profile configuration files (bash scripts).

And put into a folder with the name of the software.

## Migration

Since the different directories with Slackware build scripts have quite
different history following software's realese history it would be most
appropraite to migrate each folder as a separate Git repository. However,
this means also to create a meta repository with the common files (e.g.
`slack-package.conf`) into another repository that through
[submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
incorporates all other repositories. The proposed structure is the
following:

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

# Problems

1. Repositories are not self contained. The build scripts depend on the common
   file `slack-package.conf` inherited from linuxpackages.net, witout which
   the build script cannot run.

2. 

3. Some directories already contain README file (see list below). If these are
   going into dedicated repositories with README file there would be name
   collision.

```$ find . -type f -name 'README'
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

**Solution**: A possible solution is to create the repository README file as
README.md, so to avoid collision. Markdown exists since 2004.

4. And some other also contain COPYING file.

```$ find . -type f -name 'COPYING'
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

**Solution**: A possible solution is to create the repository COPYING file as
LICENSE, but it should be checked how [Licensee](https://github.com/licensee/licensee)
would interpret both files.

