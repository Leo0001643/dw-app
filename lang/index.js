import {
  createI18n
} from 'vue-i18n'
import localeLangEn from './en'
import localeLangZhCn from './zh'
import localeLangVi from './vi'
import * as site_inf from '@/config/index'
// import {
//   getStore,
// } from "@/util/index"

let get_i18n = () => {
  const messages = {
    'zh': {
      ...localeLangZhCn,
    },
    'en': {
      ...localeLangEn,
    },
    'vi': {
      ...localeLangVi,
    }
  }
  let locale = 'zh'
  //store 里 是否存有lang的设置 如果没有则从config里面获取, config里面没有设置则 自动从浏览器获取浏览器获取的不在数组中,则默认选中英文 en
  let lang_localStorage =  window.localStorage.getItem('language');
  let lang_site_inf = site_inf.GBL_path.lang
  let lang_navigator = navigator.language || navigator.userLanguage
  let urllangguage = getUrlParams();
  // console.log(urllangguage);
  if (urllangguage) {
    locale = urllangguage;
    window.localStorage.setItem("language", urllangguage);
  } else if (!lang_localStorage) {
    if (!lang_site_inf) {
      let lang = lang_navigator.substr(0, 2) == "en" ? "en" : lang_navigator.substr(0, 2);
      locale = site_inf.GBL_path.langArray.includes(lang) ? lang : "en";
    } else {
      locale = lang_site_inf;
    }
  } else {
    locale = lang_localStorage;
  }
    // site_inf.GBL_path.lang = locale
    document.getElementsByTagName("html")[0].setAttribute("lang", locale);
  let i18n = createI18n({
    locale: locale,
    messages
  })
  return i18n
}

function getUrlParams() {
  // 通过 ? 分割获取后面的参数字符串
  // console.log(window.location.href);

  let urlStr = (window.location.href).split("?")[1];
  // 创建空对象存储参数
  let obj = {};
  // 再通过 & 将每一个参数单独分割出来
  let paramsArr = urlStr && urlStr.split("&");
  // console.log(paramsArr);
  if (paramsArr) {
    for (let i = 0, len = paramsArr.length; i < len; i++) {
      // 再通过 = 将每一个参数分割为 key:value 的形式
      let arr = paramsArr[i].split("=");
      obj[arr[0]] = arr[1];
    }
    return obj?.lang || null;
  } else {
    return null;
  }
}
export default get_i18n()