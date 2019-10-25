function [aeroForces] = paramSpace_1_3_4_2_3_2_3(sailStates,airStates)

	CL = (3.974568)*sailStates.alpha + (0.074351)*sailStates.beta + (-2.846516)*sailStates.p + (38.635929)*sailStates.q + (-1.322191)*sailStates.r + (0.010961)*sailStates.de;
	CD = 0.031040;
	CY = (0.074873)*sailStates.alpha + (-0.023962)*sailStates.beta + (-0.367882)*sailStates.p + (1.057313)*sailStates.q + (-0.073063)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (1.405681)*sailStates.alpha + (0.171457)*sailStates.beta + (-1.452042)*sailStates.p + (12.807211)*sailStates.q + (-0.924979)*sailStates.r + (0.000754)*sailStates.de;
	Cm = (-13.859165)*sailStates.alpha + (-0.234319)*sailStates.beta + (9.179331)*sailStates.p + (-144.624466)*sailStates.q + (4.379018)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (0.195200)*sailStates.alpha + (0.028383)*sailStates.beta + (0.568853)*sailStates.p + (-2.503283)*sailStates.q + (-0.013856)*sailStates.r + (-0.000373)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end