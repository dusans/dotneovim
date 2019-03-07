import argparse

import psutil
import pynvim


def find_proc(name):
    procs = []
    for p in psutil.process_iter():
        if p.name() == name:
            procs.append(p)
    return procs


def get_nvim_address(name):
    proc = list(find_proc(name))
    assert len(proc) < 2
    nvim_qt = proc[0]
    nvim_proc = nvim_qt.children()[0]

    nvim_listen_address = nvim_proc.environ()['NVIM_LISTEN_ADDRESS']
    # port = nvim_listen_address.split('-')[1]
    return nvim_listen_address


def get_nvim(name='nvim-qt.exe'):
    return pynvim.attach('socket', path=get_nvim_address(name))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--nvim_qt_name", type=str, default="nvim-qt.exe")
    parser.add_argument("--command", type=str)
    parser.add_argument("--tabnew", type=str)
    parser.add_argument("--vsplit", type=str)
    parser.add_argument("--split", type=str)
    parser.add_argument("--interactive", action="store_true")
    args = parser.parse_args()

    nvim = get_nvim(name=args.nvim_qt_name)

    if args.command:
        nvim.command(args.command)
    if args.tabnew:
        nvim.command("tabnew %s" % args.tabnew)
    if args.vsplit:
        nvim.command("vsplit %s" % args.vsplit)
    if args.split:
        nvim.command("split %s" % args.split)
    if args.interactive:
        import ipdb; ipdb.set_trace()
    nvim.close()


if __name__ == "__main__":
    main()
