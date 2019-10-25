function [aeroForces] = paramSpace_1_2_3_3_2_2_1(sailStates,airStates)

	CL = (3.876747)*sailStates.alpha + (-0.060698)*sailStates.beta + (-2.229792)*sailStates.p + (33.121006)*sailStates.q + (-0.881469)*sailStates.r + (0.010559)*sailStates.de;
	CD = 0.057810;
	CY = (-0.004136)*sailStates.alpha + (-0.024776)*sailStates.beta + (-0.183531)*sailStates.p + (-0.194783)*sailStates.q + (-0.036514)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.095417)*sailStates.alpha + (0.081140)*sailStates.beta + (-0.973248)*sailStates.p + (8.122477)*sailStates.q + (-0.586267)*sailStates.r + (0.000045)*sailStates.de;
	Cm = (-13.740472)*sailStates.alpha + (0.209962)*sailStates.beta + (7.366579)*sailStates.p + (-127.822792)*sailStates.q + (2.955545)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (0.040149)*sailStates.alpha + (0.018832)*sailStates.beta + (0.270815)*sailStates.p + (-0.584736)*sailStates.q + (-0.024264)*sailStates.r + (0.000032)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end