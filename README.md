#### lmiphay gentoo overlay

This overlay contains ebuilds I have either created or updated from various sources.

See http://gentoo-overlays.zugaina.org/lmiphay/ for an overview of the available ebuilds.

Browse the overlay here: http://gpo.zugaina.org/Overlays/lmiphay/

#### Adding the Overlay

This overlay is in layman, you can add this overlay by:

```
layman -L && layman -a lmiphay
```

##### Alternative Overlay Setup

Prior to being in layman it could have been added by either:

```
layman -f -a lmiphay -o 'https://gitweb.gentoo.org/user/lmiphay.git/plain/gentoo-overlay.xml'
```

Or:

```
layman -f -a lmiphay -o 'https://raw.githubusercontent.com/lmiphay/gentoo.overlay/master/overlay.xml'
```
