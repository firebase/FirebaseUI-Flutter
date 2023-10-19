# StorageImage

A widget that loads and displays an image from Firebase Storage.

## Usage

```dart
StorageImage(
  ref: FirebaseStorage.instance.ref('images/dash_and_sparky.png'),
  fit: BoxFit.cover,
);
```

## Customizing loading state

`StorageImage` supports multiple variants of loading states:

- [`LoadingStateVariant.solidColor`](#solid-color-placeholder) (default)
- [`LoadingStateVariant.loadingIndicator`](#loading-indicator)
- [`LoadingStateVariant.shimmer`](#shimmer-placeholder)
- [`LoadingStateVariant.blurHash`](#blur-hash-placeholder)

### Solid color placeholder

By default, `solidColor` placeholder uses `surfaceTint.withOpacity(0.12)` color from the app color scheme.

The color could be customized:

```dart
StorageImage(
  ref: FirebaseStorage.instance.ref('images/dash_and_sparky.png'),
  fit: BoxFit.cover,
  loadingState: LoadingStateVariant.solidColor(
    color: Colors.white.withOpacity(0.5)
  ),
);
```

### Loading indicator

Loading indicator placeholder will show a `CircularProgressIndicator` under `MaterialApp`, and `CupertinoActivityIndicator` under `CupertinoApp`.

You can customize `size`, `color` and `strokeWidth` of the loading indicator:

```dart
StorageImage(
  ref: FirebaseStorage.instance.ref('images/dash_and_sparky.png'),
  fit: BoxFit.cover,
  loadingState: LoadingStateVariant.loadingIndicator(
    size: 48.0,
    color: Colors.pink,
    strokeWidth: 1.0,
  ),
);
```

> `color` and `strokeWidth` are only applicable to `CircularProgressIndicator`.

### Shimmer placeholder

Shimmer placeholder is a combination of the `solidColor` placeholder with a
[shimmer](https://docs.flutter.dev/cookbook/effects/shimmer-loading) animation.

```dart
StorageImage(
  ref: FirebaseStorage.instance.ref('images/dash_and_sparky.png'),
  fit: BoxFit.cover,
  loadingState: LoadingStateVariant.shimmer(),
);
```

### Blur hash placeholder

[BlurHash](https://blurha.sh/) is a compact blurred version of the image that could be used as a placeholder while the full image is loading.

```dart
StorageImage(
  ref: FirebaseStorage.instance.ref('images/dash_and_sparky.png'),
  fit: BoxFit.cover,
  loadingState: LoadingStateVariant.blurHash(),
);
```

`blurHash` string should be set on the object's `customMetadata`.

Here's an example Cloud Function for Firebase, that could be used to generated and write BlurHash string to the object's metadata:

```ts
import * as functions from "firebase-functions/v2";
import { getStorage } from "firebase-admin/storage";
import { encode } from "blurhash";
import * as sharp from "sharp";
import { initializeApp } from "firebase-admin/app";

initializeApp();

type ResizeResult = {
  buffer: Buffer;
  width: number;
  height: number;
};

exports.genBlurHash = functions.storage.onObjectFinalized(async (event) => {
  const { bucket: fileBucket, name, contentType } = event.data;

  if (!contentType?.startsWith("image/")) {
    return;
  }

  const bucket = getStorage().bucket(fileBucket);
  const file = bucket.file(name);
  const res = await file.download();
  const [buffer] = res;

  const {
    buffer: sharpBuffer,
    width,
    height,
  } = await new Promise<ResizeResult>((resolve, reject) => {
    sharp(buffer)
      .raw()
      .ensureAlpha()
      .resize(64, 64, {
        fit: "inside",
      })
      .toBuffer((err, buffer, { width, height }) => {
        if (err) {
          reject(err);
          return;
        }
        resolve({ buffer, width, height });
      });
  });

  const blurHashString = encode(
    new Uint8ClampedArray(sharpBuffer),
    width,
    height,
    8,
    8
  );

  await file.setMetadata({
    metadata: {
      blurHash: blurHashString,
    },
  });
});
```

> Learn more about Cloud Functions for Firebase [here](https://firebase.google.com/docs/functions).

Alternatively, you could set a genereic, pre-generated blur-hash string directly on the object's metadata:

```dart
StorageImage(
  ref: FirebaseStorage.instance.ref('images/dash_and_sparky.png'),
  fit: BoxFit.cover,
  loadingState: LoadingStateVariant.blurHash(
    blurHash: ':eDJq[9wo~xUbKNexqWG-@M|xuRlt7ayWVoMIwskxVIvs+slNHt'
      '2j]j?RiocR%fRo0oJtRW=V@t2R*bHoMfSbca#oJaybHj@flbIsoWCbHaya}bHoeazbIayofWC'
      'n~j[R*oJ';
  ),
);
```

---

See [API reference](https://pub.dev/documentation/firebase_ui_storage/latest/firebase_ui_storage/StorageImage-class.html) for more details.
