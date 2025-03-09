# Segoe-UI Font on Linux (Ubuntu)

## TL;DR

<p align="center"><img src="img/segoe.png" alt="segoe" width="600"/></div></p>

**Segoe** ***(/ˈsiːɡoʊ/ SEE-goh)*** is a typeface, or family of fonts, that is best known for its use by Microsoft. The company uses Segoe in its online and printed marketing materials, including recent logos for a number of products. Additionally, the Segoe UI font sub-family is used by numerous Microsoft applications.

**Segoe UI** is a member of the Segoe family used in Microsoft products for user interface text, as well as for some online user assistance material, intended to improve the consistency in how users see all text across all languages

## How to install it - examples

Just download the fonts in the current directory on fly. Open `terminal` and run the command below.

```bash
FONTS_DIR="." FC_CACHE="false" \
bash <(curl -s https://github.com/pa4080/segoe-ui-linux/mod/install.sh)
```

Or clone the repo... and

```bash
git clone https://github.com/pa4080/segoe-ui-linux.git --branch mod
cd segoe-ui-linux
```

Install for the current user.

```bash
./install.sh
```

Install for Wine.

```bash
DEST_DIR="$HOME/.wine/drive_c/windows/Fonts/" ./install.sh
```

Install system wide.

```bash
export DEST_DIR="/usr/share/fonts/Microsoft/TrueType/SegoeUI/"; sudo ./install.sh
```

## Sample

Github with Segoe UI font looks better (in the example below displays the [papirus-icon](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) repo)

|                  Images (Screenshot)                   |             Description              |
| :----------------------------------------------------: | :----------------------------------: |
| <p align="center"><img src="img/before.png"></div></p> | Without Segoe-UI (before installing) |
| <p align="center"><img src="img/after.png"></div></p>  |   With Segoe-UI (after installing)   |

[Source](https://en.wikipedia.org/wiki/Segoe)
