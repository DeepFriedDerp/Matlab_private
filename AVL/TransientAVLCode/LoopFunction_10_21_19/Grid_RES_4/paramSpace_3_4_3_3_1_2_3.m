function [aeroForces] = paramSpace_3_4_3_3_1_2_3(sailStates,airStates)

	CL = (3.987576)*sailStates.alpha + (-0.102640)*sailStates.beta + (-2.802213)*sailStates.p + (36.847050)*sailStates.q + (0.499798)*sailStates.r + (0.010985)*sailStates.de;
	CD = 0.023530;
	CY = (-0.051571)*sailStates.alpha + (-0.024125)*sailStates.beta + (0.173591)*sailStates.p + (-0.563442)*sailStates.q + (-0.011398)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.287146)*sailStates.alpha + (-0.096364)*sailStates.beta + (-1.359397)*sailStates.p + (11.089603)*sailStates.q + (0.369924)*sailStates.r + (0.000540)*sailStates.de;
	Cm = (-14.341582)*sailStates.alpha + (0.396687)*sailStates.beta + (9.499817)*sailStates.p + (-143.062881)*sailStates.q + (-1.696863)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (-0.011266)*sailStates.alpha + (0.003734)*sailStates.beta + (-0.288342)*sailStates.p + (1.411723)*sailStates.q + (0.000492)*sailStates.r + (0.000179)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end