# Docker Deployment Tests
"Learning is recursion, recursion is recursion and recursion.""
Each step is explained individually.

***
## Forgot how to add a submodule? No Problem! Here you go.
git submodule add https://github.com/sebest-blog/gunicorn-with-docker/ gunicorn-docker/gunicorn-module

## You have to remove submodules manually... Why? I don't know, it's just lame like that.
1. Either run the first or second option, depending on if you already have submodules that you want to keep.  
  - `git rm -f .gitmodules`
  - Remove the submodule inside the `.gitmodules` file.
2. Remove the submodule folder from .
  - `git rm -fr gunicorn-docker/gunicorn-module`
  - If you execute on the parent directory and not the submodule directory, delete the corresponding folder __inside__ `.git/modules/`
3. Delete the folder itself.
  - `rm -rf gunicorn-docker`
