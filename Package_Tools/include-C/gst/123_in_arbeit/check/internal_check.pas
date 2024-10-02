unit internal_check;

interface

uses
  glib280, gst124;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{-*- mode:C; -*-  }
{
 * Check: a unit test framework for C
 * Copyright (C) 2001, 2002 Arien Malec
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston,
 * MA 02110-1301, USA.
  }
{$ifndef CHECK_H}
{$define CHECK_H}
{$include <stddef.h>}
{$include <string.h>}
{
   Macros and functions starting with _ (underscore) are internal and
   may change without notice. You have been warned!.
 }
{
 * Used for MSVC to create the export attribute
 *  is defined during the compilation of the library
 * on the command line.
  }
{ check version numbers  }

const
  CHECK_MAJOR_VERSION = 0;  
  CHECK_MINOR_VERSION = 9;  
  CHECK_MICRO_VERSION = 14;  
{extern }  var
    check_major_version : longint;cvar;public;
{extern }    check_minor_version : longint;cvar;public;
{extern }    check_micro_version : longint;cvar;public;
{$ifndef NULL}

{ was #define dname def_expr }
function NULL : pointer;  

{$endif}
{$if defined(_MSC_VER)}

const
  pid_t = longint;  
{$endif}
{*
 * Type for a test case
 *
 * A TCase represents a test case.  Create with tcase_create, free
 * with tcase_free.  For the moment, test cases can only be run
 * through a suite
 }
type
{*
 * Type for a test function
  }

  TTFun = procedure (para1:longint);cdecl;
{*
 * Type for a setup/teardown function
  }

  TSFun = procedure (para1:pointer);cdecl;
{*
 * Type for a test suite
  }
{*
 * Creates a test suite with the given name.
 *
 * Create a suite, which will contain test cases. Once
 * created, use suite_add_tcase() to add test cases.
 * When finished, create a suite runner from the
 * suite using srunner_create()
 *
 * @param name name of the suite
 *
 * @return suite
 *
 * @since 0.6.0
  }

function suite_create(name:Pchar):PSuite;cdecl;external libgstcheck;
{*
 * Determines whether a given test suite contains a case named after a
 * given string.
 *
 * @param s suite to check
 * @param tcname test case to look for
 *
 * @return 1 iff the given test case is within the given suite;
 *          0 otherwise
 *
 * @since 0.9.9
  }
function suite_tcase(s:PSuite; tcname:Pchar):longint;cdecl;external libgstcheck;
{*
 * Add a test case to a suite.
 *
 * Note that if the TCase has already been added attempting
 * to add it again will be ignored.
 *
 * @param s suite to add test case to
 * @param tc test case to add to suite
 *
 * @since 0.6.0
  }
procedure suite_add_tcase(s:PSuite; tc:PTCase);cdecl;external libgstcheck;
{*
 * Create a test case.
 *
 * Once created, tests can be added with the tcase_add_test()
 * function, and the test case assigned to a suite with the
 * suite_add_tcase() function.
 *
 * @param name name of the test case
 *
 * @return test case containing no tests
 *
 * @since 0.6.0
 *  }
function tcase_create(name:Pchar):PTCase;cdecl;external libgstcheck;
{*
 * Associate a test case with certain tags.
 * Replaces any existing tags with the new set.
 *
 * @param tc the test case
 *
 * @param tags string containing arbitrary tags separated by spaces.
 *        This will be copied. Passing NULL clears all tags.
 *
 * @since 0.11.0
 *  }
procedure tcase_set_tags(tc:PTCase; tags:Pchar);cdecl;external libgstcheck;
{*
 * Add a test function to a test case
 *
 * @param tc test case to add test to
 * @param tf test function to add to test case
 *
 * @since 0.6.0
 *  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function tcase_add_test(tc,tf : longint) : longint;

{*
 * Add a test function with signal handling to a test case
 *
 * The added test is expected to terminate by throwing the given signal
 *
 * @param tc test case to add test to
 * @param tf test function to add to test case
 * @param signal expected signal for test function to throw in order for
 *                the test to be considered passing
 *
 * @since 0.9.2
 *  }
{*
 * Add a test function with an expected exit value to a test case
 *
 * The added test is expected to terminate by exiting with the given value
 *
 * @param tc test case to add test to
 * @param tf test function to add to test case
 * @param expected_exit_value exit value for test function to return in
 *                             order for the test to be considered passing
 *
 * @since 0.9.7
  }
{*
 * Add a looping test function to a test case
 *
 * The test will be called in a for(i = s; i < e; i++) loop with each
 * iteration being executed in a new context. The loop variable 'i' is
 * available in the test.
 *
 * @param tc test case to add test to
 * @param tf function to add to test case
 * @param s starting index for value "i" in test
 * @param e ending index for value "i" in test
 *
 * @since 0.9.4
  }
{*
 * Add a looping test function with signal handling to a test case
 *
 * The test will be called in a for(i = s; i < e; i++) loop with each
 * iteration being executed in a new context. The loop variable 'i' is
 * available in the test.
 *
 * The added test is expected to terminate by throwing the given signal
 *
 * @param tc test case to add test to
 * @param tf function to add to test case
 * @param signal expected signal for test function to throw in order for
 *                the test to be considered passing
 * @param s starting index for value "i" in test
 * @param e ending index for value "i" in test
 *
 * @since 0.9.5
  }
{*
 * Add a looping test function with an expected exit value to a test case
 *
 * The test will be called in a for(i = s; i < e; i++) loop with each
 * iteration being executed in a new context. The loop variable 'i' is
 * available in the test.
 *
 * The added test is expected to terminate by exiting with the given value
 *
 * @param tc test case to add test to
 * @param tf function to add to test case
 * @param expected_exit_value exit value for test function to return in
 *                             order for the test to be considered passing
 * @param s starting index for value "i" in test
 * @param e ending index for value "i" in test
 *
 * @since 0.9.7
  }
{ Add a test function to a test case
  (function version -- use this when the macro won't work
 }
procedure _tcase_add_test(tc:PTCase; tf:TTFun; fname:Pchar; _signal:longint; allowed_exit_value:longint; 
            start:longint; end:longint);cdecl;external libgstcheck;
{*
 * Add unchecked fixture setup/teardown functions to a test case
 *
 * Unchecked fixture functions are run at the start and end of the
 * test case, and not before and after unit tests. Further,
 * unchecked fixture functions are not run in a separate address space,
 * like test functions, and so must not exit or signal (e.g.,
 * segfault).
 *
 * Also, when run in CK_NOFORK mode, unchecked fixture functions may
 * lead to different unit test behavior if unit tests change data
 * setup by the fixture functions.
 *
 * Note that if a setup function fails, the remaining setup functions
 * will be omitted, as will the test case and the teardown functions.
 * If a teardown function fails the remaining teardown functions will be
 * omitted.
 *
 * @param tc test case to add unchecked fixture setup/teardown to
 * @param setup function to add to be executed before the test case;
 *               if NULL no setup function is added
 * @param teardown function to add to be executed after the test case;
 *               if NULL no teardown function is added
 * @since 0.8.0
  }
procedure tcase_add_unchecked_fixture(tc:PTCase; setup:TSFun; teardown:TSFun);cdecl;external libgstcheck;
{*
 * Add checked fixture setup/teardown functions to a test case
 *
 * Checked fixture functions are run before and after each unit test inside
 * of the address space of the test. Thus, if using CK_FORK
 * mode the separate process running the unit test will survive signals
 * or unexpected exits in the fixture function. Also, if the setup
 * function is idempotent, unit test behavior will be the same in
 * CK_FORK and CK_NOFORK modes.
 *
 * However, since fixture functions are run before and after each unit
 * test, they should not be expensive code.
 *
 * Note that if a setup function fails, the remaining setup functions
 * will be omitted, as will the test and the teardown functions. If a
 * teardown function fails the remaining teardown functions will be
 * omitted.
 *
 * @param tc test case to add checked fixture setup/teardown to
 * @param setup function to add to be executed before each unit test in
 *               the test case;  if NULL no setup function is added
 * @param teardown function to add to be executed after each unit test in
 *               the test case; if NULL no teardown function is added
 *
 * @since 0.8.0
 }
procedure tcase_add_checked_fixture(tc:PTCase; setup:TSFun; teardown:TSFun);cdecl;external libgstcheck;
{*
 * Set the timeout for all tests in a test case.
 *
 * A test that lasts longer than the timeout (in seconds) will be killed
 * and thus fail with an error.
 *
 * If not set, the default timeout is one assigned at compile time. If
 * the environment variable CK_DEFAULT_TIMEOUT is defined and no timeout
 * is set, the value in the environment variable is used.
 *
 * If Check is compile without fork() support this call is ignored,
 * as timeouts are not possible.
 *
 * @param tc test case to assign timeout to
 * @param timeout to use, in seconds. If the value contains a decimal
 *                 portion, but no high resolution timer is available,
 *                 the value is rounded up to the nearest second.
 *
 * @since 0.9.2
  }
procedure tcase_set_timeout(tc:PTCase; timeout:Tdouble);cdecl;external libgstcheck;
{ Internal function to mark the start of a test function  }
procedure tcase_fn_start(fname:Pchar; file:Pchar; line:longint);cdecl;external libgstcheck;
{*
 * Start a unit test with START_TEST(unit_name), end with END_TEST.
 *
 * One must use braces within a START_/END_ pair to declare new variables
 *
 * @since 0.6.0
  }
{#define END_TEST  }
{
 * Fail the test case unless expr is false
 *
 * This call is deprecated.
  }
const
  fail_unless = ck_assert_msg;  
{
 * Fail the test case if expr is false
 *
 * This call is deprecated.
 *
 * NOTE: The space before the comma sign before ## is essential to be compatible
 * with gcc 2.95.3 and earlier.
 * FIXME: these macros may conflict with C89 if expr is
 * FIXME:   strcmp (str1, str2) due to excessive string length.
  }
{
 * Fail the test
 *
 * This call is deprecated.
  }
  fail = ck_abort_msg;  
{
 * This is called whenever an assertion fails.
  }

procedure _ck_assert_failed(file:Pchar; line:longint; expr:Pchar; args:array of const);cdecl;external libgstcheck;
procedure _ck_assert_failed(file:Pchar; line:longint; expr:Pchar);cdecl;external libgstcheck;
{*
 * Fail the test if expression is false
 *
 * @param expr expression to evaluate
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.6
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ck_assert(expr : longint) : longint;

{ The space before the comma sign before ## is essential to be compatible
   with gcc 2.95.3 and earlier.
 }
{*
 * Fail the test if the expression is false; print message on failure
 *
 * @param expr expression to evaluate
 * @param ... message to print (in printf format) if expression is false
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.6
  }
{*
 * Unconditionally fail the test
 *
 * @note Once called, the remaining of the test is aborted
 *
 * @since 0.9.6
  }
{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function ck_abort : longint;

{*
 * Unconditionally fail the test; print a message
 *
 * @param ... message to print (in printf format)
 *
 * @note Once called, the remaining of the test is aborted
 *
 * @since 0.9.6
  }
{*
 * Check two signed integers to determine if X==Y
 *
 * If not X==Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.6
  }
{#define ck_assert_int_eq(X, Y) _ck_assert_int(X, ==, Y) }
{*
 * Check two signed integers to determine if X!=Y
 *
 * If not X!=Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.6
  }
{#define ck_assert_int_ne(X, Y) _ck_assert_int(X, !=, Y) }
{*
 * Check two signed integers to determine if X<Y
 *
 * If not X<Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_int_lt(X, Y) _ck_assert_int(X, <, Y) }
{*
 * Check two signed integers to determine if X<=Y
 *
 * If not X<=Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_int_le(X, Y) _ck_assert_int(X, <=, Y) }
{*
 * Check two signed integers to determine if X>Y
 *
 * If not X>Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_int_gt(X, Y) _ck_assert_int(X, >, Y) }
{*
 * Check two signed integers to determine if X>=Y
 *
 * If not X>=Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_int_ge(X, Y) _ck_assert_int(X, >=, Y) }
{*
 * Check two unsigned integers to determine if X==Y
 *
 * If not X==Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_uint_eq(X, Y) _ck_assert_uint(X, ==, Y) }
{*
 * Check two unsigned integers to determine if X!=Y
 *
 * If not X!=Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_uint_ne(X, Y) _ck_assert_uint(X, !=, Y) }
{*
 * Check two unsigned integers to determine if X<Y
 *
 * If not X<Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_uint_lt(X, Y) _ck_assert_uint(X, <, Y) }
{*
 * Check two unsigned integers to determine if X<=Y
 *
 * If not X<=Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_uint_le(X, Y) _ck_assert_uint(X, <=, Y) }
{*
 * Check two unsigned integers to determine if X>Y
 *
 * If not X>Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_uint_gt(X, Y) _ck_assert_uint(X, >, Y) }
{*
 * Check two unsigned integers to determine if X>=Y
 *
 * If not X>=Y, the test fails.
 *
 * @param X signed integer
 * @param Y signed integer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_uint_ge(X, Y) _ck_assert_uint(X, >=, Y) }
{ String comparison macros with improved output compared to ck_assert()  }
{ OP might be any operator that can be used in '0 OP strcmp(X,Y)' comparison  }
{ The x and y parameter swap in strcmp() is needed to handle >, >=, <, <= operators  }
{*
 * Check two strings to determine if 0==strcmp(X,Y)
 *
 * If not 0==strcmp(X,Y), the test fails.
 *
 * @param X string
 * @param Y string to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.6
  }
{#define ck_assert_str_eq(X, Y) _ck_assert_str(X, ==, Y) }
{*
 * Check two strings to determine if 0!=strcmp(X,Y)
 *
 * If not 0!=strcmp(X,Y), the test fails.
 *
 * @param X string
 * @param Y string to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.6
  }
{#define ck_assert_str_ne(X, Y) _ck_assert_str(X, !=, Y) }
{*
 * Check two strings to determine if 0<strcmp(X,Y), (e.g. strcmp(X,Y)>0)
 *
 * If not 0<strcmp(X,Y), the test fails.
 *
 * @param X string
 * @param Y string to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_str_lt(X, Y) _ck_assert_str(X, <, Y) }
{*
 * Check two strings to determine if 0<=strcmp(X,Y) (e.g. strcmp(X,Y)>=0)
 *
 * If not 0<=strcmp(X,Y), the test fails.
 *
 * @param X string
 * @param Y string to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_str_le(X, Y) _ck_assert_str(X, <=, Y) }
{*
 * Check two strings to determine if 0<strcmp(X,Y) (e.g. strcmp(X,Y)>0)
 *
 * If not 0<strcmp(X,Y), the test fails.
 *
 * @param X string
 * @param Y string to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_str_gt(X, Y) _ck_assert_str(X, >, Y) }
{*
 * Check two strings to determine if 0>=strcmp(X,Y) (e.g. strcmp(X,Y)<=0)
 *
 * If not 0>=strcmp(X,Y), the test fails.
 *
 * @param X string
 * @param Y string to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_str_ge(X, Y) _ck_assert_str(X, >=, Y) }
{ Pointer comparison macros with improved output compared to ck_assert().  }
{ OP may only be == or !=   }
{*
 * Check if two pointers are equal.
 *
 * If the two passed pointers are not equal, the test
 * fails.
 *
 * @param X pointer
 * @param Y pointer to compare against X
 *
 * @note If the check fails, the remaining of the test is aborted
 *
 * @since 0.9.10
  }
{#define ck_assert_ptr_eq(X, Y) _ck_assert_ptr(X, ==, Y) }
{*
 * Check if two pointers are not.
 *
 * If the two passed pointers are equal, the test fails.
 *
 * @param X pointer
 * @param Y pointer to compare against X
 *
 * @since 0.9.10
  }
{#define ck_assert_ptr_ne(X, Y) _ck_assert_ptr(X, !=, Y) }
{*
 * Mark the last point reached in a unit test.
 *
 * If the test throws a signal or exits, the location noted with the
 * failure is the last location of a ck_assert*() or ck_abort() call.
 * Use mark_point() to record intermediate locations (useful for tracking down
 * crashes or exits).
 *
 * @since 0.6.0
 }
{#define mark_point() _mark_point(__FILE__,__LINE__) }
{ Non macro version of #mark_point  }
procedure _mark_point(file:Pchar; line:longint);cdecl;external libgstcheck;
{*
 * Enum describing the possible results of a test
  }
{*< Default value; should not encounter this  }
{*< Test passed  }
{*< Test completed but failed  }
{*< Test failed to complete
                                   (unexpected signal or non-zero early exit)  }
type
  Ttest_result =  Longint;
  Const
    CK_TEST_RESULT_INVALID = 0;
    CK_PASS = 1;
    CK_FAILURE = 2;
    CK_ERROR = 3;

{*
 * Enum specifying the verbosity of output a SRunner should produce
  }
{*< No output  }
{*< Only summary output  }
{*< All failed tests  }
{*< All tests  }
{*< Look at environment var CK_VERBOSITY
                                     for what verbosity to use, which can be
                                     either "silent", "minimal", "normal",
                                     or "verbose". If the environment variable
                                     is not set, then CK_NORMAL will be used. }
{$if 0}
{*< Run as a subunit child process  }
{$endif}
{*< Not a valid option  }
type
  Tprint_output =  Longint;
  Const
    CK_SILENT = 0;
    CK_MINIMAL = 1;
    CK_NORMAL = 2;
    CK_VERBOSE = 3;
    CK_ENV = 4;
    CK_SUBUNIT = 5;
    CK_LAST = 6;

{*
 * Holds state for a running of a test suite
  }
type
{*
 * Opaque type for a test failure
  }
{*
 * Enum representing the types of contexts for a test
  }
{*< Default value; should not encounter this  }
{*< Setup before a test  }
{*< Body of test itself  }
{*< Teardown after a test  }
  Tck_result_ctx =  Longint;
  Const
    CK_CTX_INVALID = 0;
    CK_CTX_SETUP = 1;
    CK_CTX_TEST = 2;
    CK_CTX_TEARDOWN = 3;

{*
 * Retrieve type of result that the given test result represents.
 *
 * This is a member of test_result, and can represent a
 * pass, failure, or error.
 *
 * @param tr test result to retrieve result from
 *
 * @return result of given test
 *
 * @since 0.6.0
  }

function tr_rtype(tr:PTestResult):longint;cdecl;external libgstcheck;
{*
 * Retrieve context in which the result occurred for the given test result.
 *
 * The types of contents include the test setup, teardown, or the
 * body of the test itself.
 *
 * @param tr test result to retrieve context from
 *
 * @return context to which the given test result applies
 *
 * @since 0.8.0
  }
{ enum ck_result_ctx  tr_ctx (TestResult * tr); }
{*
 * Retrieve failure message from test result, if applicable.
 *
 * @return pointer to a message, if one exists. NULL otherwise.
 *
 * @since 0.6.0
  }
function tr_msg(tr:PTestResult):Pchar;cdecl;external libgstcheck;
{*
 * Retrieve line number at which a failure occurred, if applicable.
 *
 * @return If the test resulted in a failure, returns the line number
 *          that the failure occurred on; otherwise returns -1.
 *
 * @since 0.6.0
  }
function tr_lno(tr:PTestResult):longint;cdecl;external libgstcheck;
{*
 * Retrieve file name at which a failure occurred, if applicable.
 *
 * @return If the test resulted in a failure, returns a string
 *          containing the name of the file where the failure
 *          occurred; otherwise returns NULL.
 *
 * @since 0.6.0
  }
function tr_lfile(tr:PTestResult):Pchar;cdecl;external libgstcheck;
{*
 * Retrieve test case name in which a failure occurred, if applicable.
 *
 * @return If the test resulted in a failure, returns a string
 *          containing the name of the test suite where the failure
 *          occurred; otherwise returns NULL.
 *
 * @since 0.6.0
  }
function tr_tcname(tr:PTestResult):Pchar;cdecl;external libgstcheck;
{*
 * Creates a suite runner for the given suite.
 *
 * Once created, additional suites can be added to the
 * suite runner using srunner_add_suite(), and the suite runner can be
 * run with srunner_run_all(). Once finished, the suite runner
 * must be freed with srunner_free().
 *
 * @param s suite to generate a suite runner for
 *
 * @return suite runner for the given suite
 *
 * @since 0.6.0
  }
function srunner_create(s:PSuite):PSRunner;cdecl;external libgstcheck;
{*
 * Add an additional suite to a suite runner.
 *
 * The first suite in a suite runner is always added in srunner_create().
 * This call adds additional suites to a suite runner.
 *
 * @param sr suite runner to add the given suite
 * @param s suite to add to the given suite runner
 *
 * @since 0.7.0
  }
procedure srunner_add_suite(sr:PSRunner; s:PSuite);cdecl;external libgstcheck;
{*
 * Frees a suite runner, including all contained suite and test cases.
 *
 * This call is responsible for freeing all resources related to a
 * suite runner and all contained suites and test cases. Suite and
 * test cases need not be freed individually, as this call handles that.
 *
 * @param sr suite runner to free
 *
 * @since 0.6.0
  }
procedure srunner_free(sr:PSRunner);cdecl;external libgstcheck;
{*
 * Runs a suite runner and all contained suite, printing results to
 * stdout as specified by the print_mode.
 *
 * In addition to running all suites, if the suite runner has been
 * configured to output to a log, that is also performed.
 *
 * Note that if the CK_RUN_CASE, CK_RUN_SUITE, CK_INCLUDE_TAGS and/or
 * CK_EXCLUDE_TAGS environment variables are defined, then only the
 * named suites or test cases will run.
 *
 * @param sr suite runner to run all suites from
 * @param print_mode the verbosity in which to report results to stdout
 *
 * @since 0.6.0
  }
procedure srunner_run_all(sr:PSRunner; print_mode:Tprint_output);cdecl;external libgstcheck;
{*
 * Run a specific suite or test case from a suite runner, printing results
 * to stdout as specified by the print_mode.
 *
 * In addition to running any applicable suites or test cases, if the
 * suite runner has been configured to output to a log, that is also
 * performed.
 *
 * Note that if the sname and tcname parameters are passed as null
 * then the function will fallback to using the environment variables
 * CK_RUN_SUITE and CK_RUN_CASE respectively in order to select the
 * suite/cases.
 * 
 * Similarly if the CK_INCLUDE_TAGS and/or CK_EXCLUDE_TAGS environment
 * variables are defined then these will further filter the test cases
 * (see srunner_run_tagged, below).
 *
 * @param sr suite runner where the given suite or test case must be
 * @param sname suite name to run. A NULL means use the value of the
 * environment variable CK_RUN_SUITE if set, otherwise run "any/every
 * suite".
 * @param tcname test case name to run. A NULL means use the value of
 * the environment variable CK_RUN_CASE if set, otherwise run
 * "any/every case".
 * @param print_mode the verbosity in which to report results to stdout
 *
 * @since 0.9.9
  }
procedure srunner_run(sr:PSRunner; sname:Pchar; tcname:Pchar; print_mode:Tprint_output);cdecl;external libgstcheck;
{*
 * Run a specific suite or test case or testcases with specific tags
 * from a suite runner, printing results to stdout as specified by the
 * print_mode.
 *
 * In addition to running any applicable suites or test cases, if the
 * suite runner has been configured to output to a log, that is also
 * performed.
 *
 * Note that if sname, tcname, include_tags, exclude_tags parameters
 * are passed as NULL then if the environment variables CK_RUN_SUITE,
 * CK_RUN_CASE, CK_INCLUDE_TAGS, CK_EXCLUDE_TAGS are defined then these
 * values will be used instead.
 *
 * @param sr suite runner where the given suite or test case must be
 * @param sname suite name to run. A NULL means use the value of the
 * environment variable CK_RUN_SUITE if set, otherwise run "any/every
 * suite".
 * @param tcname test case name to run. A NULL means use the value of
 * the environment variable CK_RUN_CASE if set, otherwise run
 * "any/every case".
 * @param include_tags space separate list of tags. Only run test
 * cases that share one of these tags. A NULL means use the value of
 * the environment variable CK_INCLUDE_TAGS if set, otherwise run
 * "any/every test case".
 * @param exclude_tags space separate list of tags. Only run test
 * cases that do not share one of these tags even if they are selected
 * by an included tag. A NULL means use the value of the environment
 * variable CK_EXCLUDE_TAGS if set, otherwise run "any/every test
 * case".
 * @param print_mode the verbosity in which to report results to stdout
 *
 * @since 0.11.0
  }
procedure srunner_run_tagged(sr:PSRunner; sname:Pchar; tcname:Pchar; include_tags:Pchar; exclude_tags:Pchar; 
            print_mode:Tprint_output);cdecl;external libgstcheck;
{*
 * Retrieve the number of failed tests executed by a suite runner.
 *
 * This value represents both test failures and errors.
 *
 * @param sr suite runner to query for all failed tests
 *
 * @return number of test failures and errors found by the suite runner
 *
 * @since 0.6.1
  }
function srunner_ntests_failed(sr:PSRunner):longint;cdecl;external libgstcheck;
{*
 * Retrieve the total number of tests run by a suite runner.
 *
 * @param sr suite runner to query for all tests run
 *
 * @return number of all tests run by the suite runner
 *
 * @since 0.6.1
  }
function srunner_ntests_run(sr:PSRunner):longint;cdecl;external libgstcheck;
{*
 * Return an array of results for all failures found by a suite runner.
 *
 * Number of results is equal to srunner_nfailed_tests().
 *
 * Information about individual results can be queried using:
 * tr_rtype(), tr_ctx(), tr_msg(), tr_lno(), tr_lfile(), and tr_tcname().
 *
 * Memory is malloc'ed and must be freed; however free the entire structure
 * instead of individual test cases.
 *
 * @param sr suite runner to retrieve results from
 *
 * @return array of TestResult objects
 *
 * @since 0.6.0
  }
function srunner_failures(sr:PSRunner):^PTestResult;cdecl;external libgstcheck;
{*
 * Return an array of results for all tests run by a suite runner.
 *
 * Number of results is equal to srunner_ntests_run(), and excludes
 * failures due to setup function failure.
 *
 * Information about individual results can be queried using:
 * tr_rtype(), tr_ctx(), tr_msg(), tr_lno(), tr_lfile(), and tr_tcname().
 *
 * Memory is malloc'ed and must be freed; however free the entire structure
 * instead of individual test cases.
 *
 * @param sr suite runner to retrieve results from
 *
 * @return array of TestResult objects
 *
 * @since 0.6.1
 }
function srunner_results(sr:PSRunner):^PTestResult;cdecl;external libgstcheck;
{*
 * Print the results contained in an SRunner to stdout.
 *
 * @param sr suite runner to print results for to stdout
 * @param print_mode the print_output (verbosity) to use to report
 *         the result
 *
 * @since 0.7.0
  }
procedure srunner_print(sr:PSRunner; print_mode:Tprint_output);cdecl;external libgstcheck;
{*
 * Set the suite runner to output the result in log format to the
 * given file.
 *
 * Note: log file setting is an initialize only operation -- it should
 * be done immediately after SRunner creation, and the log file can't be
 * changed after being set.
 *
 * This setting does not conflict with the other log output types;
 * all logging types can occur concurrently if configured.
 *
 * @param sr suite runner to log results of in log format
 * @param fname file name to output log results to
 *
 * @since 0.7.1
 }
procedure srunner_set_log(sr:PSRunner; fname:Pchar);cdecl;external libgstcheck;
{*
 * Checks if the suite runner is assigned a file for log output.
 *
 * @param sr suite runner to check
 *
 * @return 1 iff the suite runner currently is configured to output
 *         in log format; 0 otherwise
 *
 * @since 0.7.1
  }
function srunner_has_log(sr:PSRunner):longint;cdecl;external libgstcheck;
{*
 * Retrieves the name of the currently assigned file
 * for log output, if any exists.
 *
 * @return the name of the log file, or NULL if none is configured
 *
 * @since 0.7.1
  }
function srunner_log_fname(sr:PSRunner):Pchar;cdecl;external libgstcheck;
{*
 * Set the suite runner to output the result in XML format to the
 * given file.
 *
 * Note: XML file setting is an initialize only operation -- it should
 * be done immediately after SRunner creation, and the XML file can't be
 * changed after being set.
 *
 * This setting does not conflict with the other log output types;
 * all logging types can occur concurrently if configured.
 *
 * @param sr suite runner to log results of in XML format
 * @param fname file name to output XML results to
 *
 * @since 0.9.1
 }
procedure srunner_set_xml(sr:PSRunner; fname:Pchar);cdecl;external libgstcheck;
{*
 * Checks if the suite runner is assigned a file for XML output.
 *
 * @param sr suite runner to check
 *
 * @return 1 iff the suite runner currently is configured to output
 *         in XML format; 0 otherwise
 *
 * @since 0.9.1
  }
function srunner_has_xml(sr:PSRunner):longint;cdecl;external libgstcheck;
{*
 * Retrieves the name of the currently assigned file
 * for XML output, if any exists.
 *
 * @return the name of the XML file, or NULL if none is configured
 *
 * @since 0.9.1
  }
function srunner_xml_fname(sr:PSRunner):Pchar;cdecl;external libgstcheck;
{*
 * Set the suite runner to output the result in TAP format to the
 * given file.
 *
 * Note: TAP file setting is an initialize only operation -- it should
 * be done immediately after SRunner creation, and the TAP file can't be
 * changed after being set.
 *
 * This setting does not conflict with the other log output types;
 * all logging types can occur concurrently if configured.
 *
 * @param sr suite runner to log results of in TAP format
 * @param fname file name to output TAP results to
 *
 * @since 0.9.12
 }
procedure srunner_set_tap(sr:PSRunner; fname:Pchar);cdecl;external libgstcheck;
{*
 * Checks if the suite runner is assigned a file for TAP output.
 *
 * @param sr suite runner to check
 *
 * @return 1 iff the suite runner currently is configured to output
 *         in TAP format; 0 otherwise
 *
 * @since 0.9.12
  }
function srunner_has_tap(sr:PSRunner):longint;cdecl;external libgstcheck;
{*
 * Retrieves the name of the currently assigned file
 * for TAP output, if any exists.
 *
 * @return the name of the TAP file, or NULL if none is configured
 *
 * @since 0.9.12
  }
function srunner_tap_fname(sr:PSRunner):Pchar;cdecl;external libgstcheck;
{*
 * Enum describing the current fork usage.
  }
{*< look in the environment for CK_FORK  }
{*< call fork to run tests  }
{*< don't call fork  }
type
  Tfork_status =  Longint;
  Const
    CK_FORK_GETENV = 0;
    CK_FORK = 1;
    CK_NOFORK = 2;

{*
 * Retrieve the current fork status for the given suite runner
 *
 * @param sr suite runner to check fork status of
 *
 * @since 0.8.0
  }
{ enum fork_status  srunner_fork_status (SRunner * sr); }
{*
 * Set the fork status for a given suite runner.
 *
 * The default fork status is CK_FORK_GETENV, which will look
 * for the CK_FORK environment variable, which can be set to
 * "yes" or "no". If the environment variable is not present,
 * CK_FORK will be used if fork() is available on the system,
 * otherwise CK_NOFORK is used.
 *
 * If set to CK_FORK or CK_NOFORK, the environment variable
 * if defined is ignored.
 *
 * If Check is compiled without support for fork(), attempting
 * to set the status to CK_FORK is ignored.
 *
 * @param sr suite runner to assign the fork status to
 * @param fstat fork status to assign
 *
 * @since 0.8.0
  }

procedure srunner_set_fork_status(sr:PSRunner; fstat:Tfork_status);cdecl;external libgstcheck;
{*
 * Invoke fork() during a test and assign the child to the same
 * process group that the rest of the test case uses.
 *
 * One can invoke fork() directly during a test; however doing so
 * may not guarantee that any children processes are destroyed once
 * the test finishes. Once a test has completed, all processes in
 * the process group will be killed; using this wrapper will prevent
 * orphan processes.
 *
 * If Check is compiled without fork() support this call simply
 * return -1 and does nothing.
 *
 * @return On success, the PID of the child process is returned in
 *          the parent, and 0 is returned in the child.  On failure,
 *          a value of -1 is returned to the parent process and no
 *          child process is created.
 *
 * @since 0.9.3
  }
{$if !defined(_MSC_VER)}

function check_fork:Tpid_t;cdecl;external libgstcheck;
{$endif}
{*
 * Wait for the pid and exit.
 *
 * This is to be used in conjunction with check_fork(). When called,
 * will wait for the given process to terminate. If the process
 * exited without error, exit(EXIT_SUCCESS) is invoked; otherwise
 * exit(EXIT_FAILURE) is invoked.
 *
 * If Check is compiled without support for fork(), this invokes
 * exit(EXIT_FAILURE).
 *
 * @param pid process to wait for, created by check_fork()
 *
 * @since 0.9.3
  }
{$if !defined(_MSC_VER)}

procedure check_waitpid_and_exit(pid:Tpid_t);cdecl;external libgstcheck;
{$endif}
{$endif}
{ CHECK_H  }

// === Konventiert am: 2-10-24 17:00:02 ===


implementation


{ was #define dname def_expr }
function NULL : pointer;
  begin
    NULL:=pointer(0);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function tcase_add_test(tc,tf : longint) : longint;
begin
  tcase_add_test:=tcase_add_test_raise_signal(tc,tf,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function ck_assert(expr : longint) : longint;
begin
  ck_assert:=ck_assert_msg(expr,NULL);
end;

{ was #define dname(params) para_def_expr }
{ return type might be wrong }   
function ck_abort : longint;
begin
  ck_abort:=ck_abort_msg(NULL);
end;


end.
