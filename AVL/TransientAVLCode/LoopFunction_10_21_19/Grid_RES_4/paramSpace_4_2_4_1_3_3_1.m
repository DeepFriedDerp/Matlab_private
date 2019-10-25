function [aeroForces] = paramSpace_4_2_4_1_3_3_1(sailStates,airStates)

	CL = (5.301775)*sailStates.alpha + (0.218326)*sailStates.beta + (-1.846246)*sailStates.p + (35.747322)*sailStates.q + (2.480637)*sailStates.r + (0.011677)*sailStates.de;
	CD = -1.823630;
	CY = (-0.014478)*sailStates.alpha + (-0.022260)*sailStates.beta + (0.905408)*sailStates.p + (2.326711)*sailStates.q + (-0.179847)*sailStates.r + (0.000486)*sailStates.de;

	Cl = (0.562202)*sailStates.alpha + (-0.494334)*sailStates.beta + (-0.563258)*sailStates.p + (5.379159)*sailStates.q + (2.172620)*sailStates.r + (-0.000626)*sailStates.de;
	Cm = (-8.228375)*sailStates.alpha + (-0.862485)*sailStates.beta + (4.504489)*sailStates.p + (-113.341965)*sailStates.q + (-8.262918)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (1.389360)*sailStates.alpha + (0.108375)*sailStates.beta + (-2.047378)*sailStates.p + (7.226132)*sailStates.q + (-0.003361)*sailStates.r + (-0.000526)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end