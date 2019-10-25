function [aeroForces] = paramSpace_4_3_1_1_3_3_2(sailStates,airStates)

	CL = (5.533119)*sailStates.alpha + (-0.212792)*sailStates.beta + (-2.700449)*sailStates.p + (42.866997)*sailStates.q + (2.798962)*sailStates.r + (0.012350)*sailStates.de;
	CD = -1.813630;
	CY = (0.239856)*sailStates.alpha + (-0.026573)*sailStates.beta + (0.967436)*sailStates.p + (1.664524)*sailStates.q + (-0.192614)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.095251)*sailStates.alpha + (-0.609860)*sailStates.beta + (-1.232189)*sailStates.p + (11.712503)*sailStates.q + (2.377637)*sailStates.r + (0.000402)*sailStates.de;
	Cm = (-9.862988)*sailStates.alpha + (0.783366)*sailStates.beta + (7.283786)*sailStates.p + (-137.222183)*sailStates.q + (-9.266400)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (-0.106548)*sailStates.alpha + (0.109167)*sailStates.beta + (-2.068961)*sailStates.p + (7.444753)*sailStates.q + (-0.012574)*sailStates.r + (-0.000273)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end