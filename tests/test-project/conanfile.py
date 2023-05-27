from conans import ConanFile, CMake, tools


class GTestNvimTest(ConanFile):
    name = "gtest.nvim-test"
    version = "1.0.0"
    license = "MIT"
    requires = "gtest/1.13.0"
    author = "Páll Andrés Pálsson drllap@gmail.com"
    url = "<Package recipe repository url here, for issues about the package>"
    description = "An example project that uses gtest for UTs. It is used to test " \
            "gtest.vim lua plugin"
    topics = ("gtest", "NeoVim", "plugin")
    settings = "os", "compiler", "build_type", "arch"
    options = {"fPIC": [True, False]}
    default_options = {"fPIC": True}
    generators = "cmake_find_package"

    def config_options(self):
        if self.settings.os == "Windows":
            del self.options.fPIC

#      def source(self):
#          self.run("git clone https://github.com/conan-io/hello.git")
#          # This small hack might be useful to guarantee proper /MT /MD linkage
#          # in MSVC if the packaged project doesn't have variables to set it
#          # properly
#          tools.replace_in_file("hello/CMakeLists.txt", "PROJECT(HelloWorld)",
#                                '''PROJECT(HelloWorld)
#  include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
#  conan_basic_setup()''')

    def build(self):
        cmake = CMake(self)
        #  cmake.configure(source_folder="hello")
        cmake.build()

        # Explicit way:
        # self.run('cmake %s/hello %s'
        #          % (self.source_folder, cmake.command_line))
        # self.run("cmake --build . %s" % cmake.build_config)

    #  def package(self):
    #      self.copy("*.h", dst="include", src="hello")
    #      self.copy("*hello.lib", dst="lib", keep_path=False)
    #      self.copy("*.dll", dst="bin", keep_path=False)
    #      self.copy("*.so", dst="lib", keep_path=False)
    #      self.copy("*.dylib", dst="lib", keep_path=False)
    #      self.copy("*.a", dst="lib", keep_path=False)

    def package_info(self):
        self.cpp_info.libs = ["gtest.nvim-test"]

