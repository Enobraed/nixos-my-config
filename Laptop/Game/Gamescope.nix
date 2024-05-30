{ config, pkgs, ... }:

{
	programs.gamescope.enable = true;
	programs.gamescope.args = [
		"-f"
		"-W 1600 -H 900"
	];

	nixpkgs.config.packageOverrides = pkgs: {
		steam = pkgs.steam.override {
			extraPkgs = pkgs: with pkgs; [
				xorg.libXcursor
				xorg.libXi
				xorg.libXinerama
				xorg.libXScrnSaver
				libpng
				libpulseaudio
				libvorbis
				stdenv.cc.cc.lib
				libkrb5
				keyutils
			];
		};
	};
}