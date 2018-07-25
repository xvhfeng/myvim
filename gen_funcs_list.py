#!/usr/bin/env python
#  -*- encoding: utf-8 -*-

import vim

def get_funs_title():
    print "do me"
    title = []
    bws = vim.vars["spkx_bws"]
    if bwsrt is None or '' == bwsrt :
        bwsrt = "static,spx_private"
    bws = bwstr.split(',')
    buf = vim.current.buffer
    is_goon = False
    tmp = []
    line_count = len(buf[:])
    idx = 0
    while idx < line_count :
        ln = buf[idx].strip().rstrip('\r\n').rstrip('\n')
        if is_stm(ln):
            tmp[:] = None
            is_goon = False
        else :
            if is_goon :
                if has_ftitle_over(ln):
                    tmp.add(ln[0:line.find('{')])
                    is_goon = False
                    title.add(tmp)
                else :
                    tmp.add(ln)
            else :
                if is_start_with(ln,bws):
                    if has_ftitle_over(ln):
                        tmp.add(ln[0:line.find('{')])
                        title.add(tmp)
                    else :
                        tmp.add(ln)
                        is_goon = True
        idx += 1


def is_start_with(line,starts):
    for s in starts:
        if line.startswith(s) :
            return True
    return False

def is_stm(line):
    return -1 != line.find(';')

def has_ftitle_over(line):
    return -1 != line.find('{')





