function [aeroForces] = paramSpace_1_1_2_1_2_1_3(sailStates,airStates)

	CL = (6.150232)*sailStates.alpha + (-0.663729)*sailStates.beta + (-3.497504)*sailStates.p + (49.306328)*sailStates.q + (-3.425638)*sailStates.r + (0.012471)*sailStates.de;
	CD = -2.429200;
	CY = (-0.413463)*sailStates.alpha + (-0.026316)*sailStates.beta + (-1.327274)*sailStates.p + (0.589407)*sailStates.q + (-0.234034)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (2.090244)*sailStates.alpha + (0.428344)*sailStates.beta + (-1.962066)*sailStates.p + (18.945597)*sailStates.q + (-2.944465)*sailStates.r + (0.001595)*sailStates.de;
	Cm = (-10.402469)*sailStates.alpha + (2.495644)*sailStates.beta + (9.748679)*sailStates.p + (-158.590912)*sailStates.q + (11.396891)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (1.898210)*sailStates.alpha + (0.116781)*sailStates.beta + (2.686013)*sailStates.p + (-11.238106)*sailStates.q + (0.015431)*sailStates.r + (-0.000441)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end