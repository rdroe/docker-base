kitty @ launch --keep-focus --type=tab --tab-title nyargs-build
kitty @ launch --keep-focus --type=tab --tab-title nyargs-edit
# kitty @ launch --keep-focus --type=tab --tab-title demo-build
# kitty @ launch --keep-focus --type=tab --tab-title demo-edit
# kitty @ launch --keep-focus --type=tab --tab-title demo-run
kitty @ launch --keep-focus --type=tab --tab-title browser-example-run
kitty @ launch --keep-focus --type=tab --tab-title browser-example-serve
kitty @ launch --keep-focus --type=tab --tab-title browser-example-edit

kitty @ send-text --exclude-active --match-tab title:nyargs-build cd $HOME/code/nyargs \&\& yarn dev-browser \\n

kitty @ send-text --exclude-active  --match-tab title:nyargs-edit cd $HOME/code/nyargs \&\& emacs src/lib/input/index.ts \\n

# kitty @ send-text  --exclude-active --match-tab title:demo-build cd $HOME/code/nyargs-demo \&\& yarn tsc \\n

# kitty @ send-text  --exclude-active --match-tab title:demo-edit cd $HOME/code/nyargs-demo \&\& emacs myapp.ts \\n

# kitty @ send-text  --exclude-active --match-tab title:demo-run  cd $HOME/code/nyargs-demo \&\& node ./dist/myapp.js

kitty @ send-text  --exclude-active --match-tab title:browser-example-run cd $HOME/code/nyargs-browser-demo \&\& yarn mon \\n

kitty @ send-text  --exclude-active --match-tab title:browser-example-serve cd $HOME/code/nyargs-browser-demo \&\& yarn http-server \\n

kitty @ send-text  --exclude-active --match-tab title:browser-example-edit cd $HOME/code/nyargs-browser-demo \&\& emacs package.json \\n
