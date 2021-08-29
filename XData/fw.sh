# Sets the target folders and the final framework product.
# 如果工程名称和Framework的Target名称不一样的话，要自定义FMKNAME
# 例如: FMK_NAME = "MyFramework"
FMK_NAME=${PROJECT_NAME}
# Install dir will be the final output to the framework.
# The following line create it in the root folder of the current project.
INSTALL_DIR=${SRCROOT}/Products/${FMK_NAME}.framework
# Working dir will be deleted after the framework creation.
WRK_DIR=Build/Products
DEVICE_DIR=${WRK_DIR}/Release-iphoneos/${FMK_NAME}.framework
SIMULATOR_DIR=${WRK_DIR}/Release-iphonesimulator/${FMK_NAME}.framework
# -configuration ${CONFIGURATION}
# Clean and Building both architectures.

#xcodebuild -configuration "Debug" -target "${FMK_NAME}" -sdk iphoneos clean build
#xcodebuild -configuration "Debug" -target "${FMK_NAME}" -sdk iphonesimulator clean build

# Cleaning the oldest.
if [ -d "${INSTALL_DIR}" ]
then
rm -rf "${INSTALL_DIR}"
fi
mkdir -p "${INSTALL_DIR}"
cp -R "${DEVICE_DIR}/" "${INSTALL_DIR}/"
cp -R "${SIMULATOR_DIR}/" "${INSTALL_DIR}/"
# Uses the Lipo Tool to merge both binary files (i386 + armv6/armv7) into one Universal final product.
#lipo -create "${DEVICE_DIR}/${FMK_NAME}" "${SIMULATOR_DIR}/${FMK_NAME}" -output "${INSTALL_DIR}/${FMK_NAME}"
lipo -create "/Users/zhaoweilin/Library/Developer/Xcode/DerivedData/XData-awixpbrcpremfacjuaqczlbluumw/Build/Products/Release-iphoneos/xdata_core.framework" "/Users/zhaoweilin/Library/Developer/Xcode/DerivedData/XData-awixpbrcpremfacjuaqczlbluumw/Build/Products/Release-iphonesimulator/xdata_core.framework" -output "./xdata_core.framework"

rm -r "${WRK_DIR}"
open "${INSTALL_DIR}"
