from setuptools import setup, find_packages


def find_description():
    with open('README.md') as fh:
        return fh.read()


setup(
    name='votifier',
    version='0.0.1',
    author='Netherwhal',
    author_email='netherwhal@simplyvanilla.net',
    description='Votifier v1 Client.',
    long_description=find_description(),
    long_description_content_type='text/markdown',
    url='https://github.com/SimplyVanilla/votifier.py',
    packages=find_packages(exclude=['tests*']),
    classifiers=[
        'Programming Language :: Python :: 3',
        'License :: OSI Approved :: GNU General Public License v3 or later (GPLv3+)',
        'Operating System :: OS Independent',
    ],
    python_requires='>=3',
    install_requires=[
        'rsa',
    ],
)
