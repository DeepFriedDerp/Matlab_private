function [aeroForces] = paramSpace_4_3_3_3_3_1_3(sailStates,airStates)

	CL = (3.922668)*sailStates.alpha + (-0.019726)*sailStates.beta + (-2.694974)*sailStates.p + (35.033493)*sailStates.q + (0.305029)*sailStates.r + (0.010256)*sailStates.de;
	CD = -0.084950;
	CY = (0.021750)*sailStates.alpha + (-0.025300)*sailStates.beta + (-0.120951)*sailStates.p + (0.294836)*sailStates.q + (0.024069)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.299326)*sailStates.alpha + (0.041425)*sailStates.beta + (-1.346100)*sailStates.p + (11.050646)*sailStates.q + (0.052462)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-14.413011)*sailStates.alpha + (0.070191)*sailStates.beta + (9.575994)*sailStates.p + (-142.570129)*sailStates.q + (-1.096535)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (-0.253184)*sailStates.alpha + (-0.006806)*sailStates.beta + (0.507470)*sailStates.p + (-3.428789)*sailStates.q + (-0.058151)*sailStates.r + (-0.000132)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end