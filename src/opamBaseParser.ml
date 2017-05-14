type token =
  | STRING of (string)
  | IDENT of (string)
  | BOOL of (bool)
  | EOF
  | LBRACKET
  | RBRACKET
  | LPAR
  | RPAR
  | LBRACE
  | RBRACE
  | COLON
  | INT of (int)
  | RELOP of (OpamParserTypes.relop)
  | AND
  | OR
  | PFXOP of (OpamParserTypes.pfxop)
  | ENVOP of (OpamParserTypes.env_update_op)

open Parsing;;
let _ = parse_error;;
# 13 "./opam-file-format/src/opamBaseParser.mly"

open OpamParserTypes

(** OPAM config file generic type parser *)

let get_pos n =
  let pos = Parsing.rhs_start_pos n in
  Lexing.(pos.pos_fname,
          pos.pos_lnum,
          pos.pos_cnum - pos.pos_bol)

# 35 "src/opamBaseParser.ml"
let yytransl_const = [|
    0 (* EOF *);
  260 (* LBRACKET *);
  261 (* RBRACKET *);
  262 (* LPAR *);
  263 (* RPAR *);
  264 (* LBRACE *);
  265 (* RBRACE *);
  266 (* COLON *);
  269 (* AND *);
  270 (* OR *);
    0|]

let yytransl_block = [|
  257 (* STRING *);
  258 (* IDENT *);
  259 (* BOOL *);
  267 (* INT *);
  268 (* RELOP *);
  271 (* PFXOP *);
  272 (* ENVOP *);
    0|]

let yylhs = "\255\255\
\001\000\003\000\003\000\004\000\004\000\004\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\006\000\006\000\005\000\005\000\005\000\005\000\000\000\000\000"

let yylen = "\002\000\
\002\000\002\000\000\000\003\000\004\000\005\000\001\000\003\000\
\003\000\004\000\003\000\003\000\003\000\003\000\002\000\002\000\
\000\000\002\000\001\000\001\000\001\000\001\000\002\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\023\000\000\000\000\000\022\000\
\019\000\020\000\000\000\000\000\021\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\001\000\002\000\000\000\000\000\
\000\000\016\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\018\000\009\000\008\000\000\000\000\000\
\000\000\013\000\014\000\000\000\005\000\010\000\006\000"

let yydgoto = "\003\000\
\005\000\023\000\006\000\007\000\017\000\024\000"

let yysindex = "\051\000\
\005\255\054\255\000\000\004\255\000\000\024\000\005\255\000\000\
\000\000\000\000\054\255\054\255\000\000\032\255\054\255\059\255\
\007\255\018\255\005\255\054\255\000\000\000\000\036\255\025\255\
\029\255\000\000\024\255\054\255\054\255\054\255\032\255\032\255\
\005\255\050\255\059\255\000\000\000\000\000\000\052\255\003\255\
\024\255\000\000\000\000\053\255\000\000\000\000\000\000"

let yyrindex = "\000\000\
\041\000\000\000\000\000\000\000\000\000\000\000\002\000\000\000\
\000\000\000\000\040\255\056\255\000\000\000\000\000\000\064\000\
\001\000\000\000\061\255\000\000\000\000\000\000\001\255\000\000\
\000\000\000\000\016\000\062\255\000\000\000\000\000\000\000\000\
\061\255\000\000\054\000\000\000\000\000\000\000\000\000\046\000\
\031\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\254\255\252\255\000\000\246\255\253\255"

let yytablesize = 319
let yytable = "\016\000\
\007\000\003\000\022\000\026\000\018\000\017\000\004\000\017\000\
\025\000\017\000\028\000\019\000\027\000\020\000\034\000\015\000\
\030\000\035\000\031\000\036\000\042\000\043\000\032\000\021\000\
\039\000\033\000\040\000\041\000\044\000\037\000\012\000\028\000\
\008\000\009\000\010\000\038\000\008\000\009\000\010\000\011\000\
\003\000\012\000\013\000\028\000\017\000\011\000\013\000\014\000\
\029\000\030\000\015\000\001\000\002\000\004\000\008\000\009\000\
\010\000\011\000\045\000\012\000\046\000\047\000\017\000\024\000\
\013\000\014\000\028\000\000\000\015\000\003\000\017\000\029\000\
\030\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\007\000\007\000\007\000\007\000\007\000\007\000\007\000\
\007\000\007\000\003\000\007\000\000\000\007\000\007\000\007\000\
\015\000\015\000\015\000\015\000\015\000\015\000\015\000\000\000\
\015\000\000\000\015\000\015\000\015\000\015\000\015\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\000\000\012\000\
\000\000\012\000\012\000\012\000\012\000\012\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\000\000\011\000\004\000\
\011\000\011\000\011\000\000\000\011\000\000\000\004\000"

let yycheck = "\002\000\
\000\000\000\000\007\000\014\000\001\001\005\001\002\001\007\001\
\012\000\009\001\008\001\008\001\015\000\010\001\019\000\000\000\
\014\001\020\000\012\001\023\000\031\000\032\000\016\001\000\000\
\028\000\008\001\029\000\030\000\033\000\005\001\000\000\008\001\
\001\001\002\001\003\001\007\001\001\001\002\001\003\001\004\001\
\000\000\006\001\011\001\008\001\005\001\000\000\011\001\012\001\
\013\001\014\001\015\001\001\000\002\000\000\000\001\001\002\001\
\003\001\004\001\009\001\006\001\009\001\009\001\007\001\000\000\
\011\001\012\001\008\001\255\255\015\001\009\001\009\001\013\001\
\014\001\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\001\001\002\001\003\001\004\001\005\001\006\001\007\001\
\008\001\009\001\009\001\011\001\255\255\013\001\014\001\015\001\
\001\001\002\001\003\001\004\001\005\001\006\001\007\001\255\255\
\009\001\255\255\011\001\012\001\013\001\014\001\015\001\001\001\
\002\001\003\001\004\001\005\001\006\001\007\001\255\255\009\001\
\255\255\011\001\012\001\013\001\014\001\015\001\001\001\002\001\
\003\001\004\001\005\001\006\001\007\001\255\255\009\001\002\001\
\011\001\012\001\013\001\255\255\015\001\255\255\009\001"

let yynames_const = "\
  EOF\000\
  LBRACKET\000\
  RBRACKET\000\
  LPAR\000\
  RPAR\000\
  LBRACE\000\
  RBRACE\000\
  COLON\000\
  AND\000\
  OR\000\
  "

let yynames_block = "\
  STRING\000\
  IDENT\000\
  BOOL\000\
  INT\000\
  RELOP\000\
  PFXOP\000\
  ENVOP\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'items) in
    Obj.repr(
# 57 "./opam-file-format/src/opamBaseParser.mly"
            ( fun file_name ->
        { file_contents = _1; file_name } )
# 215 "src/opamBaseParser.ml"
               : string -> OpamParserTypes.opamfile))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'item) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'items) in
    Obj.repr(
# 62 "./opam-file-format/src/opamBaseParser.mly"
             ( _1 :: _2 )
# 223 "src/opamBaseParser.ml"
               : 'items))
; (fun __caml_parser_env ->
    Obj.repr(
# 63 "./opam-file-format/src/opamBaseParser.mly"
             ( [] )
# 229 "src/opamBaseParser.ml"
               : 'items))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : OpamParserTypes.value) in
    Obj.repr(
# 67 "./opam-file-format/src/opamBaseParser.mly"
                                   ( Variable (get_pos 1, _1, _3) )
# 237 "src/opamBaseParser.ml"
               : 'item))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'items) in
    Obj.repr(
# 68 "./opam-file-format/src/opamBaseParser.mly"
                            (
  Section (get_pos 1,
           {section_kind=_1; section_name=None; section_items= _3})
)
# 248 "src/opamBaseParser.ml"
               : 'item))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 4 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'items) in
    Obj.repr(
# 72 "./opam-file-format/src/opamBaseParser.mly"
                                   (
  Section (get_pos 1,
           {section_kind=_1; section_name=Some _2; section_items= _4})
)
# 260 "src/opamBaseParser.ml"
               : 'item))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 79 "./opam-file-format/src/opamBaseParser.mly"
                             ( _1 )
# 267 "src/opamBaseParser.ml"
               : OpamParserTypes.value))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'values) in
    Obj.repr(
# 80 "./opam-file-format/src/opamBaseParser.mly"
                             ( Group (get_pos 1,_2) )
# 274 "src/opamBaseParser.ml"
               : OpamParserTypes.value))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'values) in
    Obj.repr(
# 81 "./opam-file-format/src/opamBaseParser.mly"
                             ( List (get_pos 1,_2) )
# 281 "src/opamBaseParser.ml"
               : OpamParserTypes.value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : OpamParserTypes.value) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'values) in
    Obj.repr(
# 82 "./opam-file-format/src/opamBaseParser.mly"
                             ( Option (get_pos 2,_1, _3) )
# 289 "src/opamBaseParser.ml"
               : OpamParserTypes.value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : OpamParserTypes.value) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : OpamParserTypes.value) in
    Obj.repr(
# 83 "./opam-file-format/src/opamBaseParser.mly"
                             ( Logop (get_pos 2,`And,_1,_3) )
# 297 "src/opamBaseParser.ml"
               : OpamParserTypes.value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : OpamParserTypes.value) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : OpamParserTypes.value) in
    Obj.repr(
# 84 "./opam-file-format/src/opamBaseParser.mly"
                             ( Logop (get_pos 2,`Or,_1,_3) )
# 305 "src/opamBaseParser.ml"
               : OpamParserTypes.value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : OpamParserTypes.relop) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 85 "./opam-file-format/src/opamBaseParser.mly"
                             ( Relop (get_pos 2,_2,_1,_3) )
# 314 "src/opamBaseParser.ml"
               : OpamParserTypes.value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'atom) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : OpamParserTypes.env_update_op) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 86 "./opam-file-format/src/opamBaseParser.mly"
                             ( Env_binding (get_pos 1,_1,_2,_3) )
# 323 "src/opamBaseParser.ml"
               : OpamParserTypes.value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : OpamParserTypes.pfxop) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : OpamParserTypes.value) in
    Obj.repr(
# 87 "./opam-file-format/src/opamBaseParser.mly"
                             ( Pfxop (get_pos 1,_1,_2) )
# 331 "src/opamBaseParser.ml"
               : OpamParserTypes.value))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : OpamParserTypes.relop) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'atom) in
    Obj.repr(
# 88 "./opam-file-format/src/opamBaseParser.mly"
                             ( Prefix_relop (get_pos 1,_1,_2) )
# 339 "src/opamBaseParser.ml"
               : OpamParserTypes.value))
; (fun __caml_parser_env ->
    Obj.repr(
# 92 "./opam-file-format/src/opamBaseParser.mly"
                             ( [] )
# 345 "src/opamBaseParser.ml"
               : 'values))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : OpamParserTypes.value) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'values) in
    Obj.repr(
# 93 "./opam-file-format/src/opamBaseParser.mly"
                             ( _1 :: _2 )
# 353 "src/opamBaseParser.ml"
               : 'values))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 97 "./opam-file-format/src/opamBaseParser.mly"
                             ( Ident (get_pos 1,_1) )
# 360 "src/opamBaseParser.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 98 "./opam-file-format/src/opamBaseParser.mly"
                             ( Bool (get_pos 1,_1) )
# 367 "src/opamBaseParser.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 99 "./opam-file-format/src/opamBaseParser.mly"
                             ( Int (get_pos 1,_1) )
# 374 "src/opamBaseParser.ml"
               : 'atom))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 100 "./opam-file-format/src/opamBaseParser.mly"
                             ( String (get_pos 1,_1) )
# 381 "src/opamBaseParser.ml"
               : 'atom))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
(* Entry value *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : string -> OpamParserTypes.opamfile)
let value (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 2 lexfun lexbuf : OpamParserTypes.value)
;;
# 104 "./opam-file-format/src/opamBaseParser.mly"

let main t l f =
  try
    let r = main t l f in
    Parsing.clear_parser ();
    r
  with
  | e ->
    Parsing.clear_parser ();
    raise e
# 421 "src/opamBaseParser.ml"
