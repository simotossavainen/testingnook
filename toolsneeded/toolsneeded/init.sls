toolsneeded:
  pkg.installed:
    - pkgs:
      - firefox
      - tree
      - libreoffice

# Here I install some applications you might need in your day to day life

# Firefox homepage changed to google and tabs won't disappear after closing the browser
/home/simo/.mozilla/firefox/q4c9qcsh.default-release/prefs.js:
  file.managed:
    - source: salt://toolsneeded/prefs.js
