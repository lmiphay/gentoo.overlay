from setuptools import setup

setup(name = 'syslogsummary',
      version = '1.14',
      py_modules = ['syslogsummary'],
      entry_points = {
        'console_scripts': [ 'syslog-summary = syslogsummary:main' ]
      }
)
