## iCarrier

iCarrier is a Mobile Substrate extension for the iPhone and iPad that allows you to change your device's carrier name to any text or emoji you would like. I would expect iCarrier to be compatible with any GSM or CDMA device running IOS 4.2.1 or greater. Unfortunately I would not expect it to be compatible with any none cellular device, i.e. iPod Touches, however I do not own an iPod Touch so I could be wrong.

You must be jailbroken to install iCarrier!

**Depends**

* Cydia Substrate
* Preference Loader
* Open SSH (if working from your local machine)

**Install Instructions**

Download the debian package included in the source code.
```
git clone https://github.com/daniel-nagy/iCarrier.git
cd iCarrier
```
If working from your local machine transfer the package to your iDevice. Replace device.ip.address with your device's ip address. The default password is alpine, I would suggest you change your password if you have not already done so.
```
scp com.danny.iCarrier_1.0-1_iphoneos-arm.deb mobile@device.ip.address:/var/mobile
```
SSH into your remote device and install the package.
```
ssh mobile@device.ip.address
su root
dpkg -i com.danny.iCarrier_1.0-1_iphoneos-arm.deb
rm com.danny.iCarrier_1.0-1_iphoneos-arm.deb
killall SpringBoard
```
Once your device restarts you can visit the Settings application and change your device's carrier name!

Screen Capture:

![alt text](./screencapture/iCarrier.png?raw=true)
