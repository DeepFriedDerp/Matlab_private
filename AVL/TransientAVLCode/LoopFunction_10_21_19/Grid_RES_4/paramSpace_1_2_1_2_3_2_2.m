function [aeroForces] = paramSpace_1_2_1_2_3_2_2(sailStates,airStates)

	CL = (3.920551)*sailStates.alpha + (-0.088026)*sailStates.beta + (-2.456804)*sailStates.p + (35.479534)*sailStates.q + (-1.192551)*sailStates.r + (0.010500)*sailStates.de;
	CD = 0.059850;
	CY = (0.098270)*sailStates.alpha + (-0.025859)*sailStates.beta + (-0.363524)*sailStates.p + (0.756269)*sailStates.q + (-0.072391)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.324004)*sailStates.alpha + (0.125507)*sailStates.beta + (-1.164445)*sailStates.p + (10.148041)*sailStates.q + (-0.874589)*sailStates.r + (0.000324)*sailStates.de;
	Cm = (-13.445210)*sailStates.alpha + (0.343670)*sailStates.beta + (7.898062)*sailStates.p + (-133.768066)*sailStates.q + (4.012035)*sailStates.r + (-0.067580)*sailStates.de;
	Cn = (-0.000156)*sailStates.alpha + (0.030260)*sailStates.beta + (0.591555)*sailStates.p + (-2.378917)*sailStates.q + (-0.010375)*sailStates.r + (-0.000244)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end