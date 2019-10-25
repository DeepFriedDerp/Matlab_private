function [aeroForces] = paramSpace_3_2_3_1_1_2_1(sailStates,airStates)

	CL = (3.914735)*sailStates.alpha + (0.041987)*sailStates.beta + (-1.664837)*sailStates.p + (27.902863)*sailStates.q + (0.663414)*sailStates.r + (0.010632)*sailStates.de;
	CD = -0.037110;
	CY = (-0.304491)*sailStates.alpha + (-0.025553)*sailStates.beta + (0.320874)*sailStates.p + (-1.471502)*sailStates.q + (-0.021083)*sailStates.r + (-0.000312)*sailStates.de;

	Cl = (0.779277)*sailStates.alpha + (-0.087671)*sailStates.beta + (-0.490999)*sailStates.p + (3.312100)*sailStates.q + (0.507881)*sailStates.r + (-0.000798)*sailStates.de;
	Cm = (-13.832903)*sailStates.alpha + (-0.158845)*sailStates.beta + (5.607439)*sailStates.p + (-112.102478)*sailStates.q + (-2.239032)*sailStates.r + (-0.067743)*sailStates.de;
	Cn = (0.667560)*sailStates.alpha + (0.007435)*sailStates.beta + (-0.647592)*sailStates.p + (3.968327)*sailStates.q + (0.011315)*sailStates.r + (0.000458)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end