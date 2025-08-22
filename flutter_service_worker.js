'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"android-chrome-192x192.png": "3e16009aa28112f862af4e5ed3011124",
"android-chrome-512x512.png": "3e99b8801f28cf0ba6e5783e85af1ad2",
"apple-touch-icon.png": "98e653264d1e9f901427149787420448",
"assets/AssetManifest.bin": "f6bb67e3c94e25172713022fd3c6d2ea",
"assets/AssetManifest.bin.json": "b73838923526afefe3fe412c3d013046",
"assets/AssetManifest.json": "1dc89dde1fc011c1773cd6b14a5bfdd8",
"assets/assets/aninda/1.png": "276669a563858a30f81c92bedcf4f835",
"assets/assets/aninda/10.png": "65f1ff6b43f84acb6118109acbd38dd3",
"assets/assets/aninda/11.png": "7f013a86f3cfbbe05589e06e520aff47",
"assets/assets/aninda/12.png": "4a26e96b2311f96927543c07c774b86e",
"assets/assets/aninda/2.png": "a98f45dacde87e216bdf0de36ba69bab",
"assets/assets/aninda/3.png": "2eefd177ecc18a05e32e4aa984deaa00",
"assets/assets/aninda/4.png": "6ff69a82a7b32c7b845cbc6410e7488d",
"assets/assets/aninda/5.png": "028954fde78c77914d281380c2c9d75d",
"assets/assets/aninda/6.png": "d1a724412b0754b1783ba2a23d1cac32",
"assets/assets/aninda/7.png": "7996703969d71c7b4f5e9728fd903fd5",
"assets/assets/aninda/8.png": "c07cf37392bd1805f555f618c2ecb05e",
"assets/assets/aninda/9.png": "897d7310aff01ebcf4e0036680f48669",
"assets/assets/aninda/aninda.png": "64c858356d7cfc0c8c169c6456475b07",
"assets/assets/apti/1.PNG": "b80b0ee95ec065213247e4cb2ef08caf",
"assets/assets/apti/2.PNG": "3d2b283a9bce57bb31bfa8324be38a91",
"assets/assets/apti/3.PNG": "bccc7b4a28bd09eb1f6144e1368da613",
"assets/assets/apti/4.PNG": "09f6a54c6326e9445fc7ff90ec9cbf01",
"assets/assets/apti/5.PNG": "6dfaf69ac15df0d4b49372d11cd343d9",
"assets/assets/apti/apti.png": "a982f03002a6d7ee25d862a2bc0d1d21",
"assets/assets/blindlook/1.webp": "fabeb13cac36e854e845ecd1af721c82",
"assets/assets/blindlook/2.webp": "bbd605d3caa0c4e7327f94f8dfeb21a8",
"assets/assets/blindlook/3.webp": "489c0f574ed7542d3a707fc7668af6e1",
"assets/assets/blindlook/4.webp": "0ae233556061bdc5fc4d9bd57c228083",
"assets/assets/blindlook/blindlook.webp": "446150520979dd5ca6b6e7dcea8f85f1",
"assets/assets/bulutfix/1.webp": "1f4c33fc70ec4cfad000822b85c04cf4",
"assets/assets/bulutfix/2.webp": "462a85218623c921cc75bfb4e8243dde",
"assets/assets/bulutfix/3.webp": "3f48ba82fc7445ec380af38ffaa038b6",
"assets/assets/bulutfix/4.webp": "97ed6b21bc5c1b5f50f1e61854cc8a60",
"assets/assets/bulutfix/5.webp": "e866aaae16df6e05c0f276bca2eaab40",
"assets/assets/bulutfix/6.webp": "06543fc50e481ef32942a3c448990d7b",
"assets/assets/bulutfix/7.webp": "4716376baa7d411208b40b8ef44e2187",
"assets/assets/bulutfix/bulutfix.png": "a3b0a37af9a47b88fb7f83396d5dd245",
"assets/assets/deste-yonetim/1.PNG": "91b60b788b05a4bfcf62f7b7efbef3f8",
"assets/assets/deste-yonetim/2.PNG": "6cbe1d6955497639539b087470cdc8f3",
"assets/assets/deste-yonetim/3.PNG": "0e02357f3c836edb1084f5109abc9562",
"assets/assets/deste-yonetim/4.PNG": "ce15bfec627a5d35980f0afc2bfe40a4",
"assets/assets/deste-yonetim/destek_yonteim_hizmetleri.PNG": "cbd8ae9e00b69b2a2a71ed372dcc12f4",
"assets/assets/fallasana/1.png": "e99b74c539fcd56ecbaff6fbc445e630",
"assets/assets/fallasana/2.png": "70178c1189480530a86166b233442db8",
"assets/assets/fallasana/3.png": "7c7fe4100f0f5db8c35cef82def98fdd",
"assets/assets/fallasana/4.png": "9b2375d026c12e012e86bb08f637667f",
"assets/assets/fallasana/fallasana.webp": "5ed29e49b5eb749f86b821e6b398ebf1",
"assets/assets/podium/1.png": "0837410a653a20b7c39e487ca0a02a94",
"assets/assets/podium/10.png": "92aa01d3fc1991ad068cc6b7a45c3aa4",
"assets/assets/podium/11.png": "02d5d6782990540745779855ffd9468c",
"assets/assets/podium/12.png": "0b8b642b3f7cfa92d97bbcf9e7dcd8d5",
"assets/assets/podium/2.png": "3779e61ba0abffd038dcb5b6f9f16bdd",
"assets/assets/podium/3.png": "28a1836a28de85dd0d0073f9a0d47742",
"assets/assets/podium/4.png": "2f83f7c472759037383c4c92a6ca7870",
"assets/assets/podium/5.png": "432e6d32a2c9880a5d9394392833b62e",
"assets/assets/podium/6.png": "44e191798b753b9b1562da295e714a2a",
"assets/assets/podium/7.png": "27548c532564b9c79929f5593cfa5cb4",
"assets/assets/podium/8.png": "b3f4607121a92e8b690eebc8fb413fbb",
"assets/assets/podium/9.png": "f32aa3fd36eacc6272d0e007a3eccb5e",
"assets/assets/podium/podium.png": "5e24630bc66ae3f9c8c76173ad5e7d63",
"assets/assets/profile.webp": "e96cd25774738dcfde0b31445bfe3054",
"assets/assets/sorusakla/1.png": "fce9294f6b9766d90000f288582a1ff2",
"assets/assets/sorusakla/10.png": "8d3a127d18fdca6404343846303f7885",
"assets/assets/sorusakla/11.png": "de662f56ee21e325883f90965a758a84",
"assets/assets/sorusakla/2.png": "1c0215b0ff31b0dd7f6eac8e59045147",
"assets/assets/sorusakla/3.png": "f770f2391d30571bf7a3a9ecef2e2183",
"assets/assets/sorusakla/4.png": "df7baac68e333c484c1c9f479bc04740",
"assets/assets/sorusakla/5.png": "bedf1fcadd3345e6da06db0a7c704e04",
"assets/assets/sorusakla/6.png": "2efde499b834b2c26b408ab5653af50b",
"assets/assets/sorusakla/7.png": "36e077684e858465232875564977d303",
"assets/assets/sorusakla/8.png": "1e9f63f6c9aec0e05ed77b80facdd20a",
"assets/assets/sorusakla/9.png": "92512f3d7e437fc919c15f29dd6ea750",
"assets/assets/sorusakla/sorusakla.png": "5fe84627741945e70dbdd93a68574865",
"assets/assets/wordly/1.webp": "d9166a1173a108b18962efac8e8ae7c8",
"assets/assets/wordly/2.webp": "6dfa9c34bc4e16608fda081f37f625fe",
"assets/assets/wordly/3.webp": "d6fd262a8fdaab0015e2dc037953608f",
"assets/assets/wordly/4.webp": "9b11ed2cd158511a52a77a67c89a6b8a",
"assets/assets/wordly/wordly.png": "6afe8dd93f2f6d490fba35c6c147a699",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "9dad190769a9fff684a11c6127cea28a",
"assets/NOTICES": "9d49d6f1e9a54633f309a39f01296157",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "6cfe36b4647fbfa15683e09e7dd366bc",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/chromium/canvaskit.js": "ba4a8ae1a65ff3ad81c6818fd47e348b",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"favicon-16x16.png": "ee5d4c571581bc8f3bd7b97dfd3f7754",
"favicon-32x32.png": "a8d91007bdc3447b3a2852d4d994cc08",
"favicon.ico": "4d9f7306824fa2114797ccb4404233dd",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"flutter_bootstrap.js": "36c78d6cfcd4548ea9854542eee9abd9",
"index.html": "c54220add74c54edb893ee7ce7ac512a",
"/": "c54220add74c54edb893ee7ce7ac512a",
"main.dart.js": "59eace63a89b46982deccd1bb85c6626",
"manifest.json": "cbcebac37fd138e83f7d2210473727e5",
"version.json": "753a77ab84c26f016b75729c469df551"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
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
        // Claim client to enable caching on first launch
        self.clients.claim();
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
      // Claim client to enable caching on first launch
      self.clients.claim();
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
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
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
