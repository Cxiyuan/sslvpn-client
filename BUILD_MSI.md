# Windows MSI 打包说明

## 前提条件
需要安装 WiX Toolset 3.11 或更高版本
- 下载地址: https://wixtoolset.org/releases/

## 构建 MSI 安装包

### 1. 在 Windows 上使用 CMake 构建项目

```bash
mkdir build
cd build
cmake -G "MinGW Makefiles" ..
cmake --build .
```

### 2. 生成 MSI 安装包

```bash
cpack -G WIX
```

## MSI 安装包特性

- **默认安装路径**: C:\Program Files\aVPN
- **显示许可协议和安装路径选择**
- **开始菜单快捷方式**: 在开始菜单创建 aVPN 程序组
- **标准 Windows Installer 支持**: 支持升级、修复、卸载等标准功能
- **企业部署友好**: 支持 GPO 和静默安装

## 创建桌面快捷方式

安装完成后，如需创建桌面快捷方式，请运行安装目录下的 `create_desktop_shortcut.bat` 脚本：

```cmd
cd "C:\Program Files\aVPN"
create_desktop_shortcut.bat
```

或在安装完成时自动运行：

```cmd
msiexec /i aVPN-1.5.3-win64.msi
cd "C:\Program Files\aVPN" && create_desktop_shortcut.bat
```

## 安装方式

直接双击 MSI 文件即可安装（显示进度条和许可协议），或使用命令行：

```cmd
msiexec /i aVPN-1.5.3-win64.msi
```

## 完全静默安装（后台安装，无界面）

```cmd
msiexec /i aVPN-1.5.3-win64.msi /quiet /qn
```

## 被动安装（仅显示进度条，无用户交互）

```cmd
msiexec /i aVPN-1.5.3-win64.msi /passive
```

## 自定义安装路径

默认路径为 C:\Program Files\aVPN，如需安装到指定路径：

```cmd
msiexec /i aVPN-1.5.3-win64.msi INSTALL_ROOT="D:\MyPrograms\aVPN"
```

## 组合选项（静默安装到自定义路径）

```cmd
msiexec /i aVPN-1.5.3-win64.msi INSTALL_ROOT="D:\aVPN" /quiet /qn
```