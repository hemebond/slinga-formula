{%- from "slinga/map.jinja" import slinga %}


slinga_virtualenv:
  virtualenv.managed:
    - name: {{ slinga.paths.root }}
    - system_site_packages: True
    - python: python3
    - require:
      - pkg: virtualenv
      - pkg: git
    - pip_pkgs:
      - git+https://github.com/fmnisme/python-icinga2api.git
      - flask
      - requests


{{ slinga.paths.root }}/uwsgi.ini:
  file.managed:
    - source: salt://slinga/files/uwsgi.ini.j2
    - template: jinja
    - context:
        slinga: {{ slinga }}
    - require:
      - virtualenv: slinga_virtualenv


slinga_package:
  pip.installed:
    - name: git+https://github.com/hemebond/slinga.git
    - bin_env: {{ slinga.paths.root }}


{{ slinga.paths.root }}/slinga.cfg:
  file.managed:
    - source: salt://slinga/files/slinga.cfg.j2
    - template: jinja
    - require:
      - virtualenv: slinga_virtualenv
