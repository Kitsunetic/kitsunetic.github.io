---
title: 'Install OpenCV on Ubuntu'
date: 2020-05-25
permalink: /posts/2015/05/install-opencv-ubuntu/
tags:
  - tips
---

# Install OpenCV on Ubuntu

## Install prerequsites

```bash
sudo apt install libgtk2.0-dev pkg-config cmake -y
```

## Download OpenCV-3.4.10 and OpenCV-contrib

https://drive.google.com/file/d/1-LKf5-RVq5LFAEX9SowC60lGUOVSLmEd/view?usp=sharing

## Build OpenCV

### Create directory

```bash
tar -xvzf opencv-3.4.10-prebuild-20200525.tar.gz
cd opencv-3.4.10
mkdir build
cd build
```

<div style="page-break-after: always;"></div>

### CMake configuration

```bash
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D BUILD_opencv_world=ON \
    -D BUILD_JPEG=ON \
    -D BUILD_PNG=ON \
    -D BUILD_TIFF=ON \
    -D WITH_CUDA=OFF \
    -D WITH_IPP=OFF \
    -D WITH_QT=OFF \
    -D WITH_OPENMP=ON \
    -D WITH_TBB=OFF \
    -D WITH_IPP=OFF \
    -D WITH_1394=OFF \
    -D BUILD_WITH_DEBUG_INFO=OFF \
    -D BUILD_DOCS=OFF \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D WITH_GTK=ON \
    -D WITH_OPENGL=ON \
    -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.10/modules \
    -D WITH_V4L=ON  \
    -D WITH_FFMPEG=ON \
    -D WITH_XINE=ON \
    -D BUILD_NEW_PYTHON_SUPPORT=ON \
    -D OPENCV_GENERATE_PKGCONFIG=ON ../
```

### Build and install

```bash
make -j6
sudo make install
```

### Reboot

```bash
sudo reboot now
```

## Check installation

```bash
sudo ldconfig -v | grep opencv
```

Result should be

```bash
$ sudo ldconfig -v | grep opencv

    libopencv_world.so.3.4 -> libopencv_world.so.3.4.10
```
