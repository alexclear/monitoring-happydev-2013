munin-node:
  pkg:
    - installed
  service:
    - running
    - watch:
      - file: /etc/munin/munin-node.conf
    - enable: True
    - require:
      - pkg: munin-node

/etc/munin/munin-node.conf:
  file.managed:
    - source: salt://munin-client/munin-node.conf
    - template: jinja

/root/addminefunctions.sh:
  file.managed:
    - source: salt://munin-client/addminefunctions.sh
    - template: jinja
    - mode: 755
  cmd.run:
    - unless: cat /etc/salt/minion | grep 'mine_functions'
