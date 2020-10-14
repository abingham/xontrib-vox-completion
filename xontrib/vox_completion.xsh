import xonsh


class Completer:
    def __init__(self, command):
        self.command = command
        self.subcommands = {}

    def subcommand(self, name):
        def dec(f):
            self.subcommands[name] = f
            return f
        return dec

    def __call__(self, prefix, line, begidx, endidx, ctx):
        command_tokens = line[:begidx].split()
        for sub, handler in self.subcommands.items():
            if command_tokens == [self.command, sub]:
                return handler(prefix, line, begidx, endidx, ctx)

        if command_tokens == [self.command]:
            return set(s for s in self.subcommands if s.startswith(prefix))


vox_completer = Completer('vox')


@vox_completer.subcommand('new')
@vox_completer.subcommand('create')
@vox_completer.subcommand('list')
@vox_completer.subcommand('ls')
@vox_completer.subcommand('help')
@vox_completer.subcommand('deactivate')
@vox_completer.subcommand('exit')
def _vox_new(prefix, line, begidx, endidx, ctx):
    pass


@vox_completer.subcommand('activate')
@vox_completer.subcommand('workon')
@vox_completer.subcommand('enter')
@vox_completer.subcommand('remove')
@vox_completer.subcommand('rm')
@vox_completer.subcommand('delete')
@vox_completer.subcommand('del')
def _vox_remove(prefix, line, begidx, endidx, ctx):
    envs = $(vox list).split()
    return set(env for env in envs if env.startswith(prefix))


completer add vox vox_completer


__all__ = ()
