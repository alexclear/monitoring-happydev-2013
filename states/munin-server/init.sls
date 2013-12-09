apache2-mpm-prefork:
  pkg:
    - installed

apache2:
  service:
    - running
    - watch:
      - file: /etc/munin/apache.conf
    - enable: True
    - require:
      - pkg: apache2-mpm-prefork

munin:
  pkg:
    - installed

/etc/munin/munin.conf:
  file.managed:
    - source: salt://munin-server/munin.conf
    - template: jinja

/etc/munin/apache.conf:
  file.managed:
    - source: salt://munin-server/apache.conf
    - template: jinja

/etc/apache2/conf.d/munin:
  file.symlink:
    - target: /etc/munin/apache.conf
