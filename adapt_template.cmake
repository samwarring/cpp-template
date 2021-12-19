# Check for NEW_NAME on command line (Required)
if ("${NEW_NAME}" STREQUAL "")
    message("Usage: cmake -DNEW_NAME=<new project name>\n"
            "             [-DDRY_RUN=1]\n"
            "             -P adapt_template.cmake")
    message(FATAL_ERROR "NEW_NAME not provided")
endif()

# Validate NEW_NAME
set(NAME_PATTERN "^[A-Za-z0-9_]+[A-Za-z0-9]$")
string(REGEX MATCH "${NAME_PATTERN}" NEW_NAME_MATCH "${NEW_NAME}")
if ("${NEW_NAME_MATCH}" STREQUAL "")
    message(FATAL_ERROR "NEW_NAME is invalid. Must match ${NAME_PATTERN}")
endif()
string(REPLACE "_" "-" NEW_NAME_HYPENS ${NEW_NAME})
string(TOUPPER ${NEW_NAME} NEW_NAME_UPPER)
string(REPLACE "-" "_" NEW_NAME_UPPER "${NEW_NAME_UPPER}")

# Validated and ready to go!
message("Adapting template to new name: ${NEW_NAME}")
find_package(Git REQUIRED QUIET)

# Helper function to rename a file
function(rename_file OLD_PATH NEW_PATH)
    message("Rename ${OLD_PATH} -> ${NEW_PATH}")
    if (${DRY_RUN})
        return()
    endif()
    execute_process(COMMAND "${GIT_EXECUTABLE}" mv "${CMAKE_CURRENT_LIST_DIR}/${OLD_PATH}" "${CMAKE_CURRENT_LIST_DIR}/${NEW_PATH}"
                    COMMAND_ERROR_IS_FATAL ANY)
endfunction()

# Helper function to replace occurrances of a string in a file
function(replace_in_file FILE_PATH OLD_STRING NEW_STRING)
    message("Replace string in ${FILE_PATH}: \"${OLD_STRING}\" -> \"${NEW_STRING}\"")
    if (${DRY_RUN})
        return()
    endif()
    file(READ "${CMAKE_CURRENT_LIST_DIR}/${FILE_PATH}" OLD_FILE_CONTENTS)
    string(REPLACE "${OLD_STRING}" "${NEW_STRING}" NEW_FILE_CONTENTS "${OLD_FILE_CONTENTS}")
    file(WRITE "${CMAKE_CURRENT_LIST_DIR}/${FILE_PATH}" "${NEW_FILE_CONTENTS}")
endfunction()

# Helper function to remove a file
function(remove_file FILE_PATH)
    message("Remove ${FILE_PATH}")
    if (${DRY_RUN})
        return()
    endif()
    execute_process(COMMAND "${GIT_EXECUTABLE}" rm "${CMAKE_CURRENT_LIST_DIR}/${FILE_PATH}"
                    COMMAND_ERROR_IS_FATAL ANY)
endfunction(remove_file)

# Replace occurances of cpp_template in files
replace_in_file(CMakeLists.txt cpp_template ${NEW_NAME})
replace_in_file(src/CMakeLists.txt cpp_template ${NEW_NAME})
replace_in_file(test/CMakeLists.txt cpp_template ${NEW_NAME})
replace_in_file(include/cpp_template.h INCLUDED_CPP_TEMPLATE "INCLUDED_${NEW_NAME_UPPER}")
replace_in_file(src/cpp_template.cpp cpp_template.h "${NEW_NAME}.h")
replace_in_file(test/cpp_template_test.cpp cpp_template.h "${NEW_NAME}.h")
replace_in_file(README.md cpp_template ${NEW_NAME})
replace_in_file(vcpkg.json cpp-template ${NEW_NAME_HYPENS})

# Rename template .h/.cpp files
rename_file(include/cpp_template.h "include/${NEW_NAME}.h")
rename_file(src/cpp_template.cpp "src/${NEW_NAME}.cpp")
rename_file(test/cpp_template_test.cpp "test/${NEW_NAME}_test.cpp")

# Remove this script
remove_file(adapt_template.cmake)