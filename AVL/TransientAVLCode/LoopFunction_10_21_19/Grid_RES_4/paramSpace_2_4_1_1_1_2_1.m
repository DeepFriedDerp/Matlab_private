function [aeroForces] = paramSpace_2_4_1_1_1_2_1(sailStates,airStates)

	CL = (3.771713)*sailStates.alpha + (0.023298)*sailStates.beta + (-1.679230)*sailStates.p + (27.465864)*sailStates.q + (0.216512)*sailStates.r + (0.010441)*sailStates.de;
	CD = -0.003770;
	CY = (-0.311752)*sailStates.alpha + (-0.027437)*sailStates.beta + (0.212691)*sailStates.p + (-1.915493)*sailStates.q + (0.014143)*sailStates.r + (-0.000404)*sailStates.de;

	Cl = (0.572886)*sailStates.alpha + (-0.048641)*sailStates.beta + (-0.437764)*sailStates.p + (2.372996)*sailStates.q + (0.197989)*sailStates.r + (-0.000891)*sailStates.de;
	Cm = (-13.811197)*sailStates.alpha + (-0.188386)*sailStates.beta + (5.926877)*sailStates.p + (-112.650780)*sailStates.q + (-0.681140)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (0.550270)*sailStates.alpha + (0.001548)*sailStates.beta + (-0.451823)*sailStates.p + (3.574159)*sailStates.q + (-0.015315)*sailStates.r + (0.000585)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end