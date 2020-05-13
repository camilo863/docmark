#!/usr/bin/env python3

# -
# merges the default docmark.yml with mkdocs-defaults.yml
# -

import pprint
import hiyapyco
import yaml
import codecs

conf = hiyapyco.load('/opt/docmark/mkdocs-defaults.yml', 'mkdocs.yml',  
                method=hiyapyco.METHOD_MERGE, interpolate=True, failonmissingfiles=True)
# conf = hiyapyco.load('deploy/mkdocs-defaults.yml', 'mkdocs.yml',  method=hiyapyco.METHOD_MERGE, interpolate=True, failonmissingfiles=True)
with open("build/mkdocs.yml", "w") as yml_file:
    print(hiyapyco.dump(conf, default_flow_style=False), file=yml_file)
# pprint.PrettyPrinter(indent=4).pprint(conf)
# print(hiyapyco.dump(conf, default_flow_style=False))
# hiyapyco.dump(conf, default_flow_style=True)

cfg = codecs.open('build/mkdocs.yml', 'r', 'utf-8')
ycfg = yaml.load(cfg, Loader=yaml.FullLoader)

if not 'theme' in ycfg and not 'theme_dir' in ycfg:
  ycfg['theme'] = 'docmark'

with open(r'build/mkdocs.yml', 'w') as file:
    documents = yaml.dump(ycfg, file)
