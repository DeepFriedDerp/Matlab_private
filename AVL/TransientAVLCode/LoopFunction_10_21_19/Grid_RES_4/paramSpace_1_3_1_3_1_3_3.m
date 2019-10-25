function [aeroForces] = paramSpace_1_3_1_3_1_3_3(sailStates,airStates)

	CL = (3.868041)*sailStates.alpha + (0.026498)*sailStates.beta + (-2.694221)*sailStates.p + (35.082344)*sailStates.q + (-0.313766)*sailStates.r + (0.010168)*sailStates.de;
	CD = -0.057760;
	CY = (-0.023376)*sailStates.alpha + (-0.025320)*sailStates.beta + (0.106409)*sailStates.p + (-0.294836)*sailStates.q + (0.021198)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.295005)*sailStates.alpha + (-0.033854)*sailStates.beta + (-1.345735)*sailStates.p + (11.052858)*sailStates.q + (-0.076139)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-14.208231)*sailStates.alpha + (-0.114773)*sailStates.beta + (9.565726)*sailStates.p + (-142.570129)*sailStates.q + (1.148154)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (0.258397)*sailStates.alpha + (-0.005260)*sailStates.beta + (-0.485505)*sailStates.p + (3.417665)*sailStates.q + (-0.058766)*sailStates.r + (0.000143)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end