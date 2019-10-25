function [aeroForces] = paramSpace_1_3_4_2_1_2_2(sailStates,airStates)

	CL = (3.873974)*sailStates.alpha + (0.049278)*sailStates.beta + (-2.503574)*sailStates.p + (35.084553)*sailStates.q + (-0.779844)*sailStates.r + (0.010771)*sailStates.de;
	CD = 0.065810;
	CY = (-0.094297)*sailStates.alpha + (-0.025702)*sailStates.beta + (-0.079779)*sailStates.p + (-0.756269)*sailStates.q + (-0.015950)*sailStates.r + (-0.000160)*sailStates.de;

	Cl = (1.139273)*sailStates.alpha + (0.086434)*sailStates.beta + (-1.161737)*sailStates.p + (9.665586)*sailStates.q + (-0.479991)*sailStates.r + (0.000340)*sailStates.de;
	Cm = (-14.051177)*sailStates.alpha + (-0.151387)*sailStates.beta + (8.445181)*sailStates.p + (-135.926239)*sailStates.q + (2.614954)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (0.234856)*sailStates.alpha + (0.015882)*sailStates.beta + (0.025362)*sailStates.p + (1.017164)*sailStates.q + (-0.044639)*sailStates.r + (0.000193)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end