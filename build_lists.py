#!/usr/bin/env python

from __future__ import with_statement

from collections import namedtuple

Module = namedtuple('Module', ('name', 'archive', 'url'))
SvnModule = namedtuple('SVNModule', ('name', 'repo'))
GitModule = namedtuple('GitModule', ('name', 'repo'))
HgModule = namedtuple('HgModule', ('name', 'repo'))

modules = (
    Module(
        'xz-5.0.5',
        'xz-5.0.5.tar.xz',
        'http://tukaani.org/xz/xz-5.0.5.tar.xz'
    ),
    # Module(
    #     'gettext-0.18.3.2',
    #     'gettext-0.18.3.2.tar.gz',
    #     'http://ftp.gnu.org/pub/gnu/gettext/gettext-0.18.3.2.tar.gz'
    # ),
    # Module(
    #     'libffi-3.0.13',
    #     'libffi-3.0.13.tar.gz',
    #     'ftp://sourceware.org/pub/libffi/libffi-3.0.13.tar.gz'
    # ),
    Module(
        'polarssl-1.3.7',
        'polarssl-1.3.7-gpl.tgz',
        'https://polarssl.org/download/polarssl-1.3.7-gpl.tgz'
    ),
    Module(
        'c-ares-1.10.0',
        'c-ares-1.10.0.tar.gz',
        'http://c-ares.haxx.se/download/c-ares-1.10.0.tar.gz'
    ),
    HgModule('jsmn', 'https://bitbucket.org/zserge/jsmn'),
    Module(
        'libxdiff-0.23',
        'libxdiff-0.23.tar.gz',
        'http://www.xmailserver.org/libxdiff-0.23.tar.gz'
    ),
    Module(
        'enet-1.3.12',
        'enet-1.3.12.tar.gz',
        'http://enet.bespin.org/download/enet-1.3.12.tar.gz'
    ),
    Module(
        'dumb-0.9.3',
        'dumb-0.9.3.tar.gz',
        'http://downloads.sourceforge.net/project/dumb/dumb/0.9.3/dumb-0.9.3.tar.gz'
    ),
    # Module(
    #     'libmad-0.15.1b',
    #     'libmad-0.15.1b.tar.gz',
    #     'ftp://ftp.mars.org/pub/mpeg/libmad-0.15.1b.tar.gz'
    # ),
    Module(
        'fluidsynth-1.1.6',
        'fluidsynth-1.1.6.tar.bz2',
        'http://downloads.sourceforge.net/project/fluidsynth/fluidsynth-1.1.6/fluidsynth-1.1.6.tar.bz2'
    ),
    Module(
        'portmidi',
        'portmidi-src-217.zip',
        'http://downloads.sourceforge.net/project/portmedia/portmidi/217/portmidi-src-217.zip'
    ),
)

modules_fobj = open('modules.list', 'wb')
urls_fobj = open('urls.list', 'wb')
archives_fobj = open('archives.list', 'wb')
hg_repos_fobj = open('hg_repos.list', 'wb')

for module in modules:
    if isinstance(module, Module):
        modules_fobj.write(module.name)
        modules_fobj.write('\n')
        urls_fobj.write(module.url)
        urls_fobj.write('\n')
        archives_fobj.write(module.archive)
        archives_fobj.write('\n')
    elif isinstance(module, HgModule):
        modules_fobj.write(module.name)
        modules_fobj.write('\n')
        hg_repos_fobj.write(module.repo)
        hg_repos_fobj.write('\n')

modules_fobj.close()
urls_fobj.close()
archives_fobj.close()
hg_repos_fobj.close()

