help([[
]])

prepend_path("MODULEPATH", "/work/noaa/epic/role-epic/spack-stack/orion/spack-stack-1.5.1/envs/gsi-addon/install/modulefiles/Core")

local stack_python_ver=os.getenv("python_ver") or "3.10.8"
local stack_intel_ver=os.getenv("stack_intel_ver") or "2022.0.2"
local stack_impi_ver=os.getenv("stack_impi_ver") or "2021.5.1"
local cmake_ver=os.getenv("cmake_ver") or "3.23.1"
local prod_util_ver=os.getenv("prod_util_ver") or "1.2.2"

load(pathJoin("stack-intel", stack_intel_ver))
load(pathJoin("stack-intel-oneapi-mpi", stack_impi_ver))
load(pathJoin("python", stack_python_ver))
load(pathJoin("cmake", cmake_ver))

load("gsi_common")
setenv("crtm_ROOT","/work/noaa/da/eliu/git/CRTMv3/build")
setenv("crtm_VERSION","3.1.0")
setenv("CRTM_INC","/work/noaa/da/eliu/git/CRTMv3/build/module/crtm/Intel/2021.5.0.20211109")
setenv("CRTM_LIB","/work/noaa/da/eliu/git/CRTMv3/build/lib/libcrtm.so")
setenv("CRTM_FIX","/work/noaa/da/eliu/git/CRTMv3-fix/Little_Endian")
whatis("Name: crtm")
whatis("Version: 3.1.0")
whatis("Category: library")
whatis("Description: crtm library")

load(pathJoin("prod_util", prod_util_ver))

pushenv("CFLAGS", "-xHOST")
pushenv("FFLAGS", "-xHOST")

pushenv("GSI_BINARY_SOURCE_DIR", "/work/noaa/global/glopara/fix/gsi/20230911")

whatis("Description: GSI environment on Orion with Intel Compilers")
