ad_library {

    Forums Portlet Install library
    
    Procedures that deal with installing, instantiating, mounting.

    @creation-date 2003-12-31
    @author Don Baccus <dhogaza@pacifier.com>
    @cvs-id 
}

namespace eval news_includelet::install {}

ad_proc -private news_includelet::install::package_install {} {
    Package installation callback proc
} {

    # Admin includelet
    layout::includelet::new \
        -name news_admin_includelet \
        -description #news-includelet.admin_description# \
        -title #news-includelet.admin_pretty_name# \
        -application news \
        -template /packages/news-includelet/lib/news-admin-includelet \
        -required_privilege admin 

    # User includelet
    layout::includelet::new \
        -name news_includelet \
        -description #news-includelet.description# \
        -title #news-includelet.pretty_name# \
        -application news \
        -template /packages/news-includelet/lib/news-includelet
}

ad_proc -private news_includelet::install::package_uninstall {} {
    Package uninstallation callback proc
} {
    portal::includelet::delete -name news_includelet
    portal::includelet::delete -name news_admin_includelet
}

