user_pref("privacy.clearOnShutdown.cookies", false);
// enable search engine in location bar
user_pref("keyword.enabled", true); 
// sometimes RFP break things, umcomment next line for temp access
//user_pref("privacy.resistFingerprinting", false);

// migrate some old about:config changes that also exist in user.js here, for better use of perfsCleaner.sh
// use extensions on more sites
user_pref("extensions.webextensions.restrictedDomains", "");
// to use userChrome.css
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
// let tree style tab background dark with arc-dark linux theme
// i'm not using TST now, but it still might be useful for other extensions
user_pref("widget.content.allow-gtk-dark-theme", true);
// when refresh searx page, no window will pop up and ask for resend
// https://www.reddit.com/r/firefox/comments/nnluzz/disable_to_display_this_page_firefox_must_send/gzyoia4?utm_source=share&utm_medium=web2x&context=3
user_pref("dom.confirm_repost.testing.always_accept", true);
// no warn on close multiple tabs
user_pref("browser.tabs.warnOnClose", false);
