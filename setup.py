from setuptools import setup

setup(
    name="xontrib-vox-completion",
    version="0.1",
    license="MIT",
    url="https://github.com/abingham/xontrib-vox-completion",
    description="Command completion for the vox command in xonsh",
    author="Austin Bingham",
    author_email="austin.bingham@gmail.com",
    packages=['xontrib'],
    package_dir={'xontrib': 'xontrib'},
    package_data={'xontrib': ['*.xsh']},
    zip_safe=False,
    classifiers=[
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.5",
        "Programming Language :: Python :: 3.6",
        "Programming Language :: Python :: 3.7",
        "Programming Language :: Python :: 3.8",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ]
)
