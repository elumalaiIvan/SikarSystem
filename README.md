This CLI utility can be used to create and maintain projects in your Local and remote(Github).
I usually maintain the project in the ``~/Workspace/Sikar``, hence all my projects will be created based on category

You can opt in your custom workspace to do that you should update `SIKAR_DIR="$HOME/Workspace/Sikar"` in SikarSystem/constants. 

### create
Creates the repo in local based on type.
my case `java` folder will be created under `~/Workspace/Sikar`, and then project folder created base on given name.

```sikar create --name=sikar-project --type=java --description="Sikar TCP server" --git --open```

- `name, type, description` --> required fields
- `--type` --> used to arrange your project under category folder in local. in this case `java` folder will be created under which sikar-project will be created 
- `--git` --> optional param, which will create a git repo in your github.
follow the steps bellow to make it work

  1) Create `gitCredentials` file in the root
add bellow contents

GITHUB_TOKEN=<personal_access_token>
GITHUB_USERNAME=<your_git_user_name>

- `--open` --> optional param, which will open a project after it is created in corresponding IDE, you have in system.

### delete
Deletes the repo from local and remote
```sikar deleteRepo -lr <projectName>```

- `projectName` --> required fields
- `l` --> deletes from local
- `r` --> deletes from remote(github)

### list
Listing projects in all categories from: /Users/elumalairamalingam/Workspace/Sikar

`sikar list`
```
output
Boot :
- SikarDI
- SikarObjectMapper
- sikar-boot
------------
Java :
- sikar-tcp
```
currently I have this two categories, it can be anything

if you want the list from specific category
`sikar list Boot`
```
output

Boot :
- SikarDI
- SikarObjectMapper
- sikar-boot
```

### help
Lists the comments that can be used with sikar CLI.
`sikar help`

```
output:

use sikar CLI like this
sikar <operation>
possible operations are:
create
deleteRepo
help
list
open
```

###### Note:
This utility can be used anywhere in the system, put the sikar.sh executable in recognized PATH like /usr/local/bin
(or) Add in your folder, make sure that folder is added into the Path.