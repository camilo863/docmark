#!/usr/bin/env python3

# -
# merges the default docmark.yml with mkdocs-defaults.yml
# -

import pprint
import hiyapyco

conf = hiyapyco.load('/opt/docmark/mkdocs-defaults.yml', 'mkdocs.yml',  method=hiyapyco.METHOD_MERGE, interpolate=True, failonmissingfiles=True)
# conf = hiyapyco.load('deploy/mkdocs-defaults.yml', 'mkdocs.yml',  method=hiyapyco.METHOD_MERGE, interpolate=True, failonmissingfiles=True)
with open("build/mkdocs.yml", "w") as yml_file:
    print(hiyapyco.dump(conf, default_flow_style=False), file=yml_file)
# pprint.PrettyPrinter(indent=4).pprint(conf)
# print(hiyapyco.dump(conf, default_flow_style=False))
# hiyapyco.dump(conf, default_flow_style=True)
