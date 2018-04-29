# Bin

## 使用

### VC11_redist.x86.exe

请到 [www.microsoft.com](http://www.microsoft.com/en-us/download/details.aspx?id=30679) 下载最新版的 `Visual C++ Redistributable for Visual Studio 2012`

32 位平台选择 `VSU4\vcredist_x86.exe`，64 位平台选择 `VSU4\vcredist_x64.exe`

### VC14_redist.x86.exe

请到 [www.microsoft.com](http://www.microsoft.com/en-us/download/details.aspx?id=48145) 下载最新版的 `Visual C++ Redistributable for Visual Studio 2015`

32 位平台选择 `vcredist_x86.exe`，64 位平台选择 `vcredist_x64.exe`

### VC15_redist.x86.exe

请到 [support.microsoft.com](https://support.microsoft.com/en-us/help/2977003/the-latest-supported-visual-c-downloads) 下载最新版的 `Visual C++ Redistributable for Visual Studio 2017`

32 位平台选择 `vcredist_x86.exe`，64 位平台选择 `vcredist_x64.exe`

## 安装

**安装包**

请将下载的 `VCredist.x86.exe` 文件，统一放置到当前目录下并依次命名为对应规范的文件名：

将 `Visual C++ Redistributable for Visual Studio 2012` 对应的 `vcredist_x86.exe` 重命名为 `VC11_redist.x86.exe`

将 `Visual C++ Redistributable for Visual Studio 2015` 对应的 `vcredist_x86.exe` 重命名为 `VC14_redist.x86.exe`

将 `Visual C++ Redistributable for Visual Studio 2017` 对应的 `vcredist_x86.exe` 重命名为 `VC15_redist.x86.exe`

## WebStart.Bat 与 WebStop.Bat

运行 `.\Bin\WebStart.Bat` 自动配置环境（启动或重启或自动安装 VC 环境）或运行 `.\Bin\WebStop.Bat` 停止环境
