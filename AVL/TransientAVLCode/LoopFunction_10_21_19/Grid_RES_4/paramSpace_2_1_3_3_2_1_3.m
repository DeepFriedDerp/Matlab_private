function [aeroForces] = paramSpace_2_1_3_3_2_1_3(sailStates,airStates)

	CL = (4.202519)*sailStates.alpha + (-0.215123)*sailStates.beta + (-2.824521)*sailStates.p + (37.583893)*sailStates.q + (-1.013094)*sailStates.r + (0.011173)*sailStates.de;
	CD = -0.186740;
	CY = (-0.033506)*sailStates.alpha + (-0.024849)*sailStates.beta + (-0.386459)*sailStates.p + (0.065298)*sailStates.q + (-0.025328)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.463335)*sailStates.alpha + (0.121702)*sailStates.beta + (-1.465729)*sailStates.p + (12.494885)*sailStates.q + (-0.856530)*sailStates.r + (0.000811)*sailStates.de;
	Cm = (-14.090741)*sailStates.alpha + (0.795061)*sailStates.beta + (9.415495)*sailStates.p + (-143.297119)*sailStates.q + (3.421480)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.128352)*sailStates.alpha + (0.012942)*sailStates.beta + (0.786834)*sailStates.p + (-3.348051)*sailStates.q + (0.001702)*sailStates.r + (-0.000096)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end