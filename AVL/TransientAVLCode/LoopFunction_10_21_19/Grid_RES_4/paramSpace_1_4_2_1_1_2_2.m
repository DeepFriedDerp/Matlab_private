function [aeroForces] = paramSpace_1_4_2_1_1_2_2(sailStates,airStates)

	CL = (3.748356)*sailStates.alpha + (0.155236)*sailStates.beta + (-2.510028)*sailStates.p + (34.763565)*sailStates.q + (-0.557055)*sailStates.r + (0.010440)*sailStates.de;
	CD = 0.062890;
	CY = (-0.200657)*sailStates.alpha + (-0.030256)*sailStates.beta + (0.037308)*sailStates.p + (-1.664521)*sailStates.q + (0.007481)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (1.071627)*sailStates.alpha + (0.080898)*sailStates.beta + (-1.137442)*sailStates.p + (9.151845)*sailStates.q + (-0.324688)*sailStates.r + (0.000311)*sailStates.de;
	Cm = (-13.629869)*sailStates.alpha + (-0.605892)*sailStates.beta + (8.674397)*sailStates.p + (-136.195908)*sailStates.q + (1.937450)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.366650)*sailStates.alpha + (0.019723)*sailStates.beta + (-0.231673)*sailStates.p + (2.987922)*sailStates.q + (-0.065780)*sailStates.r + (0.000489)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end