function [aeroForces] = paramSpace_1_3_2_1_3_1_2(sailStates,airStates)

	CL = (7.823059)*sailStates.alpha + (0.266839)*sailStates.beta + (-2.600654)*sailStates.p + (43.512634)*sailStates.q + (-3.668880)*sailStates.r + (0.012152)*sailStates.de;
	CD = -3.067050;
	CY = (0.259081)*sailStates.alpha + (-0.023148)*sailStates.beta + (-1.525418)*sailStates.p + (1.664521)*sailStates.q + (-0.303484)*sailStates.r + (0.000352)*sailStates.de;

	Cl = (3.021019)*sailStates.alpha + (0.775459)*sailStates.beta + (-1.170345)*sailStates.p + (11.890410)*sailStates.q + (-3.124212)*sailStates.r + (0.000178)*sailStates.de;
	Cm = (-12.157487)*sailStates.alpha + (-1.002610)*sailStates.beta + (6.124196)*sailStates.p + (-132.472137)*sailStates.q + (12.117152)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.464785)*sailStates.alpha + (0.133486)*sailStates.beta + (3.228646)*sailStates.p + (-15.041688)*sailStates.q + (0.067108)*sailStates.r + (-0.000725)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end