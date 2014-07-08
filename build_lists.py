#!/usr/bin/env python

from __future__ import with_statement

import json
import os.path

from collections import namedtuple

Module = namedtuple('Module', ('name', 'archive', 'url'))
SvnModule = namedtuple('SVNModule', ('name', 'repo'))
GitModule = namedtuple('GitModule', ('name', 'repo'))
HgModule = namedtuple('HgModule', ('name', 'repo'))

repositories = (
    ('https://bitbucket.org', HgModule),
    ('https://github.com', GitModule),
    ('https://code.google.com', SvnModule)
)

archive_extensions = (
    '.tar.gz',
    '.tar.lzma',
    '.tar.xz',
    '.zip',
    '.tgz',
    '.tar.bz2'
)

modules = []

def get_module(url, mod_dict):
    basename = mod_dict.get('archive', os.path.basename(url))

    for repository, repo_class in repositories:
        if url.startswith(repository):
            return repo_class(basename, url)

    for extension in archive_extensions:
        if 'module' in mod_dict:
            return Module(mod_dict['module'], basename, url)
        elif basename.endswith(extension):
            return Module(basename[:-len(extension)], basename, url)

def main():
    with open('urls.json', 'rb') as json_fobj:
        mod_json_data = json_fobj.read().decode('utf8')
        
    mod_json = json.loads(mod_json_data)

    for mod_dict in mod_json:
        url = mod_dict['url']
        module = get_module(url, mod_dict)
        if module is None:
            raise Exception('Could not extract module from %r' % (url))
        modules.append(module)

    modules_fobj = open('modules.list', 'wb')
    archives_fobj = open('archives.list', 'wb')
    hg_repos_fobj = open('hg_repos.list', 'wb')
    git_repos_fobj = open('git_repos.list', 'wb')

    for module in modules:
        modules_fobj.write(module.name.encode('utf8'))
        modules_fobj.write('\n'.encode('utf8'))
        if isinstance(module, Module):
            archives_fobj.write(module.archive.encode('utf8'))
            archives_fobj.write('\n'.encode('utf8'))
        elif isinstance(module, HgModule):
            hg_repos_fobj.write(module.repo.encode('utf8'))
            hg_repos_fobj.write('\n'.encode('utf8'))
        elif isinstance(module, GitModule):
            git_repos_fobj.write(module.repo.encode('utf8'))
            git_repos_fobj.write('\n'.encode('utf8'))

    modules_fobj.close()
    archives_fobj.close()
    hg_repos_fobj.close()
    git_repos_fobj.close()

main()

