load("//tools:cpplint.bzl", "cpplint")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "engine",
    srcs = [
        "visualization_engine.cc",
        "visualization_manager.cc",
    ],
    hdrs = [
        "visualization_engine.h",
        "visualization_manager.h",
    ],
    copts = [
        "-O2",
        "-DMODULE_NAME=\\\"localization_visualizer\\\"",
    ],
    deps = [
        "//cyber",
        "//modules/common/util",
        "//modules/localization/msf/common/io:localization_msf_common_io",
        "//modules/localization/msf/local_map/base_map:localization_msf_base_map",
        "@boost",
        "@eigen",
    ],
)

cpplint()
