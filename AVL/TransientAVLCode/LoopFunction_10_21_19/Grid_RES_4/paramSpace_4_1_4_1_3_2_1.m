function [aeroForces] = paramSpace_4_1_4_1_3_2_1(sailStates,airStates)

	CL = (3.516596)*sailStates.alpha + (0.127706)*sailStates.beta + (-1.657461)*sailStates.p + (27.546144)*sailStates.q + (0.220616)*sailStates.r + (0.009969)*sailStates.de;
	CD = 0.054050;
	CY = (0.323939)*sailStates.alpha + (-0.016657)*sailStates.beta + (-0.128465)*sailStates.p + (2.326709)*sailStates.q + (0.025803)*sailStates.r + (0.000482)*sailStates.de;

	Cl = (0.668348)*sailStates.alpha + (-0.023476)*sailStates.beta + (-0.532045)*sailStates.p + (3.604956)*sailStates.q + (0.084989)*sailStates.r + (-0.000540)*sailStates.de;
	Cm = (-12.958906)*sailStates.alpha + (-0.575874)*sailStates.beta + (5.914956)*sailStates.p + (-112.315697)*sailStates.q + (-0.834146)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (-0.477046)*sailStates.alpha + (-0.004883)*sailStates.beta + (0.309645)*sailStates.p + (-3.386286)*sailStates.q + (-0.058080)*sailStates.r + (-0.000685)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end