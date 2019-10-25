function [aeroForces] = paramSpace_3_4_1_1_2_1_3(sailStates,airStates)

	CL = (5.872214)*sailStates.alpha + (0.465595)*sailStates.beta + (-3.374333)*sailStates.p + (39.186424)*sailStates.q + (-1.790000)*sailStates.r + (0.010839)*sailStates.de;
	CD = -2.220530;
	CY = (-0.379273)*sailStates.alpha + (-0.024620)*sailStates.beta + (-0.961701)*sailStates.p + (-0.221996)*sailStates.q + (0.063057)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (1.856310)*sailStates.alpha + (0.601472)*sailStates.beta + (-1.854583)*sailStates.p + (15.111049)*sailStates.q + (-1.797256)*sailStates.r + (0.001384)*sailStates.de;
	Cm = (-14.196883)*sailStates.alpha + (-1.935873)*sailStates.beta + (12.142861)*sailStates.p + (-160.446381)*sailStates.q + (6.109728)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (0.976837)*sailStates.alpha + (-0.028159)*sailStates.beta + (2.260619)*sailStates.p + (-10.399428)*sailStates.q + (-0.022826)*sailStates.r + (-0.000130)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end