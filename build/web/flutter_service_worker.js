'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "icons/Icon-192.png": "324cc58b8f03c3a0f63577dfd436f9be",
"icons/Icon-512.png": "4f1f71e0d3d389419e346ba0654622c1",
"manifest.json": "cbe5b7234ca65d424d74e2a818078d33",
"assets/AssetManifest.json": "de4e9ddeb30cc1a244889e3f3c2f035f",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/packages/flutter_boxicons/fonts/Boxicons.ttf": "f5b4c7852b2cea0ec78fcbd63d6547ae",
"assets/FontManifest.json": "9e17761df51ff7cd345b96ec3f517562",
"assets/NOTICES": "bb1f25f5261803ff46f850976b512ef8",
"assets/assets/ssmg-logo-without-bg-512.png": "b451c76ac5167ec1043247fcc560b390",
"assets/assets/ssmg-logo.svg": "d397622b80c6a39e77fbe47cacb669a1",
"assets/assets/lost-animation.json": "9dc08d669886a5640fef53a02ba220ab",
"assets/assets/heart_animation.json": "f370fa7284ed0663055b258059c0c0ae",
"assets/assets/ssmg-logo-without-bg.png": "bc2d508ed3cf894ffcffa11d3493bdca",
"assets/assets/ssmg-logo.png": "1e472f37d3fc8ea14c6cf564757ff308",
"assets/fonts/IBMPlexSans-Text.ttf": "d15aafdb0a9a1e1f956461455f0e467a",
"assets/fonts/Inter.ttf": "9d6daa60661fbedb6d04fa218c7a6158",
"assets/fonts/IBMPlexSans-Italic.ttf": "7cd44d8c770455f6453c69e98a78b241",
"assets/fonts/IBMPlexSans-Bold.ttf": "9f1f71eaf15f45106f185510acbe4b91",
"assets/fonts/IBMPlexSans-SemiBold.ttf": "cd33e3eb10536a9bcce78f5bcae7ff1e",
"assets/fonts/IBMPlexSans-Regular.ttf": "5885b648efeb838142e33016f67b4a35",
"assets/fonts/MaterialIcons-Regular.otf": "4e6447691c9509f7acdbf8a931a85ca1",
"assets/fonts/IBMPlexSans-Medium.ttf": "78186d5cb07b0f49ccf7e0ef0ce013ea",
"main.dart.js": "3bbee07577c749527613c3d74cc79550",
"favicon.ico": "e9b267c2e60dfb566516a87ae15b7545",
"splash/img/light-2x.png": "e668f5497e3707227d5e71c4eae2660f",
"splash/img/light-3x.png": "4c92e1b3f75f30a53fcc49700a20c2a8",
"splash/img/light-1x.png": "796a1433ce1e22ec6f8e23543c15fe60",
"splash/img/dark-2x.png": "e668f5497e3707227d5e71c4eae2660f",
"splash/img/dark-1x.png": "796a1433ce1e22ec6f8e23543c15fe60",
"splash/img/dark-3x.png": "4c92e1b3f75f30a53fcc49700a20c2a8",
"splash/style.css": "aae6c50a132912bc51d86557dad7e886",
"version.json": "3bb6c18a962c0ceaf2e2d48929cf0913",
"index.html": "d5e329ae7b2b78df2ea2c496d3fba343",
"/": "d5e329ae7b2b78df2ea2c496d3fba343"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "/",
"main.dart.js",
"index.html",
"assets/NOTICES",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache.
        return response || fetch(event.request).then((response) => {
          cache.put(event.request, response.clone());
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
