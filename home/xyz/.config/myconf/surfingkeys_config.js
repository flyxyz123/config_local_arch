// https://github.com/brookhong/Surfingkeys/wiki/Migrate-your-settings-from-0.9.74-to-1.0
const {
	aceVimMap,
	mapkey,
	imap,
	imapkey,
	getClickableElements,
	vmapkey,
	map,
	unmap,
	vunmap,
	cmap,
	addSearchAlias,
	removeSearchAlias,
	tabOpenLink,
	readText,
	Clipboard,
	Front,
	Hints,
	Visual,
	RUNTIME,

	iunmap,
} = api;

// old example config, may not work. also, I change ctrl-y to Ctrl-y
// an example to create a new mapping `ctrl-y`
//mapkey('<Ctrl-y>', 'Show me the money', function() {
//	Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
//});
// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
//map('gt', 'T');

// I choose to use <Alt-i>, <Alt-s>, or <p> instead. I prefer <p>
//settings.blacklistPattern = /.*youtube\.com.*|.*mail\.google\.com.*/i;

//unmap('<Ctrl-j>');
map('<Ctrl-Alt-h>','<Ctrl-h>');
unmap('<Ctrl-h>');
// ctrl-alt-s not working now (12/09/2021), not sure why, maybe arkenfox user.js problem?
map('<Ctrl-Alt-s>','<Alt-s>');
unmap('<Alt-s>');

// on firefox, firenvim default Ctrl-e will be overwirted by github issue hotkey, see:
// https://github.com/glacambre/firenvim/issues/1046
// https://bugzilla.mozilla.org/show_bug.cgi?id=1713794
// currently seems no good solution but to use another hotkey, I choose Ctrl+,
// current surfingkeys version 0.9.74 is outdated and doesn't contain firenvim integration, wait for author to update
// I tried to run the source code as temp extension in about:debugging or with web-ext cli tool but no luck
// update: surfingkeys 1.0 is out, but it integrate neovim in another way, and firefox is not supported? 
// https://github.com/brookhong/Surfingkeys/issues/1542#:~:text=side%20is%20not-,necessary,-now%2C%20please%20help
// some more links:
// https://github.com/brookhong/Surfingkeys/tree/master/src/nvim/server
settings.useNeovim = true;

// disable all insert mode hotkeys except Ctrl-i for future neovim integration
//iunmap('<Ctrl-i>');
iunmap('<Alt-b>');
iunmap('<Alt-d>');
iunmap('<Alt-f>');
iunmap('<Alt-w>');
iunmap("<Ctrl-'>");
iunmap('<Ctrl-e>');
iunmap('<Ctrl-f>');
iunmap('<Ctrl-u>');
// disable emoj
iunmap(':');

mapkey('n','Find next then center cursor', function(){
	Visual.next(false);
	Visual.feedkeys('zz');
});

mapkey('N','Find previous then center cursor', function(){
	Visual.next(true);
	Visual.feedkeys('zz');
});

// with firefox RFP enabled in user.js, smooth scroll and gg/G do not work, firefox RFP's feature
settings.smoothScroll = false;

// set theme
settings.theme = `
.sk_theme {
	font-family: Input Sans Condensed, Charcoal, sans-serif;
	font-size: 10pt;
	background: #24272e;
	color: #abb2bf;
}
.sk_theme tbody {
	color: #fff;
}
.sk_theme input {
	color: #d0d0d0;
}
.sk_theme .url {
	color: #61afef;
}
.sk_theme .annotation {
	color: #56b6c2;
}
.sk_theme .omnibar_highlight {
	color: #528bff;
}
.sk_theme .omnibar_timestamp {
	color: #e5c07b;
}
.sk_theme .omnibar_visitcount {
	color: #98c379;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
	background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
	background: #3e4452;
}
#sk_status, #sk_find {
	font-size: 16pt;
}`;
// click `Save` button to make above settings to take effect.</ctrl-i></ctrl-y>
