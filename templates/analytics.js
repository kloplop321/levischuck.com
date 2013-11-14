window.analytics || (window.analytics = []);
window.analytics.methods = ['identify', 'track', 'trackLink', 'trackForm',
'trackClick', 'trackSubmit', 'page', 'pageview', 'ab', 'alias', 'ready',
'group', 'on', 'once', 'off'];
window.analytics.factory = function (method) {
  return function () {
    var args = Array.prototype.slice.call(arguments);
    args.unshift(method);
    window.analytics.push(args);
    return window.analytics;
  };
};
for (var i = 0; i < window.analytics.methods.length; i++) {
  var method = window.analytics.methods[i];
  window.analytics[method] = window.analytics.factory(method);
}
window.analytics.load = function (apiKey) {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.async = true;
  script.src = ('https:' === document.location.protocol ? 'https://' : 'http://') +
                'd2dq2ahtl5zl1z.cloudfront.net/analytics.js/v1/' + apiKey + '/analytics.min.js';
  var firstScript = document.getElementsByTagName('script')[0];
  firstScript.parentNode.insertBefore(script, firstScript);
};
window.analytics.SNIPPET_VERSION = '2.0.6';
window.analytics.load('dnzoz2et84');
window.analytics.page();