function [aeroForces] = paramSpace_1_2_1_2_3_2_3(sailStates,airStates)

	CL = (3.911664)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.872608)*sailStates.p + (38.704380)*sailStates.q + (-1.227079)*sailStates.r + (0.010837)*sailStates.de;
	CD = 0.053220;
	CY = (0.068165)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.381808)*sailStates.p + (1.027328)*sailStates.q + (-0.067421)*sailStates.r + (0.000220)*sailStates.de;

	Cl = (1.439432)*sailStates.alpha + (0.149933)*sailStates.beta + (-1.482241)*sailStates.p + (12.985476)*sailStates.q + (-0.910341)*sailStates.r + (0.000810)*sailStates.de;
	Cm = (-13.577190)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.345076)*sailStates.p + (-145.469635)*sailStates.q + (4.134334)*sailStates.r + (-0.069407)*sailStates.de;
	Cn = (0.202555)*sailStates.alpha + (0.026437)*sailStates.beta + (0.589550)*sailStates.p + (-2.416887)*sailStates.q + (-0.010551)*sailStates.r + (-0.000328)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end