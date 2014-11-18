#
# February 12 2014, Christian Hopps <chopps@gmail.com>
#
# Copyright (c) 2014 by Christian E. Hopps.
# All rights reserved.
from __future__ import absolute_import, division, unicode_literals, print_function, nested_scopes
import re
from Pymacs import lisp
interactions = {}

lisp.message("Inside pymacs flymake-pyfixers.py")

class foo (object):

    def method1 (self):
        pass

    # foobar
    def method2 (self, unused):
        foo = 1
        foo += 1 * 2
        foo -= 1 + 2
        foo /= 1 - 2
        foo = 1 / 2
        foo = 1 % 2
        foo = 1 ^ 2
        foo = 1 & 2
        foo = 1 | 2
        foo = 1 << 2
        foo = 1 >> 2
        if foo is None:
            pass
        elif foo is not None:
            pass
        pass

    def method3 (self):
        pass


def make_lisp_interactive (func):
    print("[funcwrapper: {}".format(func.func_name))
    interactions[func] = ''
    return func


def get_line_string ():
    start = lisp.line_beginning_position()
    end = lisp.line_end_position()
    return start, end, lisp.buffer_substring(start, end)


def fixer_remove_space_around_equals (unused_error, unused_errtext):
    start, end, line = get_line_string()
    newline = re.sub(r"(\S) *= *(\S)", r"\1=\2", line)
    if newline != line:
        lisp.delete_region(start, end)
        lisp.insert(newline)


def fixer_add_one_space_around_equals (unused_error, unused_errtext):
    start, end, line = get_line_string()
    newline = re.sub(r"(\S) *= *(\S)", r"\1 = \2", line)
    if newline != line:
        lisp.delete_region(start, end)
        lisp.insert(newline)


def fixer_add_blank_line (unused_error, errtext):
    # E302 expected 2 blank lines, found 1
    m = re.search(r"expected (\d+) blank lines, found (\d+)", errtext)
    if m:
        linecount = int(m.group(1)) - int(m.group(2))
        lisp.beginning_of_line()
        lisp.newline(linecount)


def fixer_remove_blank_lines (unused_error, errtext):
    # E303 too many blank lines (7)
    linecount = 1
    m = re.search(r"too many blank lines \((\d+)\)", errtext)
    if m:
        linecount = int(m.group(1))
        # There's a bug in flake8 it's returning 2 lines too many
        if linecount > 2:
            linecount -= 2

    # XXX try this with a comment right about the warning, deletes the comment
    lisp.beginning_of_line()
    beg = lisp.line_beginning_position()
    lisp.beginning_of_line(-(linecount - 1))
    lisp.forward_line(1)
    lisp.forward_char(-1)
    lisp.delete_region(beg, lisp.point())
    return


def fixer_remove_trailing_ws(unused_error, unused_text):
    start, end, line = get_line_string()
    m = re.match(r"^(.*\S+)?\s*$", line)
    if not m:
        #print("NO MATCH")
        return
    #print("MATCH")
    if m.group(1):
        newline = m.group(1)
    else:
        newline = ""
    if newline != line:
        lisp.delete_region(start, end)
        lisp.insert(newline)


def fixer_equals_none (unused_error, unused_errtext):
    start, end, line = get_line_string()
    newline = re.sub(r"==\s*None", r"is None", line)
    newline = re.sub(r"!=\s*None", r"is not None", newline)
    if newline != line:
        lisp.delete_region(start, end)
        lisp.insert(newline)


def fixer_comma_space (unused_error, unused_errtext):
    start, end, line = get_line_string()
    newline = re.sub(r"\s*,\s*", r", ", line)
    if newline != line:
        lisp.delete_region(start, end)
        lisp.insert(newline)


def fixer_fixup_imports (error, errtext):
    pass

fixers = {
    # Pyflake errors
    "W291": fixer_remove_trailing_ws,
    "W293": fixer_remove_trailing_ws,
    # "E225": fixer_add_one_space_around_equals,
    # "E231": fixer_comma_space,
    # "E251": fixer_remove_space_around_equals,
    # "E301": fixer_add_blank_line,
    # "E302": fixer_add_blank_line,
    # "E303": fixer_remove_blank_lines,
    "E401": fixer_fixup_imports,
    "E711": fixer_equals_none,
    # Pylint errors
    # "W0511": fixer_xxx,
}


def get_fixer_func (errno):
    "Return a function to call fo the given errno"
    if errno in fixers:
        return fixers[errno]
    return None


@make_lisp_interactive
def fix_current_line ():
    print("Got called")
    lineno = lisp.flymake_current_line_no()
    errinfo = lisp.flymake_err_info
    errlist = lisp.nth(0, lisp.flymake_find_err_info(errinfo.value(), lineno))
    menudata = lisp.flymake_make_err_menu_data(lineno, errlist)
    did_something = False
    #             caadr (x ((e1 e2 ...))) -> (e1 e2 ...)
    for errtxt in menudata[1][0]:
        if not errtxt:
            break
        m = re.match(r"([EFW]\d+) .*", errtxt)
        if not m:
            print("nomatch on {}".format(errtxt))
            continue
        key = m.group(1)
        if key in fixers:
            did_something = True
            fixers[key](key, errtxt)
    if did_something:
        lisp.flymake_start_syntax_check()

lisp.message("Post pymacs flymake-pyfixers.py")

__author__ = 'Christian Hopps'
__date__ = 'February 12 2014'
__version__ = '1.0'
__docformat__ = "restructuredtext en"

# Local Variables:
# pymacs-auto-reload: t
# End:
