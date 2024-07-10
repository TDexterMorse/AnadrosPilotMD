### AutoDock Installation Instructions For MacOS

Begin in the $BASE directory (the directory in which you have placed the program)

```

cd $BASE

```

Install rdkit

```

pip install rdkit-pypi


```

Install obabel

```

brew install open-babel

```
Determine location of open-babel (a good place to look is your homebrew local cellar) 

```

find / -type d -name "open-babel" 2>/dev/null

```

then add the path to your .bashrc file


