#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use Test::Deep;
use DDG::Test::Goodie;
use DDG::Goodie::Calculator;    # For function subtests.
use utf8;

zci answer_type => 'calc';
zci is_cached   => 1;

sub build_test
{
    my ($query_expression) = @_;
    return test_zci('', structured_answer => {
        data => {
            query => $query_expression
        },
        templates => {
            group => 'base',
            options => {
                content => 'DDH.calculator.content'
            }
        }
    });
}

ddg_goodie_test(
    [qw( DDG::Goodie::Calculator )],

    'calc' => build_test(undef),
    'calculator' => build_test(undef),
    'online calculator' => build_test(undef),
    'calculator online free' => build_test(undef),
    'free online calculator' => build_test(undef),

    'calculator 1 + 5' => build_test(
        "1 + 5"
    ),

    'what is 2-2' => build_test(
        '2 - 2'
    ),
    'solve 2+2' => build_test(
        '2 + 2'
    ),
    '2^8' => build_test(
        '2 ^ 8'
    ),
    '2 *7' => build_test(
        '2 * 7'
    ),
    '4 ∙ 5' => build_test(
        '4 * 5'
    ),
    '6 ⋅ 7' => build_test(
        '6 * 7'
    ),
    '3 × dozen' => build_test(
        '3 * dozen'
    ),
    'dozen ÷ 4' => build_test(
        'dozen / 4'
    ),
    '1 dozen * 2' => build_test(
        '1 dozen * 2'
    ),
    'dozen + dozen' => build_test(
        'dozen + dozen'
    ),
    '2divided by 4' => build_test(
        '2 ÷ 4'
    ),
    '2^2' => build_test(
        '2 ^ 2'
    ),
    '2^0.2' => build_test(
        '2 ^ 0.2'
    ),
    'cos(0)' => build_test(
        'cos(0)'
    ),
    'tan(1)' => build_test(
        'tan(1)'
    ),
    'tanh(1)' => build_test(
        'tanh(1)'
    ),
    'cotan(1)' => build_test(
        'cotan(1)'
    ),
    'sin(1)' => build_test(
        'sin(1)'
    ),
    'csc(1)' => build_test(
        'csc(1)'
    ),
    'sec(1)' => build_test(
        'sec(1)'
    ),
    '$3.43+$34.45' => build_test(
        '$3.43 + $34.45'
    ),
    '$3.45+$34.45' => build_test(
        '$3.45 + $34.45'
    ),
    '$3+$34' => build_test(
        '$3 + $34'
    ),
    '$3,4+$34,4' => build_test(
        '$3,4 + $34,4'
    ),
    '64*343' => build_test(
        '64 * 343'
    ),
    '1E2 + 1' => build_test(
        '(1 * 10 ^ 2) + 1'
    ),
    '1 + 1E2' => build_test(
        '1 + (1 * 10 ^ 2)'
    ),
    '2 * 3 + 1E2' => build_test(
        '2 * 3 + (1 * 10 ^ 2)'
    ),
    '1E2 + 2 * 3' => build_test(
        '(1 * 10 ^ 2) + 2 * 3'
    ),
    '1E2 / 2' => build_test(
        '(1 * 10 ^ 2) / 2'
    ),
    '2 / 1E2' => build_test(
        '2 / (1 * 10 ^ 2)'
    ),
    '424334+2253828' => build_test(
        '424334 + 2253828'
    ),
    '4.243,34+22.538,28' => build_test(
        '4.243,34 + 22.538,28'
    ),
    'sin(1,0) + 1,05' => build_test(
        'sin(1,0) + 1,05'
    ),
    '21 + 15 x 0 + 5' => build_test(
        '21 + 15 * 0 + 5'
    ),
    '0.8158 - 0.8157' => build_test(
        '0.8158 - 0.8157'
    ),
    '2,90 + 4,6' => build_test(
        '2,90 + 4,6'
    ),
    '2,90 + sec(4,6)' => build_test(
        '2,90 + sec(4,6)'
    ),
    '100 - 96.54' => build_test(
        '100 - 96.54'
    ),
    '1. + 1.' => build_test(
        '1. + 1.'
    ),
    '1 + sin(pi)' => build_test(
        '1 + sin(pi)'
    ),
    '1 - 1' => build_test(
        '1 - 1'
    ),
    'sin(pi/2)' => build_test(
        'sin(pi / 2)'
    ),
    'sin(pi)' => build_test(
        'sin(pi)'
    ),
    'cos(2pi)' => build_test(
        'cos(2 pi)'
    ),
    '5 squared' => build_test(
        '5 ^ 2',
    ),
    'sqrt(4)' => build_test(
        'sqrt(4)'
    ),
    '1.0 + 5 squared' => build_test(
        '1.0 + 5 ^ 2'
    ),
    '3 squared + 4 squared' => build_test(
        '3 ^ 2 + 4 ^ 2',
    ),
    '2,2 squared' => build_test(
        '2,2 ^ 2',
    ),
    '0.8^2 + 0.6^2' => build_test(
        '0.8 ^ 2 + 0.6 ^ 2',
    ),
    '2 squared ^ 3' => build_test(
        '2 ^ 2 ^ 3',
    ),
    '2 squared ^ 3.06' => build_test(
        '2 ^ 2 ^ 3.06'
    ),
    '2^3 squared' => build_test(
        '2 ^ 3 ^ 2'
    ),
    'sqrt(2)' => build_test(
        'sqrt(2)'
    ),
    'sqrt(3 pi / 4 + 1) + 1' => build_test(
        'sqrt(3 pi / 4 + 1) + 1'
    ),
    '4 score + 7' => build_test(
        '4 score + 7'
    ),
    '418.1 / 2' => build_test(
        '418.1 / 2'
    ),
    '418.005 / 8' => build_test(
        '418.005 / 8'
    ),
    '(pi^4+pi^5)^(1/6)' => build_test(
        '(pi ^ 4 + pi ^ 5) ^ (1 / 6)'
    ),
    '(pi^4+pi^5)^(1/6)+1' => build_test(
        '(pi ^ 4 + pi ^ 5) ^ (1 / 6) + 1'
    ),
    '5^4^(3-2)^1' => build_test(
        '5 ^ 4 ^ (3 - 2) ^ 1'
    ),
    '(5-4)^(3-2)^1' => build_test(
        '(5 - 4) ^ (3 - 2) ^ 1'
    ),
    '(5+4-3)^(2-1)' => build_test(
        '(5 + 4 - 3) ^ (2 - 1)'
    ),
    '5^((4-3)*(2+1))+6' => build_test(
        '5 ^ ((4 - 3) * (2 + 1)) + 6'
    ),
    '20x07' => build_test(
        '20 * 07'
    ),
    '83.166.167.160/33' => build_test(
        '83.166.167.160 / 33'
    ),
    '123.123.123.123/255.255.255.256' => build_test(
        '123.123.123.123 / 255.255.255.256'
    ),
    '4E5 +1 ' => build_test(
        '(4 * 10 ^ 5) + 1'
    ),
    '4e5 +1 ' => build_test(
        '(4 * 10 ^ 5) + 1'
    ),
    '3e-2* 9 ' => build_test(
        '(3 * 10 ^- 2) * 9'
    ),
    '7e-4 *8' => build_test(
        '(7 * 10 ^- 4) * 8'
    ),
    '6 * 2e-11' => build_test(
        '6 * (2 * 10 ^- 11)',
    ),
    '7 + 7e-7' => build_test(
        '7 + (7 * 10 ^- 7)'
    ),
    '1 * 7 + e-7' => build_test(
        '1 * 7 + e - 7'
    ),
    '7 * e- 5' => build_test(
        '7 * e - 5'
    ),
    'pi/1e9' => build_test(
        'pi / (1 * 10 ^ 9)'
    ),
    'pi*1e9' => build_test(
        'pi * (1 * 10 ^ 9)'
    ),
    '1 234 + 5 432' => build_test(
        '1234 + 5432'
    ),
    '1_234 + 5_432' => build_test(
        '1234 + 5432'
    ),
    '(0.4e^(0))*cos(0)' => build_test(
        '(0.4e ^ (0)) * cos(0)'
    ),
    '2pi' => build_test(
        '2 pi',
    ),
    '-10 * 3' => build_test(
        '-10 * 3'
    ),
    '-10x3' => build_test(
        '-10 * 3'
    ),
    '1e9' => build_test(
        '(1 * 10 ^ 9)'
    ),
    '123.123.123.123/255.255.255.255' => undef,
    '83.166.167.160/27'               => undef,
    '9 + 0 x 0xbf7'                   => undef,
    '0x07'                            => undef,
    'sin(1.0) + 1,05'                 => undef,
    '4,24,334+22,53,828'              => undef,
    '5234534.34.54+1'                 => undef,
    '//'                              => undef,
    # Remove this silly test for now
    # dividedbydividedby                => undef,
    time                              => undef,    # We eval perl directly, only do whitelisted stuff!
    'four squared'                    => undef,
    '! + 1'                           => undef,    # Regression test for bad query trigger.
    '$5'                              => undef,
    'calculate 5'                     => undef,
    'solve $50'                       => undef,
    '382-538-2546'                    => undef,    # Calling DuckDuckGo
    '(382) 538-2546'                  => undef,
    '382-538-2546 x1234'              => undef,
    '1-382-538-2546'                  => undef,
    '+1-(382)-538-2546'               => undef,
    '382.538.2546'                    => undef,
    '+38-2538111111'                  => undef,
    '+382538-111-111'                 => undef,
    '+38 2538 111-111'                => undef,
    '01780-111-111'                   => undef,
    '01780-111-111x400'               => undef,
    '(01780) 111 111'                 => undef,
    'warn "hi"; 1 + 1'                => undef,
    'die "killed"; 1 + 3'             => undef,
    '1 + 1; die'                      => undef,
    '`ls -al /`; 3 * 4'               => undef,
    '1()'                             => undef,
    '1^()'                            => undef,
    '1^($)'                           => undef,
    '1/*-+'                           => undef,
    'http://'                         => undef,
    'word+word'                       => undef,
    'word + word'                     => undef,
    'mxtoolbox'                       => undef,
    'fx-es'                           => undef,
    '-2'                              => undef,
    '-0'                              => undef,
    'm.box.com'                       => undef,
);

done_testing;