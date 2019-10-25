function [aeroForces] = paramSpace_1_4_4_3_1_1_1(sailStates,airStates)

	CL = (4.034786)*sailStates.alpha + (0.295126)*sailStates.beta + (-2.275965)*sailStates.p + (35.053234)*sailStates.q + (-1.401673)*sailStates.r + (0.010942)*sailStates.de;
	CD = -0.128660;
	CY = (-0.045434)*sailStates.alpha + (-0.026751)*sailStates.beta + (-0.392840)*sailStates.p + (-0.684401)*sailStates.q + (-0.078214)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (0.982773)*sailStates.alpha + (0.308157)*sailStates.beta + (-0.926536)*sailStates.p + (7.841914)*sailStates.q + (-1.056006)*sailStates.r + (-0.000095)*sailStates.de;
	Cm = (-12.741786)*sailStates.alpha + (-1.021337)*sailStates.beta + (7.048827)*sailStates.p + (-127.495163)*sailStates.q + (4.653234)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (-0.138942)*sailStates.alpha + (0.045459)*sailStates.beta + (0.784952)*sailStates.p + (-2.703726)*sailStates.q + (-0.017406)*sailStates.r + (0.000118)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end