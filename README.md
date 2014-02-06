#langpack-zh-HK

Firefox Hong Kong Language Pack 0.1  
港式火狐瀏覽器翻譯附加元件

本附加元件可以讓你的火狐瀏覽器顯示港式翻譯，以下文件會解譯如何製作你自己的翻譯附加元件。

##A. 安裝
1. 到 https://github.com/mozillahk/langpack-zh-HK ，進入最新的v0xx，下載 `langpack-zh-HK@firefox.mozilla.org.xpi` 檔案；
2. 用滑鼠把 `langpack-zh-HK@firefox.mozilla.org.xpi` 檔案拖到火狐內，附加元件就會開始安裝；
3. 如果想在港式翻譯和其他翻譯之間快速轉換，可以安裝 `Locale Switcher` https://addons.mozilla.org/en-US/firefox/addon/locale-switcher/ 。

##B. 開發
1. 先找火狐的 profile 路經 http://kb.mozillazine.org/Profile_folder_-_Firefox ，進入extensions資料夾；
2. 如已安裝 `langpack-zh-HK@firefox.mozilla.org.xpi` ，你應該會找到它，把它刪除；
3. 把 https://github.com/mozillahk/langpack-zh-HK 中，新的v0xx內的 `langpack-zh-HK@firefox.mozilla.org` 資料夾抄入 `extensions` 資料夾；
4. 在 `langpack-zh-HK@firefox.mozilla.org` 資料夾改什麼，火狐就會顯示什麼。有趣的檔案包括：
 * https://etherpad.mozilla.org/H40DbNESYa  `browser/chrome/zh-TW/locale/browser/browser.dtd`
 * https://etherpad.mozilla.org/XWmclPWIeF  `browser/chrome/zh-TW/locale/browser/aboutDialog.dtd`
 * https://etherpad.mozilla.org/qNI1OTFyR2  `browser/chrome/zh-TW/locale/browser/netError.dtd`
 * https://etherpad.mozilla.org/7gV87YCEeR  `chrome/zh-HK/locale/zh-HK/global/commonDialogs.properties`
5. 當然要重新啟動火狐；
6. 如果改出一個自己的港式翻譯版本，可以把 `langpack-zh-HK@firefox.mozilla.org` 資料夾的檔案 zip 起來，把副檔名由 `zip` 改為 `xpi` 即可。
