
# react-native-payment-gateway

## Getting started

`$ npm install react-native-payment-gateway --save`

### Mostly automatic installation

`$ react-native link react-native-payment-gateway`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-payment-gateway` and add `ReactNativeMidtrans.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libReactNativeMidtrans.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.paymentgateway.ReactNativeMidtransPackage;` to the imports at the top of the file
  - Add `new ReactNativeMidtransPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-payment-gateway'
  	project(':react-native-payment-gateway').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-payment-gateway/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-payment-gateway')
  	```

## Usage
```javascript
import PaymentGateway from 'react-native-payment-gateway';

// TODO: What to do with the module?
PaymentGateway;
```
  