// fixes
// a lot: image upload from local, image check not robot, disable surfingkey alt-s hotkey
//user_pref("privacy.resistFingerprinting", false);
// douyu pay, bilibili stream watch and user space, pixiv some images not show
user_pref("network.http.referer.XOriginPolicy", 0);
// baidu
user_pref("security.ssl.require_safe_negotiation", false);

// fixes and issues unrelated to arkenfox user.js:
// disable ublock origin:
// baidu drive save to my drive not working
// baidu drive verify phone when delete file not working
// disable enhanced tracking protection:
// google drive can't download

user_pref("privacy.clearOnShutdown.cookies", false);
// enable search engine in location bar
user_pref("keyword.enabled", true); 
// enable https-only mode in private windows only
user_pref("dom.security.https_only_mode", false);
user_pref("dom.security.https_only_mode_pbm", true);
// enable search suggestions
//user_pref("browser.search.suggest.enabled", true);
//user_pref("browser.urlbar.suggest.searches", true);
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.screenshots.disabled", true);
// popup allow "keydown" event, for surfingkeys f hotkey open link in another tab, ex: searx (preference "Results on new tabs" set to on)
user_pref("dom.popup_allowed_events", "click dblclick mousedown pointerdown keydown");
// middle-click enabling auto-scrolling
//user_pref("general.autoScroll", true);
// disable DNS over https, to prevent DNS leak when using VPN
user_pref("network.trr.mode", 5);
// 0: normal, 1: compact, 2: touch
user_pref("browser.uidensity", 1);
// change content process limit, default: 8?
//user_pref("dom.ipc.processCount", 4);
// block all video and audio autoplay
user_pref("media.autoplay.default", 5);
// hardware video acceleration
// https://wiki.archlinux.org/title/Firefox#Hardware_video_acceleration
user_pref("gfx.webrender.all", true);
// will be default to true for firefox 103
user_pref("media.ffmpeg.vaapi.enabled", true);

// old about:config and settings, for perfsCleaner.sh
// use extensions on more sites
user_pref("extensions.webextensions.restrictedDomains", "");
// to use userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
// let tree style tab background dark with arc-dark linux theme
// i'm not using TST now, but it still might be useful for other extensions
// however, starting from around firefox 95, this makes some site show dark background with light theme fonts? so not using it now
//user_pref("widget.content.allow-gtk-dark-theme", true);
// when refresh searx page, no window will pop up and ask for resend
// https://www.reddit.com/r/firefox/comments/nnluzz/disable_to_display_this_page_firefox_must_send/gzyoia4?utm_source=share&utm_medium=web2x&context=3
user_pref("dom.confirm_repost.testing.always_accept", true);
// no warn on close multiple tabs
user_pref("browser.tabs.warnOnClose", false);
// address bar do not suggest open tabs
user_pref("browser.urlbar.suggest.openpage", false);
// address bar do not suggest shortcuts:
// websites that appear when there's no entry in url bar
// have sites like facebook that I almost never use and not in my bookmark
user_pref("browser.urlbar.suggest.topsites", false);
