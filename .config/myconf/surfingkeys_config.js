
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
map('<Ctrl-Alt-s>','<Alt-s>');
unmap('<Alt-s>');
// disable emoji
iunmap(':');
// disable all insert mode hotkeys
// workaround for surfingkey Ctrl-i can't open firenvim, even with `settings.useNeovim = true;`, not sure why, I just use Ctrl-e for firenvim instead
useNeovim = true;
//iunmap('<Ctrl-i>');
iunmap('<Alt-b>');
iunmap('<Alt-d>');
iunmap('<Alt-f>');
iunmap('<Alt-w>');
iunmap("<Ctrl-'>");
iunmap('<Ctrl-e>');
iunmap('<Ctrl-f>');
iunmap('<Ctrl-u>');

mapkey('n','Find next then center cursor', function(){
	Visual.next(false);
	Visual.feedkeys('zz');
});

mapkey('N','Find previous then center cursor', function(){
	Visual.next(true);
	Visual.feedkeys('zz');
});

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
