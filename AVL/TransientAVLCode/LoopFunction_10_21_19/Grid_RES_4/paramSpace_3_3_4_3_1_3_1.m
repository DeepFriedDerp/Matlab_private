function [aeroForces] = paramSpace_3_3_4_3_1_3_1(sailStates,airStates)

	CL = (4.371058)*sailStates.alpha + (-0.089352)*sailStates.beta + (-2.318108)*sailStates.p + (33.693733)*sailStates.q + (1.094484)*sailStates.r + (0.011029)*sailStates.de;
	CD = -0.244320;
	CY = (-0.106788)*sailStates.alpha + (-0.024776)*sailStates.beta + (0.476267)*sailStates.p + (-0.432842)*sailStates.q + (-0.031262)*sailStates.r + (-0.000093)*sailStates.de;

	Cl = (1.256658)*sailStates.alpha + (-0.243701)*sailStates.beta + (-0.981228)*sailStates.p + (7.827990)*sailStates.q + (0.952089)*sailStates.r + (-0.000052)*sailStates.de;
	Cm = (-14.349929)*sailStates.alpha + (0.367633)*sailStates.beta + (7.681018)*sailStates.p + (-129.813766)*sailStates.q + (-3.734019)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (0.372469)*sailStates.alpha + (0.013889)*sailStates.beta + (-0.985879)*sailStates.p + (4.509571)*sailStates.q + (0.006199)*sailStates.r + (0.000186)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end