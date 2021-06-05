vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO homenc/HElib
    REF v2.1.0
    SHA512 e1c5c3d8e77114bfd739f9a3ee72dcac2fe0f611838cbdf3411e5e97f72fa1f571b63eee51c58ef49414983f82f3073d5a68b8c59cb553a310bd3926c1aa9133
    HEAD_REF master
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)
vcpkg_install_cmake()

vcpkg_fixup_cmake_targets(CONFIG_PATH share/cmake/${PORT})

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)

file(COPY ${SOURCE_PATH}/include/helib DESTINATION ${CURRENT_PACKAGES_DIR}/include)
file(INSTALL ${SOURCE_PATH}/LICENSE.md DESTINATION ${CURRENT_PACKAGES_DIR}/share/helib RENAME copyright)
