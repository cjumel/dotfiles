# [PI]p: Python package installer

alias pif='pip freeze'                     # [PI]p [F]reeze: output installed packages in requirements format
alias pifr='pip freeze > requirements.txt' # [PI]p [F]reeze [R]equirements.txt: output installed packages in a requirements.txt file

alias pii='pip install'                       # [PI]p [I]nstall: install a package
alias piie='pip install -e'                   # [PI]p [I]nstall [E]ditable: install a local package in editable mode
alias piir='pip install -r'                   # [PI]p [I]nstall [R]equirements: install packages from a requirements file
alias piirr='pip install -r requirements.txt' # [PI]p [I]nstall [R]equirements [R]equirements.txt: install packages from the requirements.txt file
alias piiu='pip install --upgrade'            # [PI]p [I]nstall [U]pgrade: upgrade a package

alias pil='pip list' # [PI]p [L]ist: list installed packages

alias pis='pip show' # [PI]p [S]how: show installed package information

alias piu='pip uninstall' # [PI]p [U]n[I]nstall: uninstall a package
