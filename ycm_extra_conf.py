import os
from glob import glob

current_dir = os.path.dirname(os.path.abspath(__file__))

# Get package name from the 'include' directory. Convention is:
# [path_to_pkg]/[pkg_name]/include.
def get_package_name(base_dir):
    return os.path.basename(os.path.dirname(base_dir))

# Search for 'include' directories, recursively, starting from 'base_dir'.
# Ignore the ones whose names begin with one of the given prefixes.
def find_include_dirs(base_dir):
    prefixes = ('__', '.')
    dirs = []
    for root, names, _ in os.walk(base_dir):
        names[:] = [n for n in names if not n.startswith(prefixes)]
        dirs += [os.path.join(root, n) for n in names if n == 'include']
    return dirs

# Define flags for the current file.
def FlagsForFile(filename, **kwargs):
    # Default flags.
    flags = [
        '-x',
        'c++',
        '-Wall',
        '-Wextra',
        '-Wpedantic',
        '-fPIC',
        '-std=c++17',
        '-I', '.',
    ]

    # CUDA-related flags.
    if filename.endswith('.cu'):
        flags = ['-x', 'cuda']

    # Define the system include directories.
    include_dirs = [
        '/usr/include/boost',
        '/usr/include/eigen3',
        '/usr/include/opencv',
        '/usr/include/opencv4',
        '/usr/include/pcl-1.7',
        '/usr/include/pcl-1.8',
        '/usr/include/pcl-1.9',
        '/usr/include/vtk',
        '/usr/include/vtk-6.3',
        '/opt/cuda/include',
        '/opt/ros/melodic/include',
        '/opt/ros/melodic/include/xmlrpcpp/',
    ]

    # Check if the directories exist and include them.
    for path in include_dirs:
        if os.path.exists(path):
            flags += ['-isystem', path]

    # Include all [pkg_name]/include directories.
    include_dirs = find_include_dirs(current_dir)
    for path in include_dirs: flags += ['-I', path]

    # For the current file include the [pkg_name]/include/[pkg_name] directory.
    for path in include_dirs:
        if filename.startswith(os.path.dirname(path)):
            pkg_name = get_package_name(path)
            flags += ['-I', os.path.join(path, pkg_name)]
            break

    return {
        'flags': flags,
        'do_cache': True
    }
