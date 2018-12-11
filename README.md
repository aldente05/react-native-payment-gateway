
# react-native-payment-gateway

[![Build Status](https://semaphoreapp.com/api/v1/projects/d4cca506-99be-44d2-b19e-176f36ec8cf1/128505/badge.svg)](https://semaphoreapp.com/boennemann/badges)
[![NPM version](https://img.shields.io/npm/v/@cycle/core.svg)](https://www.npmjs.com/package/react-native-payment-gateway)
[![Coverage Status](https://coveralls.io/repos/conventional-changelog/standard-version/badge.svg?branch=)](https://coveralls.io/r/conventional-changelog/standard-version?branch=master)
[![Open Source Love](https://badges.frapsoft.com/os/mit/mit.svg?v=102)](https://github.com/aldente05/react-native-payment-gateway)

merchant backend [NODE JS](https://github.com/aldente05/merchant-server-midtrans)

## Getting started

`$ npm install react-native-payment-gateway --save`

### Mostly automatic installation

`$ react-native link react-native-payment-gateway`

### Manual installation


#### iOS

change Podfile into this or lastest version

#### pod 'MidtransCoreKit', '~> 1.14.3' 
#### pod 'MidtransKit', '~> 1.14.3'

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-payment-gateway` and add `ReactNativeMidtrans.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libReactNativeMidtrans.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainApplication.java`
  - Add `import com.paymentgateway.ReactNativeMidtransPackage;` to the imports at the top of the file
  - Add `new MidtransPackage()` to the list returned by the `getPackages()` method
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

async pay(){
        const optionConect = {
            clientKey: "your client key",
            urlMerchant: "https://domain.net/" <<-- will hit https://domain.net/charge,
            sandbox : true <<-- it works for IOS only, change to false if use production
        }

        const transRequest = {
            transactionId: "0001",
            totalAmount: 4000
        }

        const itemDetails = [
            {id: "001", price: 1000, qty: 4, name: "peanuts"}
        ];

        const creditCardOptions = {
            saveCard: false,
            saveToken: false,
            paymentMode: "Normal",
            secure: false
        };

        const userDetail = {
            fullName: "jhon",
            email: "jhon@payment.com",
            phoneNumber: "0850000000",
            userId: "U01",
            address: "street coffee",
            city: "yogyakarta",
            country: "IDN", <-- must be standard country code
            zipCode: "59382"
        };

        const optionColorTheme = {
            primary: '#c51f1f',
            primaryDark: '#1a4794',
            secondary: '#1fce38'
        }

        const optionFont = {
            defaultText: "open_sans_regular.ttf",
            semiBoldText: "open_sans_semibold.ttf",
            boldText: "open_sans_bold.ttf"
        }

        const callback = (res) => {
            console.log(res)
        };

        PaymentGateway.checkOut(
            optionConect,
            transRequest,
            itemDetails,
            creditCardOptions,
            userDetail,
            optionColorTheme,
            optionFont,
            callback
        );
    }
```
