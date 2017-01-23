package MT::TimestampBasename::L10N::ja;

use strict;
use utf8;
use base 'MT::TimestampBasename::L10N::en_us';
use vars qw( %Lexicon );

%Lexicon = (
    'Sets formatted timestamp to entry default basename.' => '記事のデフォルトファイル名として、整形されたタイムスタンプを使用します。',
    'Entry Basename' => '記事のファイル名',
    'Set formated timestamp as default.' => 'デフォルト値として整形したタイムスタンプを使用する。',
    'Format' => 'フォーマット',
    'Perl strftime subroutine format and %R as 3 digits random integer can be used.'
        => 'Perlのstrftimeサブルーチンのフォーマットと、3桁の乱数として%Rを使用することができます。',
    'example_format' => '例: %Y%m%d_%H%M%S_%R',
);

1;
