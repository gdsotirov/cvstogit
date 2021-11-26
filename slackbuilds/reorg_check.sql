SELECT CONCAT(serie, '/',
         CASE `name`
          WHEN 'leptonlib'                THEN 'leptonica'
          WHEN 'libgksu1.2'               THEN 'libgksu'
          WHEN 'libgksuui1.0'             THEN 'libgksuui'
          WHEN 'libreoffice-helppack-bg'  THEN 'libreoffice-helppack'
          WHEN 'libreoffice-langpack-bg'  THEN 'libreoffice-langpack'
          WHEN 'openoffice-langpack-bg'   THEN 'openoffice-langpack'
          WHEN 'openoffice.org-bg'        THEN 'openoffice'
          WHEN 'tesseract-bul'            THEN 'tesseract-lang'
          WHEN 'tesseract-eng'            THEN 'tesseract-lang'
          WHEN 'tesseract-equ'            THEN 'tesseract-lang'
          WHEN 'tesseract-osd'            THEN 'tesseract-lang'
          ELSE `name`
         END) AS dir_name
  FROM packages
 WHERE `name` IN ('a52dec',
                  'amrnb',
                  'amrwb',
                  'armagetronad',
                  'arpack',
                  'asn1crypto',
                  'aspell-bg',
                  'avahi',
                  'avifile',
                  'barcode',
                  'base64',
                  'bcrypt',
                  'blas',
                  'boost',
                  'bzr',
                  'cairomm',
                  'cbgoffice',
                  'ccid',
                  'celt',
                  'cffi',
                  'chmlib',
                  'chromaprint',
                  'cinelerra',
                  'cppcheck',
                  'cppclean',
                  'cryptography',
                  'ctemplate',
                  'cvs2svn',
                  'cvsgraph',
                  'cwp',
                  'cython',
                  'dbus',
                  'dbus-glib',
                  'dbus-python',
                  'ddd',
                  'dirac',
                  'divx4linux',
                  'docutils',
                  'dosbox',
                  'elinks',
                  'enca',
                  'enum34',
                  'extra-cmake-modules',
                  'faac',
                  'faad2',
                  'ffmpeg',
                  'fftw',
                  'firefox',
                  'flite',
                  'fltk',
                  'fluidsynth',
                  'foo2zjs',
                  'foomatic-filters',
                  'freeglut',
                  'freeipmi',
                  'freeradius-server',
                  'freerdp',
                  'frei0r-plugins',
                  'fribidi',
                  'fswebcam',
                  'ftgl',
                  'gbgoffice',
                  'gdal',
                  'geos',
                  'gl2ps',
                  'glibmm',
                  'glitz',
                  'glpk',
                  'gmp',
                  'gnugo',
                  'gnuplot',
                  'go',
                  'gocr',
                  'graphicsmagick',
                  'graphviz',
                  'gsm',
                  'gtest',
                  'gtkmm',
                  'gtksourceview',
                  'hddtemp',
                  'hdf5',
                  'highlight',
                  'htop',
                  'icecast',
                  'icu4c',
                  'id3lib',
                  'idna',
                  'ilmbase',
                  'imlib2',
                  'intltool',
                  'ipaddress',
                  'ipcalc',
                  'ispell-bg',
                  'iucode_tool',
                  'jack',
                  'jdk',
                  'json-c',
                  'k3b',
                  'k3b-i18n',
                  'kbarcode',
                  'kbgoffice',
                  'kchmviewer',
                  'kdesvn',
                  'ksudoku',
                  'ktorrent',
                  'kvazaar',
                  'ladspa',
                  'lame',
                  'lapack',
                  'lash',
                  'leptonica',
                  'leptonlib',
                  'libass',
                  'libasyncns',
                  'libavc1394',
                  'libbluray',
                  'libbs2b',
                  'libcaca',
                  'libconfig',
                  'libdaemon',
                  'libdbus-c++',
                  'libdc1394',
                  'libdv',
                  'libdvbcsa',
                  'libdvbpsi',
                  'libdvdcss',
                  'libdvdnav',
                  'libdvdplay',
                  'libdvdread',
                  'libebml',
                  'libebur128',
                  'libelf',
                  'libfame',
                  'libffado',
                  'libfreebob',
                  'libgdiplus',
                  'libggi',
                  'libgii',
                  'libgksu',
                  'libgksu1.2',
                  'libgksuui1.0',
                  'libgme',
                  'libgnomecups',
                  'libgnomeprint',
                  'libgxps',
                  'libiec61883',
                  'libilbc',
                  'libiscsi',
                  'libkate',
                  'libmatroska',
                  'libmaxminddb',
                  'libmodman',
                  'libmodplug',
                  'libmpcdec',
                  'libmpeg2',
                  'libmpeg3',
                  'libmspack',
                  'libnfs',
                  'liboil',
                  'libopenmpt',
                  'libproxy',
                  'libquicktime',
                  'libquvi',
                  'libquvi-scripts',
                  'libraw1394',
                  'libreoffice',
                  'libreoffice-helppack-bg',
                  'libreoffice-langpack-bg',
                  'libsamplerate',
                  'libshout',
                  'libsigc++',
                  'libsndfile',
                  'libssh2',
                  'libtiger',
                  'libtool',
                  'libupnp',
                  'libusb',
                  'libusb-compat',
                  'libva',
                  'libvpx',
                  'libwebp',
                  'libxml++',
                  'linux-pam',
                  'ltrace',
                  'lua',
                  'lzip',
                  'lzo',
                  'mailsend',
                  'meld',
                  'mgeops-psp',
                  'minidlna',
                  'mjpegtools',
                  'mkvtoolnix',
                  'mono',
                  'motion',
                  'mrtg',
                  'mysql',
                  'mysql-connector-c++',
                  'mysql-connector-odbc',
                  'mysql-connector-python',
                  'mysql-gui-tools',
                  'mysql-router',
                  'mysql-shell',
                  'mysql-utilities',
                  'mysql-workbench',
                  'ncdu',
                  'net-snmp',
                  'netcdf',
                  'newt',
                  'normalize',
                  'numactl',
                  'numpy',
                  'nut',
                  'ocaml',
                  'ocrad',
                  'octave',
                  'open-vm-tools',
                  'openal',
                  'opencore-amr',
                  'opencv',
                  'openexr',
                  'openjpeg',
                  'openldap',
                  'openmpi',
                  'openoffice',
                  'openoffice-langpack-bg',
                  'openoffice.org-bg',
                  'opensc',
                  'openvpn',
                  'opera',
                  'opus',
                  'opus-tools',
                  'opusfile',
                  'orc',
                  'paramiko',
                  'partimage',
                  'pcsc-lite',
                  'pcsc-omnikey',
                  'pcsc-tools',
                  'pexpect',
                  'php',
                  'pingus',
                  'pkcs11-helper',
                  'portaudio',
                  'powerman',
                  'ppracer',
                  'proftpd',
                  'proj',
                  'protobuf',
                  'pulseaudio',
                  'pyasn1',
                  'pycairo',
                  'pycrypto',
                  'pygments',
                  'pygobject',
                  'pygtk',
                  'pynacl',
                  'python-ecdsa',
                  'qemu',
                  'qhull',
                  'qrupdate',
                  'rapidjson',
                  'recutils',
                  'rrdtool',
                  'rtmpdump',
                  'rubberband',
                  'sbc',
                  'schroedinger',
                  'scons',
                  'scrollkeeper',
                  'setuptools',
                  'sim',
                  'six',
                  'skype',
                  'sloccount',
                  'smart',
                  'smw',
                  'snappy',
                  'soxr',
                  'speex',
                  'speexdsp',
                  'sunbird',
                  'swaret',
                  'swig',
                  'swish-e',
                  'tesseract',
                  'tesseract-bul',
                  'tesseract-eng',
                  'tesseract-equ',
                  'tesseract-osd',
                  'texi2html',
                  'thunderbird',
                  'tinyxml',
                  'tinyxml2',
                  'transcode',
                  'twolame',
                  'unixodbc',
                  'v4l-utils',
                  'valgrind',
                  'valkyrie',
                  'vamp-plugin-sdk',
                  'vcdimager',
                  'vid.stab',
                  'vlc',
                  'vsqlite++',
                  'wdiff',
                  'webpconv',
                  'wxwidgets',
                  'x264',
                  'x265',
                  'xchm',
                  'xmlrpc++',
                  'xmlto',
                  'xmltoman',
                  'xorgxrdp',
                  'xosd',
                  'xrdp',
                  'xvidcore',
                  'yasm',
                  'zvbi')
 GROUP BY 1;
