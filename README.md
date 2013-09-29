adb
===

从android 4.2中分离出来的adb源代码，适用于自己编译独立adb用于linux-x86或arm-linux。

注意：
  
    1、众所周知4.2版本的adb带openssl加密的，这里并没有上传openssl代码，需要自行下载编译，并修改Makefile中对应的库文件路径
    2、此adb经过本人修改，serialNumber及apk安装方式已经发生改变，具体细节请自行研究
    3、请勿随意转载或商用
