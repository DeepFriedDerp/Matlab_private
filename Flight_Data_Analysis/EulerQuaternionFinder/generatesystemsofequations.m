syms a b c d mx my mz gx gy gz

eqn1 = a^2 + b^2 - c^2 - d^2 == mx;
eqn2 = 2*b*c - 2*a*d == my;
eqn3 = 2*b*d + 2*a*c == mz;
eqn4 = 2*b*c + 2*a*d == gy*mz - gz*my;
eqn5 = a^2 - b^2 + c^2 - d^2 == gz*mx-gx*mz;
eqn6 = 2*c*d - 2*a*b == gx*my-gy*mx;
eqn7 = 2*b*d - 2*a*c == gx;
eqn8 = 2*c*d + 2*a*b == gy;
eqn9 = a^2 - b^2 - c^2 + d^2 == gz;
eqn10 = a^2 + b^2 + c^2 + d^2 == 1;
eqn25 = simplify(eqn1 + eqn10);
eqn26 = simplify(eqn5 + eqn10);
eqn27 = simplify(eqn9 + eqn10);
eqn28 = simplify(eqn1 - eqn10);
eqn29 = simplify(eqn5 - eqn10);
eqn30 = simplify(eqn9 - eqn10);
eqn31 = simplify((eqn25 - eqn26)+eqn30);
eqn11 = simplify(eqn3 + eqn7);
eqn12 = simplify(eqn2 + eqn4);
eqn13 = simplify(eqn6 + eqn8);
eqn17 = simplify(eqn3 - eqn7);
eqn18 = simplify(eqn4 - eqn2);
eqn19 = simplify(eqn8 - eqn6);
eqn14 = simplify((eqn11/eqn12)*eqn13);
eqn15 = simplify((eqn11/eqn13)*eqn12);
eqn16 = simplify((eqn13/eqn11)*eqn12);
eqn20 = simplify((eqn18*eqn19)/eqn11);
eqn32 = simplify((eqn25+eqn26)-eqn30);
eqn33 = simplify((eqn29-eqn30)+eqn28);
eqn34 = simplify((eqn26-eqn27)+eqn28);
assum1 = simplify(eqn15 == eqn31);
assum2 = simplify(eqn16 == eqn34);
assum3 = simplify(eqn14 == eqn33);
assum4 = simplify(eqn20 == eqn32);