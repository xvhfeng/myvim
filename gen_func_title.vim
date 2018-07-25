py << EOF
import vim
import sys
def gen_func_title_list():
    title = []
    bwstr = vim.vars.get("spkx_bws","static,spx_private")
    bws = bwstr.split(',')
    buf = vim.current.buffer
    is_goon = False
    tmp = []
    line_count = len(buf[:])
    idx = 0
    iline = 0
    while idx < line_count :
        ln = buf[idx].strip().rstrip('\r\n').rstrip('\n')
        idx += 1

        if is_iline(ln):
            is_goon = False
            iline = idx

        if is_stm(ln) :
            tmp = []
            is_goon = False
            continue

        if is_goon or is_start_with(ln,bws) :
            if has_ftitle_over(ln):
                tmp.append(ln[0:ln.find('{')] + ";")
                title.extend(tmp)
                is_goon = False
                tmp = []
            else :
                is_goon = True
                tmp.append(ln)
    
    print iline 
    print title
    buf.append(title,iline)

def is_start_with(line,starts):
    for s in starts:
        if line.startswith(s) :
            return True
    return False

def is_stm(line):
    return -1 != line.find(';')

def has_ftitle_over(line):
    return -1 != line.find('{')

def is_iline(line):
    return line.startswith('#include')

EOF

function! gen_func_title()
py << EOF
import vim
import sys
print "hello"
gen_func_title_list()
EOF
endfunction


