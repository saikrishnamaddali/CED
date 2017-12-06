#######################################################################
#
# xhook.tcl (allow Tcl to find tclindex and provide this package version)
#
#######################################################################
namespace eval ::xhub::ced::support {
  variable home [file join [pwd] [file dirname [info script]]]
  if {[lsearch -exact $::auto_path $home] == -1} {
    lappend ::auto_path $home
  }
}

package provide ::xhub::ced::support 1.0
