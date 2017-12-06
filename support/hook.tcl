namespace eval ::xhub::ced::support {
    namespace export init
    namespace export uninit
    namespace export install
    namespace export uninstall
}
namespace eval ::xhub::ced::support {
    proc install {xitem xstore} {
        setCEDRepoPath $xitem $xstore
    }

    proc uninstall {xitem xstore} {
        setCEDRepoPath $xitem $xstore
    }

    proc init {xstore} {
        set cedRepoPath [get_property LOCAL_ROOT_DIR $xstore]
        set current_ced_repo_paths [get_param ced.repoPaths]
        set_param ced.repoPaths "$current_ced_repo_paths $cedRepoPath"
    }

    proc uninit {xstore} {
    }

    proc setCEDRepoPath {xitem xstore} {    
        set storeRootDir [get_property LOCAL_ROOT_DIR $xstore]
        set xitemRootDir [get_property XITEM_ROOT $xstore]
        if {$xitemRootDir != {}} {
            set cedRepoPath [file join $storeRootDir $xitemRootDir]
        } else {
            set cedRepoPath [$storeRootDir]
        }  
        
        if {$cedRepoPath != {}} {
            set current_ced_repo_paths [get_param ced.repoPaths]
            regsub -all $cedRepoPath $current_ced_repo_paths "" current_ced_repo_paths        
            set current_ced_repo_paths [string trim $current_ced_repo_paths]        

            set_param ced.repoPaths "$current_ced_repo_paths"
            set_param ced.repoPaths "$current_ced_repo_paths $cedRepoPath"
        }
    }
}