function [aeroForces] = paramSpace_5_1_1_2_2_2_1(sailStates,airStates)

	CL = (4.019222)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.310141)*sailStates.p + (32.373852)*sailStates.q + (-0.068077)*sailStates.r + (0.010602)*sailStates.de;
	CD = -0.021190;
	CY = (0.034530)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.058169)*sailStates.p + (0.322048)*sailStates.q + (0.006080)*sailStates.r + (0.000069)*sailStates.de;

	Cl = (1.132438)*sailStates.alpha + (-0.042056)*sailStates.beta + (-1.015152)*sailStates.p + (7.937716)*sailStates.q + (0.051755)*sailStates.r + (0.000048)*sailStates.de;
	Cm = (-14.661040)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.052971)*sailStates.p + (-130.700150)*sailStates.q + (0.262847)*sailStates.r + (-0.069118)*sailStates.de;
	Cn = (0.126994)*sailStates.alpha + (-0.004420)*sailStates.beta + (-0.247391)*sailStates.p + (1.296510)*sailStates.q + (-0.009544)*sailStates.r + (-0.000055)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end