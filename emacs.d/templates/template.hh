// Copyright Aurora Innovation, Inc., `(format-time-string "%Y")`, All rights reserved.

#pragma once


namespace av {
namespace ${1:`(car (last (split-string (file-name-directory (buffer-file-name)) "/") 3))`} {
namespace ${2:`(car (last (split-string (file-name-directory (buffer-file-name)) "/") 2))`} {


class ${3:`(string-inflection-pascal-case-function (file-name-nondirectory (file-name-sans-extension (buffer-file-name))))`} {
 public:
    $3();

 private:
    
};

    
} // namespace $2
} // namespace $1
} // namespace av

