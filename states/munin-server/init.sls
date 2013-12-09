apache2-mpm-prefork:
  pkg:
    - installed

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
