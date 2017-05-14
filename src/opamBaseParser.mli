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

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> string -> OpamParserTypes.opamfile
val value :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> OpamParserTypes.value
