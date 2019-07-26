//write_utf8(unsigned code_point)
var code_point = argument0;
  if (code_point < $80) {
    utf_putchar(code_point);
  } else if (code_point <= $7FF) {
    utf_putchar((code_point >> 6) + $C0);
    utf_putchar((code_point & $3F) + $80);
  } else if (code_point <= $FFFF) {
    utf_putchar((code_point >> 12) + $E0);
    utf_putchar(((code_point >> 6) & $3F) + $80);
    utf_putchar((code_point & $3F) + $80);
  } else if (code_point <= $10FFFF) {
    utf_putchar((code_point >> 18) + $F0);
    utf_putchar(((code_point >> 12) & $3F) + $80);
    utf_putchar(((code_point >> 6) & $3F) + $80);
    utf_putchar((code_point & $3F) + $80);
  } else {
    utf_error("UTF_ERROR invalid code_point");
  }

