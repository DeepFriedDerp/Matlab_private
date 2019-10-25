function [aeroForces] = paramSpace_1_3_3_3_2_2_1(sailStates,airStates)

	CL = (3.876747)*sailStates.alpha + (0.060698)*sailStates.beta + (-2.229792)*sailStates.p + (33.121006)*sailStates.q + (-0.881469)*sailStates.r + (0.010559)*sailStates.de;
	CD = 0.057810;
	CY = (-0.004136)*sailStates.alpha + (-0.025177)*sailStates.beta + (-0.183531)*sailStates.p + (-0.194783)*sailStates.q + (-0.036514)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.045074)*sailStates.alpha + (0.117270)*sailStates.beta + (-0.941704)*sailStates.p + (7.725512)*sailStates.q + (-0.580007)*sailStates.r + (-0.000040)*sailStates.de;
	Cm = (-13.740472)*sailStates.alpha + (-0.209962)*sailStates.beta + (7.366579)*sailStates.p + (-127.822792)*sailStates.q + (2.955545)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (0.021111)*sailStates.alpha + (0.020635)*sailStates.beta + (0.277089)*sailStates.p + (-0.663697)*sailStates.q + (-0.023019)*sailStates.r + (0.000032)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end