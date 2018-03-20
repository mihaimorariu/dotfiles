import os
from glob import glob

base = os.path.dirname(os.path.abspath(__file__))

def findIncludeDirsRecursively(base_directory):
	prefixes     = ('__', '.')
	include_dirs = []

	for root, names, _ in os.walk(base_directory):
		names[:]      = [n for n in names if not n.startswith(prefixes)]
		current_dirs  = [os.path.join(root, n) for n in names if n == 'include']

		pkg_name      = os.path.basename(root)
		current_dirs += [os.path.join(d, pkg_name) for d in current_dirs if os.path.exists(os.path.join(d, pkg_name))]

		include_dirs += current_dirs

	return include_dirs

def FlagsForFile(filename, **kwargs):
	filedir = os.path.dirname(filename)
	flags = [
		'-x', 'c++',
		'-Wall',
		'-Wextra',
		'-Wpedantic',
		'-fPIC',
		'-std=c++14',
		'-isystem', '/usr/include/boost',
		'-isystem', '/usr/include/eigen3',
		'-isystem', '/usr/include/pcl-1.8',
		'-isystem', '/usr/include/opencv2',
		'-isystem', '/opt/ensenso/development/c/include',
		'-isystem', '/opt/ros/lunar/include',
		'-I', '.',
	]

	for path in findIncludeDirsRecursively(base):
		flags += ['-I', path]

	return {
		'flags': flags,
		'do_cache': True
	}
