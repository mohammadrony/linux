# Bangla Typing

Ubuntu 26 / GNOME

## 1. Install Avro Phonetic Input

```bash
sudo apt update
sudo apt install ibus-avro
ibus restart
```

Then:

1. Open **Settings**
2. Go to **Keyboard**
3. Under **Input Sources**, click **+**
4. Search `Bangla`, select **Bangla (Avro Phonetic)**, add it
5. Press `Super+Space` to switch to it

## 2. Install a Bangla Font

Download any font you want (e.g.):

- https://lipighor.com/SabbirSorolota.html
- https://lipighor.com/Shadhinata220.html

Extract the `.ttf` file(s) if zipped, then run:

```bash
mkdir -p ~/.local/share/fonts
find ~/Downloads -iname "*.ttf" -exec cp {} ~/.local/share/fonts/ \;
fc-cache -f
```

The font will now appear in the font picker of any app.

## 3. Test

1. Switch to Bangla input (`Super+Space`)
2. Type something in bangla in a text editor. It should convert to Bangla script
