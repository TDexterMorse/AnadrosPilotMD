file(REMOVE_RECURSE
  "../../bin/gmx"
  "../../bin/gmx.pdb"
)

# Per-language clean rules from dependency scanning.
foreach(lang CXX)
  include(CMakeFiles/gmx.dir/cmake_clean_${lang}.cmake OPTIONAL)
endforeach()
