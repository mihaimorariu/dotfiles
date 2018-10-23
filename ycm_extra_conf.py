import os
from glob import glob

base = os.path.dirname(os.path.abspath(__file__))

# Get package name from the 'include' directory. Convention is:
# [path_to_pkg]/[pkg_name]/include.
def getPackageNameFromIncludeDir(directory):
	return os.path.basename(os.path.dirname(directory))

# Search for 'include' directories, recursively, starting from 'base_directory'.
# Ignore the ones whose names begin with one of the given prefixes.
def findIncludeDirsRecursively(base_directory):
	prefixes     = ('__', '.')
	include_dirs = []

	for root, names, _ in os.walk(base_directory):
		names[:]      = [n for n in names if not n.startswith(prefixes)]
		include_dirs += [os.path.join(root, n) for n in names if n == 'include']

	return include_dirs

# Define flags for the current file.
def FlagsForFile(filename, **kwargs):
	filedir = os.path.dirname(filename)
	flags = [
		'-x', 'c++',
		'-Wall',
		'-Wextra',
		'-Wpedantic',
		'-fPIC',
		'-std=c++11',
		'-isystem', '/usr/include/boost',
		'-isystem', '/usr/include/eigen3',
		'-isystem', '/usr/include/opencv',
		'-isystem', '/usr/include/pcl-1.8',
		'-isystem', '/usr/include/vtk',
		'-isystem', '/opt/ros/lunar/include',
		'-I', '.',
	]

	# Include all [pkg_name]/include directories.
	include_dirs = findIncludeDirsRecursively(base)
	for path in include_dirs: flags += ['-I', path]

	# For the current file include the [pkg_name]/include/[pkg_name] directory.
	for path in include_dirs:
		if filename.startswith(os.path.dirname(path)):
			pkg_name  = getPackageNameFromIncludeDir(path)
			flags    += ['-I', os.path.join(path, pkg_name)]
			break

	return {
		'flags': flags,
		'do_cache': True
	}
