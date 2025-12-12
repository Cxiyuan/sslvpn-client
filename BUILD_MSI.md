# Windows 安装包打包说明

## 前提条件
需要安装 NSIS (Nullsoft Scriptable Install System)

## 构建 EXE 安装包

### 1. 在 Windows 上使用 CMake 构建项目

```bash
mkdir build
cd build
cmake -G "MinGW Makefiles" ..
cmake --build .
```

### 2. 生成 EXE 安装包

```bash
cpack -G NSIS
```

## 安装包特性

- **默认安装路径**: C:\Program Files\aVPN
- **显示安装进度**: 显示安装进度条和状态
- **自动创建桌面快捷方式**: 安装时自动创建桌面图标
- **开始菜单快捷方式**: 在开始菜单创建 aVPN 程序组
- **可取消安装**: 安装窗口包含最小化、关闭、取消按钮

## 创建桌面快捷方式

桌面快捷方式会在安装时自动创建。

## 安装方式

直接双击 EXE 安装包文件即可安装（显示进度条），或使用命令行：

```cmd
aVPN-1.5.3-win64.exe
```

## 完全静默安装（后台安装，无界面）

```cmd
aVPN-1.5.3-win64.exe /S
```

## 自定义安装路径

默认路径为 C:\Program Files\aVPN，如需安装到指定路径：

```cmd
aVPN-1.5.3-win64.exe /S /D=D:\MyPrograms\aVPN
```