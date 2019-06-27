package profdistrib;
use base 'distribution';
#use serial_terminal ();
use strict;
use warnings;

sub init {
    my ($self) = @_;

    $self->SUPER::init();
    $self->init_consoles();
}

sub init_consoles {
    my ($self) = @_;

    $self->add_console('console1',  'tty-console', {tty => 2});
    $self->add_console('console2',  'tty-console', {tty => 4});
    return;
}

1;
