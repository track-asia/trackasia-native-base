# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/pool
    REF boost-1.82.0
    SHA512 7259283f64f317131fd2913c6f51e8e9d06d69dcf2c325e5c639911c03f815840f1158fbb2cb0734a284e0f1360b99d4f273c30cc5d25983008e8690840e649b
    HEAD_REF master
)

include(${CURRENT_INSTALLED_DIR}/share/boost-vcpkg-helpers/boost-modular-headers.cmake)
boost_modular_headers(SOURCE_PATH ${SOURCE_PATH})