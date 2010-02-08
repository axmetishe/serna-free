#${
    IncludeTemplate("3rd/pkg-utils.t");
    my $third_dir = Project("THIRD_DIR");
    if (Config("syspkg") || Config("syspkgonly")) {
    	#! Cannot use find_package_by_files beause it is not a shared library
        my ($incdir, $incSubdir) = find_header('atomic_ops.h');
	unless ($incdir) {
            tmake_error("Can't find libatomic-ops header") if Config("syspkgonly");
	    return;
	};
        my ($found, $libdir, $libSubdir) = find_file_in_path("libatomic_ops.a", '/lib', '/usr/lib');
	unless ($incdir) {
            tmake_error("Can't find libatomic-ops library") if Config("syspkgonly");
	    return;
	};
        my $pkg = {};
	$pkg->{"LFLAGS"} = "$libdir/libatomic_ops.a"; #! unless $libdir eq '/usr/lib';
	$pkg->{"LIBS"} = "libatomig-ops";
	my $includes = '';
        foreach ($incdir, $incSubdir) {
            $includes .= " $_" unless $_ eq '/usr/include';
        }
        $pkg->{"INCLUDES"} = $includes if $includes;
        write_package("$third_dir/lib/libatomic-ops.pkg", $pkg);
        write_file("$third_dir/libatomic-ops/MANIFEST", '');
        Project("TMAKE_TEMPLATE=");
    }
#$}
