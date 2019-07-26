/// @description read_code_point_from_utf8()
{
  var code_unit1, code_unit2, code_unit3, code_unit4;
 
  code_unit1 = utf_getchar();
  if (code_unit1 < $80) {
    return code_unit1;
  } else if (code_unit1 < $C2) {
    /* continuation or overlong 2-byte sequence */
    //goto ERROR1;
    return code_unit1 + $DC00;
  } else if (code_unit1 < $E0) {
    /* 2-byte sequence */
    code_unit2 = utf_getchar();
    if ((code_unit2 & $C0) != $80) {
        //goto ERROR2;
        utf_ungetc(code_unit2);
        return code_unit1 + $DC00;
    }
    return (code_unit1 << 6) + code_unit2 - $3080;
  } else if (code_unit1 < $F0) {
    /* 3-byte sequence */
    code_unit2 = utf_getchar();
    if ((code_unit2 & $C0) != $80) {
        //goto ERROR2;
        utf_ungetc(code_unit2);
        return code_unit1 + $DC00;
     }
    if (code_unit1 == $E0 && code_unit2 < $A0) {
        //goto ERROR2;
        utf_ungetc(code_unit2);
        return code_unit1 + $DC00;
    }
    code_unit3 = utf_getchar();
    if ((code_unit3 & $C0) != $80) {
        //goto ERROR3;
        utf_ungetc(code_unit3);
        utf_ungetc(code_unit2);
        return code_unit1 + $DC00;
        }
    return (code_unit1 << 12) + (code_unit2 << 6) + code_unit3 - $E2080;
  } else if (code_unit1 < $F5) {
    /* 4-byte sequence */
    code_unit2 = utf_getchar();
    if ((code_unit2 & $C0) != $80) {
        //goto ERROR2;
        utf_ungetc(code_unit2);
        return code_unit1 + $DC00;
    }
    if (code_unit1 == $F0 && code_unit2 < $90) {
        //goto ERROR2;
        utf_ungetc(code_unit2);
        return code_unit1 + $DC00;
    } /* overlong */
    if (code_unit1 == $F4 && code_unit2 >= $90){
        //goto ERROR2;
        utf_ungetc(code_unit2);
        return code_unit1 + $DC00;
    } /* > U+10FFFF */
    code_unit3 = utf_getchar();
    if ((code_unit3 & $C0) != $80) {
        //goto ERROR3;
        utf_ungetc(code_unit3);
        utf_ungetc(code_unit2);
        return code_unit1 + $DC00;
        }
    code_unit4 = utf_getchar();
    if ((code_unit4 & $C0) != $80) {
        //goto ERROR4;
        utf_ungetc(code_unit4);
        utf_ungetc(code_unit3);
        utf_ungetc(code_unit2);
        return code_unit1 + $DC00;
        }
    return (code_unit1 << 18) + (code_unit2 << 12) + (code_unit3 << 6) + code_unit4 - $3C82080;
  } else {
    /* > U+10FFFF */
    //goto ERROR1;
    return code_unit1 + $DC00;
  }
 
  //ERROR4:
  //  utf_ungetc(code_unit);
  //ERROR3:
  //  utf_ungetc(code_unit3);
  //ERROR2:
  //  utf_ungetc(code_unit2);
  //ERROR1:
  //  return code_unit1 + $DC00;
}
