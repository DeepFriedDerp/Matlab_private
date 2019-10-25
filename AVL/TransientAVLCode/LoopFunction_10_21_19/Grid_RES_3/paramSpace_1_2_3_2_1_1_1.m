function [aeroForces] = paramSpace_1_2_3_2_1_1_1(sailStates,airStates)

	CL = (4.303041)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.201624)*sailStates.p + (34.987461)*sailStates.q + (-1.554881)*sailStates.r + (0.011307)*sailStates.de;
	CD = -0.356780;
	CY = (-0.053189)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.485655)*sailStates.p + (-1.027330)*sailStates.q + (-0.085732)*sailStates.r + (-0.000217)*sailStates.de;

	Cl = (0.990121)*sailStates.alpha + (0.283816)*sailStates.beta + (-0.888864)*sailStates.p + (7.637219)*sailStates.q + (-1.246934)*sailStates.r + (-0.000133)*sailStates.de;
	Cm = (-12.561757)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.690743)*sailStates.p + (-125.588745)*sailStates.q + (5.180391)*sailStates.r + (-0.067412)*sailStates.de;
	Cn = (-0.291534)*sailStates.alpha + (0.050044)*sailStates.beta + (1.025889)*sailStates.p + (-3.602129)*sailStates.q + (-0.011382)*sailStates.r + (0.000202)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end