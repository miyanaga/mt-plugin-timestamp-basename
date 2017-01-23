package MT::TimestampBasename::CMS;

use strict;
use warnings;

sub plugin { MT->component('TimestampBasename') }

sub plugin_config {
    my ( $blog_id, $param ) = @_;
    my $scope = $blog_id ? "blog:$blog_id" : "system";

    my %config;
    plugin->load_config(\%config, $scope);

    my $saving = 0;
    if ( ref $param eq 'HASH' ) {
        foreach my $k ( %$param ) {
            $config{$k} = $param->{$k};
        }
        $saving = 1;
    } elsif ( ref $param eq 'CODE' ) {
        $saving = $param->(\%config);
    }

    plugin->save_config(\%config, $scope) if $saving;
    \%config;
}

sub template_param_edit_entry {
    my ( $cb, $app, $param, $tmpl ) = @_;

    my $config = plugin_config($app->blog->id);
    if ( $config->{enabled} && (!defined($param->{basename}) || $param->{basename} eq '') ) {
        my $format = $config->{format} || '';
        my $blog = $app->blog;
        $format =~ s!%R!(sub { sprintf('%03d', rand(1000)) })->()!ieg;
        my $ts = MT::Util::epoch2ts($blog, time);
        $param->{basename} = MT::Util::format_ts($format, $ts, $blog);
    }

    1;
}

1;
