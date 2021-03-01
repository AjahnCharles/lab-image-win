# Install Needed Apps

On the first PC...

## General

1. Download & install [Git (portable)](https://git-scm.com/download/win)

## Mobile Dev (Android)

1. Download & install [Android Studio](https://developer.android.com/studio)
2. Install the Android SDK (using SDK Manager)
3. Install an Android Virtual Device (using AVD Manager)
4. Create an Android project & install desired libraries (via build.gradle)

_Pre-Requisites (must install on each PC):_

- [JDK](https://www.oracle.com/java/technologies/javase-jdk15-downloads.html)
- [HAXM](https://github.com/intel/haxm/releases/tag/v7.6.5)

## Web Dev (Node/Express/Vue)

1. Download & install [NodeJS (ZIP)](https://nodejs.org/en/download/current/)
2. Install desired global libraries  
   _e.g. `npm i -g @vue/cli firebase-tools nodemon npm-check-updates yarn`_
3. Create a Node project & install desired libraries  
   _e.g. `npm i express body-parser express-handlebars sqlite sqlite3 firebase firebase-admin eslint prettier` etc_
4. Update `...\node\etc\npmrc` with the correct paths for your lab PCs
   ```
   prefix=C:\path\to\devtools\npm-global cache=C:\path\to\devtools\npm-cache
   ```
5. Download & install [VSCode (ZIP)](https://code.visualstudio.com/download)
6. Install extensions [(see suggestions)](./suggested-vscode-extensions.md)
7. Configure settings [(see suggestions)](../devtools/vscode/data/user-data/)

_Pre-Requisites (must install on each PC):_

- [VueJS Devtools (Chrome/Edge)](https://chrome.google.com/webstore/detail/vuejs-devtools/nhdogjmejiglipccpnnnanhbledajbpd/related) -or- [VueJS Devtools (Firefox)](https://addons.mozilla.org/en-US/firefox/addon/vue-js-devtools/)

...then [continue to create your "image" zip](../README.md)
