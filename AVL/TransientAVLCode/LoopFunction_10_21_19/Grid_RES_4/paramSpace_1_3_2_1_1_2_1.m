function [aeroForces] = paramSpace_1_3_2_1_1_2_1(sailStates,airStates)

	CL = (3.620529)*sailStates.alpha + (0.036605)*sailStates.beta + (-1.676803)*sailStates.p + (27.767275)*sailStates.q + (-0.221014)*sailStates.r + (0.010211)*sailStates.de;
	CD = 0.036150;
	CY = (-0.330962)*sailStates.alpha + (-0.027531)*sailStates.beta + (0.140903)*sailStates.p + (-2.326708)*sailStates.q + (0.028111)*sailStates.r + (-0.000486)*sailStates.de;

	Cl = (0.573875)*sailStates.alpha + (0.022852)*sailStates.beta + (-0.478205)*sailStates.p + (2.885692)*sailStates.q + (-0.055096)*sailStates.r + (-0.000710)*sailStates.de;
	Cm = (-13.372044)*sailStates.alpha + (-0.151211)*sailStates.beta + (5.985244)*sailStates.p + (-113.341965)*sailStates.q + (0.818655)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (0.466572)*sailStates.alpha + (0.007484)*sailStates.beta + (-0.316092)*sailStates.p + (3.234720)*sailStates.q + (-0.055065)*sailStates.r + (0.000686)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end