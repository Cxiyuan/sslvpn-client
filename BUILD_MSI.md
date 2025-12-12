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
- **标准 MSI 格式**: Windows Installer 标准格式
- **开始菜单快捷方式**: 在开始菜单创建 aVPN 程序组
- **支持升级和修复**: 标准 MSI 特性
- **企业部署友好**: 支持 GPO 和静默安装

## 安装方式

直接双击 MSI 文件即可安装，或使用命令行：

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

## 注意事项

MSI 安装包首次加载可能需要一些时间，这是 Windows Installer 正常行为。安装包本身可以正常使用。