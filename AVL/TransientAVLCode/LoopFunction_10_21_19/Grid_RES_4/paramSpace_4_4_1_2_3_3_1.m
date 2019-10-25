function [aeroForces] = paramSpace_4_4_1_2_3_3_1(sailStates,airStates)

	CL = (4.213871)*sailStates.alpha + (-0.361884)*sailStates.beta + (-2.174316)*sailStates.p + (35.116772)*sailStates.q + (1.640067)*sailStates.r + (0.011127)*sailStates.de;
	CD = -0.354370;
	CY = (0.054227)*sailStates.alpha + (-0.027822)*sailStates.beta + (0.499256)*sailStates.p + (1.057311)*sailStates.q + (-0.099422)*sailStates.r + (0.000221)*sailStates.de;

	Cl = (0.889897)*sailStates.alpha + (-0.389773)*sailStates.beta + (-0.827786)*sailStates.p + (7.083029)*sailStates.q + (1.290299)*sailStates.r + (-0.000254)*sailStates.de;
	Cm = (-12.011228)*sailStates.alpha + (1.285791)*sailStates.beta + (6.461801)*sailStates.p + (-124.043571)*sailStates.q + (-5.439828)*sailStates.r + (-0.065726)*sailStates.de;
	Cn = (0.342300)*sailStates.alpha + (0.058144)*sailStates.beta + (-1.059582)*sailStates.p + (3.758890)*sailStates.q + (-0.013211)*sailStates.r + (-0.000205)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end