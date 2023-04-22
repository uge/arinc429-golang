include(ExternalProject)

ExternalProject_Add(kaitai
                        PREFIX kaitai
                        GIT_REPOSITORY https://github.com/kaitai-io/kaitai_struct_compiler
                        CONFIGURE_COMMAND ""
                        INSTALL_COMMAND ""
                        BUILD_IN_SOURCE TRUE
                        BUILD_COMMAND sbt compilerJVM/universal:packageBin
                        INSTALL_COMMAND unzip jvm/target/universal/kaitai-struct-compiler-0.11-SNAPSHOT.zip )