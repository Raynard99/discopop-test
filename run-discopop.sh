# ===========================================================
# ======================= SETTINGS ==========================
# ===========================================================

# used to pass user / application specific flags to cmake
USER_FLAGS="-DUSE_MPI=Off -DUSE_OPENMP=Off"
# Path to clang++ binary
CLANGXX="clang++-8"
# Path to clang binary
CLANG="clang-8"
# path to opt binary
OPT="opt-8"
# Path to CXX_Compiler to be used, usually clang++
CMAKE_CXX_COMPILER=$CLANGXX
# Path to DiscoPoP root folder
DP_ROOT_PATH="/backuphd/norouzi/discopop/"
# Path to DiscoPoP build folder
DP_BUILD_PATH="/backuphd/norouzi/discopop/build"
# set core count for make-command
CORE_COUNT=7
# path to llvm include directory
LLVM_INCLUDE_DIR="/home/lukas/Programme/DP-LLVM/build/include"
# file ending of profiler target files
PROFILER_TARGETS=".cc .cpp .c"
# command line arguments for execution of target program
TARGET_CL_ARGS= "-f ../prot.20.aa"
# Root directory of target application
TARGET_ROOT_DIR="."
# Type of profiling (hybrid / dynamic)
PROFILING_TYPE="Hybrid"
# ==============
# == OUTPUT SETTINGS ==
OUTPUT_COLOR='\033[1;33m'  # yellow
ERROR_COLOR='\032[1;33m'  # red
NO_COLOR='\033[0m'  # reset
# =====================


# ===========================================================
# =========== Handle Command line Arguments =================
# ===========================================================
arg_id=1
for arg in "$@"
do
  # show help string
  if [[ "$arg" == "-h" ]];
  then
    echo "Usage: Either call script from within target root directory, or set -t-root argument accordingly."
    echo ""
    echo "Default settings will be overwritten by command line arguments!"
    echo "Only Exception: PROFILER_TARGETS (.cc .cpp) will be extended."
    echo "Options:"
    echo -e "\t-cuf <flags>\t\t set flags to be passed to cmake"
    echo -e "\t-clang++-path <path>\t path to clang++ binary"
    echo -e "\t-clang-path <path>\t path to clang binary"
    echo -e "\t-opt++-path <path>\t path to opt binary"
    echo -e "\t-dp-root <path>\t\t path to DiscoPoP root folder"
    echo -e "\t-dp-build <path>\t path to DiscoPoP build folder"
    echo -e "\t-j <int>\t\t core count for make commands"
    echo -e "\t-llvm-include <path>\t path to llvm include directory"
    echo -e "\t-p-targets <ending>\t file endings to be added to PROFILER_TARGETS"
    echo -e "\t-p-type [hybrid/dynamic]\t profiler mode. Default: dynamic"
    echo -e "\t-t-args <args>\t\t arguments to be passed to target application"
    echo -e "\t-t-root <dir>\t\t root directory of target application"
    exit 0
  fi
  # CMAKE_USER_FLAGS
  if [[ "$arg" == "-cuf" ]];
  then
    let "tmp_id=arg_id+1"
    CMAKE_USER_FLAGS=${!tmp_id}
  fi
  # CLANGXX
  if [[ "$arg" == "-clang++-path" ]];
  then
    let "tmp_id=arg_id+1"
    CLANGXX=${!tmp_id}
  fi
  # CLANG
  if [[ "$arg" == "-clang-path" ]];
  then
    let "tmp_id=arg_id+1"
    CLANG=${!tmp_id}
  fi
  # OPT
  if [[ "$arg" == "-opt-path" ]];
  then
    let "tmp_id=arg_id+1"
    OPT=${!tmp_id}
  fi
  # DP_ROOT_PATH
  if [[ "$arg" == "-dp-root" ]];
  then
    let "tmp_id=arg_id+1"
    DP_ROOT_PATH=${!tmp_id}
  fi
  # DP_BUILD_PATH
  if [[ "$arg" == "-dp-build" ]];
  then
    let "tmp_id=arg_id+1"
    DP_BUILD_PATH=${!tmp_id}
  fi
  # Core count
  if [[ "$arg" == "-j" ]];
  then
    let "tmp_id=arg_id+1"
    CORE_COUNT=${!tmp_id}
  fi
  # LLVM_INCLUDE_DIR
  if [[ "$arg" == "-llvm-include" ]];
  then
    let "tmp_id=arg_id+1"
    LLVM_INCLUDE_DIR=${!tmp_id}
  fi
  # PROFILER_TARGETS
  if [[ "$arg" == "-p-targets" ]];
  then
    let "tmp_id=arg_id+1"
    PROFILER_TARGETS="$PROFILER_TARGETS ${!tmp_id}"
  fi
  # TARGET_CL_ARGS
  if [[ "$arg" == "-t-args" ]];
  then
    let "tmp_id=arg_id+1"
    TARGET_CL_ARGS=${!tmp_id}
  fi
  # PROFILING_TYPE
  if [[ "$arg" == "-p-type" ]];
  then
    let "tmp_id=arg_id+1"
    PROFILING_TYPE=${!tmp_id}
  fi
  # TARGET_ROOT_DIR
  if [[ "$arg" == "-t-root" ]];
  then
    let "tmp_id=arg_id+1"
    TARGET_ROOT_DIR=${!tmp_id}
  fi
done

# ===========================================================
# =========== Execute DiscoPoP ==============================
# ===========================================================
START_DIR=$PWD
cd $TARGET_ROOT_DIR

# save current working directory to come back later
HOME_DIR=$PWD

###### Remove old analysis results
rm -rf discopop

###### Generate FileMapping.txt
echo -e "${OUTPUT_COLOR}Generate FileMapping.txt${NO_COLOR}"
$DP_ROOT_PATH/scripts/dp-fmap
echo -e "${OUTPUT_COLOR}FileMapping.txt generated.${NO_COLOR}"

###### Create directory to save analysis results
mkdir discopop
cd discopop

###### Create and change directory to temporary folder
bin_dir=tmp
mkdir $bin_dir

###### hybrid profiler
echo -e "${OUTPUT_COLOR}Executing $PROFILING_TYPE Profiler.${NO_COLOR}"
# loop over entries in FileMapping.txt
file_id=0
linkedFiles=""
headerFiles=""
LINES=$(cat ../FileMapping.txt)
for LINE in $LINES
do
  # split file ids from file paths
  if [[ $LINE =~ ^[0-9]+$ ]]
  then
    # line is file id
    file_id=$LINE
  else
    # line is file path
    src_file_path=$LINE
    # since file paths are always preceeded by a file id, file_id now has valid content
    # check if file is of target type
    for target_type in $PROFILER_TARGETS
    do
      if [[ "$src_file_path" == *"$target_type" ]];
      then
        echo -e "${OUTPUT_COLOR}-------> Analyzing file: $src_file_path${NO_COLOR}"
        # current file is of target type
        # link current file
        $CLANG $USER_FLAGS -g -O0 -S -emit-llvm -fno-discard-value-names -Xclang -load -Xclang $DP_BUILD_PATH/libi/LLVMDPInstrumentation.so -mllvm -fm-path -mllvm ../FileMapping.txt  -o $bin_dir/dp_inst_${file_id}.ll $src_file_path
        $CLANG $USER_FLAGS -g -O0 -S -emit-llvm -fno-discard-value-names -Xclang -load -Xclang $DP_BUILD_PATH/libi/LLVMCUGeneration.so -mllvm -fm-path -mllvm ../FileMapping.txt  -o $bin_dir/dp_cu_${file_id}.ll $src_file_path
        $CLANG $USER_FLAGS -g -O0 -S -emit-llvm -fno-discard-value-names -Xclang -load -Xclang $DP_BUILD_PATH/libi/LLVMDPReduction.so -mllvm -fm-path -mllvm ../FileMapping.txt   -o $bin_dir/dp_red_${file_id}.ll $src_file_path

        if [[ "$PROFILING_TYPE" == "Hybrid" ]];
        then
          $OPT -S -load=${DP_BUILD_PATH}/libi/LLVMDPInstrumentationOmission.so -dp-instrumentation-omission -fm-path ../FileMapping.txt $bin_dir/dp_inst_${file_id}.ll -o $bin_dir/dp_inst_${file_id}.ll
        fi
        linkedFiles+=$bin_dir/dp_inst_${file_id}.ll
        linkedFiles+=" "
        echo -e "         ${OUTPUT_COLOR}done!${NO_COLOR}"
      elif [[ "$src_file_path" == *".h" ]]
      then
        headerFiles+=$src_file_path
        headerFiles+=" "
        cp $src_file_path $bin_dir
      fi
    done

  fi
done

# compile linked files
echo -e "${OUTPUT_COLOR}Linking and creating executable${NO_COLOR}"
$CLANGXX $USER_FLAGS $linkedFiles -o $bin_dir/dp_run -L${DP_BUILD_PATH}/rtlib -lDiscoPoP_RT -lpthread

###### Discopop config file
cat >$bin_dir/dp.conf<<EOF
DP_DEBUG=0
SIG_ELEM_BIT=24
SIG_NUM_ELEM=2000000000
SIG_NUM_HASH=4
NUM_WORKERS=32
USE_PERFECT=1
EOF

echo -e "${OUTPUT_COLOR}Running program${NO_COLOR}"
time $bin_dir/dp_run $TARGET_CL_ARGS

echo -e "${OUTPUT_COLOR}$PROFILING_TYPE Profiler done.${NO_COLOR}"

###### Python analyzer

# echo -e "${OUTPUT_COLOR}Executing Analyzer.${NO_COLOR}"

# mv $HOME_DIR/discopop/$bin_dir/dp_run_dep.txt $HOME_DIR/discopop/
# mv $HOME_DIR/FileMapping.txt $HOME_DIR/discopop/

# cd $DP_ROOT_PATH
# python3 -m discopop_explorer --path=$HOME_DIR/discopop/ >> $HOME_DIR/discopop/ranked_patterns.txt

# echo -e "${OUTPUT_COLOR}Analyzer done.${NO_COLOR}"

###### FINISHED
# cd $START_DIR
# echo -e "${OUTPUT_COLOR}FINISHED.${NO_COLOR}"

# TODO:  No clue about it
##cd $HOME_DIR/discopop/
##/media/backuphd/norouzi/discopop/DiscoPoP-GPU/submission/Code/analyzer/build/analyzer Data.xml lulesh2.0_dep.txt &> suggestions.txt



# ###### Reduction
# echo -e "${OUTPUT_COLOR}Executing Reduction.${NO_COLOR}"
# cd ..
# rm -rf discopop

# mkdir discopop
# cd discopop

# cmake $CMAKE_USER_FLAGS -DCMAKE_CXX_COMPILER=$CMAKE_CXX_COMPILER -DCMAKE_CXX_FLAGS="-c -g -O0 -fno-discard-value-names -Xclang -load -Xclang $DP_BUILD_PATH/libi/LLVMDPReduction.so -mllvm -fm-path -mllvm ../FileMapping.txt" ..
# cmake $CMAKE_USER_FLAGS -DCMAKE_CXX_COMPILER=$CMAKE_CXX_COMPILER -DCMAKE_CXX_FLAGS="-g -O0 -fno-discard-value-names -Xclang -load -Xclang $DP_BUILD_PATH/libi/LLVMDPReduction.so -mllvm -fm-path -mllvm ../FileMapping.txt" -DCMAKE_CXX_STANDARD_LIBRARIES="-L$DP_BUILD_PATH/rtlib -lDiscoPoP_RT -lpthread" .

# make -j$CORE_COUNT

# ./lulesh2.0 $TARGET_CL_ARGS

# cp -r * ../tmp1

# echo -e "${OUTPUT_COLOR}Reduction done.${NO_COLOR}"