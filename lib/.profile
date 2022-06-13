#!/usr/bin/env sh

for f in "$HOME"/.config/profile.d/*; do
	. "$f"
done
