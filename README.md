# Computer Lab "Image" for Windows

This repository is a template for creating a computer lab "image" for software development teaching, with the following goals:

- one portable zip (just copy/paste; no installers or downloads)
- minimal manual configuration (script as much as possible)
- cohabit with apps for other courses (not an entire machine image)

The valuable parts are:

- [devtools/config.ps1](./devtools/config.ps1) - sets system env, PATH, shortcuts
- [suggested apps & libs](./docs/suggested-apps.md) - for mobile & web dev
- [suggested VSCode extensions](./docs/suggested-vscode-extensions.md) - for optimal learning
- [fixing npm paths](./devtools/node/etc/npmrc) - npm needs to know where it is

## Creating an Image (once)

On the first PC...

1. Clone the `devtools` folder from this repo (this will be your "image")
2. Install [any apps you need](./docs/suggested-apps.md)
3. Close all apps
4. Move apps/libs into their [appropriate directories](./docs/contents.md) inside `devtools`
5. Zip `devtools`

## Distributing the image (per PC)

1. Copy the `devtools` ZIP to each machine (via network or USB drive)
2. Unzip
3. Run `setup.bat` ([which launches `config.ps1`](./devtools/config.ps1))

## Bug? Broken? Improvement?

There are lots of things in this repo I only barely understand. I wrote this for myself & it (barely) works for me, but I'm sure there are mistakes & lots of room for improvement.

I welcome your contributions! Please open an [ISSUE](https://github.com/AjahnCharles/lab-image-win/issues) or [PULL REQUEST](https://github.com/AjahnCharles/lab-image-win/pulls) :)
