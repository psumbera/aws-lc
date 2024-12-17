$mapfile_version 2

LOAD_SEGMENT text {
        ASSIGN_SECTION boring_text_start { IS_NAME = .text.boring_start };
        ASSIGN_SECTION boring_text_end { IS_NAME = .text.boring_end };
        ASSIGN_SECTION boring_text {
            IS_NAME = MATCH(r/^\.text(\.unlikely|\.exit|\.startup)?$/);
        };
        IS_ORDER = boring_text_start boring_text boring_text_end;

        ASSIGN_SECTION boring_rodata_start { IS_NAME = .rodata.boring_start };
        ASSIGN_SECTION boring_rodata_end { IS_NAME = .rodata.boring_end };
        ASSIGN_SECTION boring_rodata { IS_NAME = MATCH(r/^.rodata($|\.)/) };
        IS_ORDER += boring_rodata_start boring_rodata boring_rodata_end;
};
